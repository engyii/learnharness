# Self-hosting

The web app runs as one container. Every push to `main` publishes
`ghcr.io/<owner>/learnharness:latest`, and a version tag publishes `:<version>`.

```bash
docker run -d --name learnharness \
  -p 127.0.0.1:3000:3000 \
  -v learnharness-data:/data \
  -e OPENROUTER_API_KEY=... \
  ghcr.io/<owner>/learnharness:latest
```

Then open http://127.0.0.1:3000 and choose your models under **Settings → Agent**.

## What to know before exposing it

**The server has no login.** Anyone who can reach the port can read every chat, change
settings, and spend the provider keys. Keep it on localhost, or put it behind something
that authenticates each request: a VPN, an authenticating reverse proxy, or both. The
subscription sign-in flows have the same limits as in development
([development guide](development.md#subscription-connections-in-webdev)).

## Configuration

| Variable | Default | Purpose |
|---|---|---|
| `LH_DATA_DIR` | `/data` | Chats, graph, settings. Back up this directory |
| `LH_AUTH_FILE` | `/data/auth.json` | Keys entered in Settings. Subscription credentials are saved beside it |
| `OPENROUTER_API_KEY` and other provider keys | none | An environment variable wins over the same key saved in Settings |
| `CHROME_PATH` | `/usr/bin/chromium` | The browser the demo builder runs demos in |
| `PORT` | `3000` | Listening port |

The image runs as the unprivileged `node` user (uid 1000), which must be able to write
to `/data`. With a read-only root filesystem, also mount writable directories at `/tmp`
and `/app/.next/server/route-cache`.
