# Dockerfile (Caddy) — Pier starter template

A custom-Dockerfile starter: [Caddy](https://caddyserver.com) serving static
files. Swap the Dockerfile contents for anything that listens on `$PORT`.

## Run locally

```bash
docker build -t caddy-starter .
docker run -p 8080:8080 -e PORT=8080 caddy-starter
# → http://localhost:8080
```

## Deploy on Pier

Instantly from the console — **Deploy → From a template** — or from this
directory with the CLI:

```bash
pier create app
```
