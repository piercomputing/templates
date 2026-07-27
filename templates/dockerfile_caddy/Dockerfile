FROM caddy:2-alpine

WORKDIR /usr/share/caddy
COPY . .

CMD ["sh", "-c", "caddy file-server --listen :$PORT --browse"]
