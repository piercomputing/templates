# Python (FastAPI) — Pier starter template

An async HTTP API built with [FastAPI](https://fastapi.tiangolo.com).

## Run locally

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python main.py
# → http://localhost:8080
```

## Endpoints

- `GET /` — status JSON
- `GET /health` — health probe

The server listens on `$PORT` (default `8080`).

## Deploy on Pier

Instantly from the console — **Deploy → From a template** — or from this
directory with the CLI:

```bash
pier create app
```
