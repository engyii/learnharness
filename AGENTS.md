<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` (resolved from this file's directory; in monorepos the `next` package may not be visible from the repo root) before writing any code. Heed deprecation notices.

This block is written and re-added by `next dev` — verify at `node_modules/next/dist/server/lib/generate-agent-files.js`. Removing it from a diff only re-creates the uncommitted change; committing it with your work keeps the tree clean.

<!-- END:nextjs-agent-rules -->

# No guessing

All design authority belongs to the human. **Never guess a design or implementation decision.** If anything is ambiguous — naming, behavior, data shapes, UX, defaults, scope boundaries, prompt wording — STOP and ask with the ask-user-question tool before proceeding. If you are "a little unsure," you are unsure: ask. A wrong guess is far more expensive than a question. Ask early, ask specific, one question per call.

Concretely: first investigate and plan rigorously (asking the user design questions along the way), get the plan approved by the user, and only then implement. Implementation should be mechanical execution of an approved plan — not interpretation.

# This fork

A fork of [amosblomqvist/learnharness](https://github.com/amosblomqvist/learnharness)
for people who run it on their own server. It is public: everything committed must make
sense to a stranger running their own copy.

Where it is heading. These are directions, not commitments, and they may change:

- Several users on one server, with sign-in through OAuth / OpenID Connect
- Any subject, not only science and mathematics
- Several interface and teaching languages
- Richer visuals, with themes
- Progress that feels like play: goals, streaks, rewards
- AI subscriptions as well as API keys
- Secure and private by default
- An optional link to an Obsidian vault

# Making a change

- **One feature per pull request.** A refactor, a dependency bump or a formatting pass is
  its own pull request. If the description needs "and also", split it.
- **First principles.** Before code, state the problem in a sentence and the smallest
  mechanism that solves it. No abstraction for a case that does not exist yet.
- **General, not personal.** No hostnames, domains, accounts, paths or services from one
  person's setup in code, docs, tests or commit messages. A deployment-specific value is
  configuration, read from the environment or settings, with a safe default.
- **Secure.** Secrets never reach git, logs, error messages or the browser bundle. Every
  new route or listener states who may call it; assume the server is reachable by
  people other than its owner. Validate input where it enters. Dependencies are pinned
  through `package-lock.json`.
- **Private.** Learner data stays on the server that runs the app. Nothing is sent to a
  third party except the providers the user configured, and the docs say what each one
  receives.
- **Easy to merge from upstream.** Keep edits to upstream files small; put new behaviour
  in new modules where you can. Keep the AGPL-3.0 license and notices.
- **Checks.** `npm run typecheck`, `npm test` and `npm run lint` pass. New behaviour gets a
  deterministic test: no network, no live model.

# Writing

Applies to docs, code comments, commit messages and pull requests.

- Plain and short. One idea per sentence; cut words that carry nothing.
- Name things by what they do. No buzzwords or filler ("agentic", "leverage",
  "seamless", "robust", "delve", "supercharge", "unlock"), no emoji, no marketing tone.
  A domain term the code already uses ("teacher", "prober", "extraction") is fine;
  explain it once where a newcomer meets it.
- Say what is true now. History belongs in git: no dates, "owner decided" notes or
  change logs inside docs and comments.
- No working notes in the tree: plans, transcripts and scratch files stay out of
  commits.
- Commit subjects follow the existing style: `feat:`, `fix:`, `docs:`, `ui:`, `ci:`,
  `release:`, then an imperative summary in lower case.
