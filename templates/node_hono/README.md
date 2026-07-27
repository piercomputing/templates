# Node.js (Hono) — Pier starter template

A minimal HTTP API built with [Hono](https://hono.dev) on the Node.js runtime.

## Run locally

```bash
npm install
node index.js
# → http://localhost:8080
```

## Endpoints

- `GET /` — hello JSON
- `GET /health` — health probe

The server listens on `$PORT` (default `8080`).

## Deploy on Pier

Instantly from the console — **Deploy → From a template** — or from this
directory with the CLI:

```bash
pier create app
```
