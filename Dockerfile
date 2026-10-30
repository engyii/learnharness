# The web app as one container. State (chats, graph, settings, keys) lives in
# /data: mount a volume there. The server has no login of its own; see
# docs/self-hosting.md before exposing it.

FROM node:26-trixie-slim AS build
WORKDIR /src
ENV NEXT_TELEMETRY_DISABLED=1 ELECTRON_SKIP_BINARY_DOWNLOAD=1
COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY . .
RUN npm run build && node scripts/build-server.mjs

FROM node:26-trixie-slim
# Chromium lets the demo builder run each demo before showing it.
RUN apt-get update \
	&& apt-get install -y --no-install-recommends chromium fonts-liberation \
	&& rm -rf /var/lib/apt/lists/*
ENV NODE_ENV=production \
	NEXT_TELEMETRY_DISABLED=1 \
	HOSTNAME=0.0.0.0 \
	PORT=3000 \
	LH_DATA_DIR=/data \
	LH_AUTH_FILE=/data/auth.json \
	CHROME_PATH=/usr/bin/chromium
WORKDIR /app
COPY --from=build /src/.next/standalone ./
RUN mkdir /data && chown node:node /data
USER node
VOLUME /data
EXPOSE 3000
CMD ["node", "server.js"]
