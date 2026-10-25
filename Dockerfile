# Upstream nodemailer/wildduck-webmail:latest runs Alpine 3.18's Node 18 (EOL).
# Re-home the app on a patched Node (CVE-2026-111497, Node2Shell).
FROM nodemailer/wildduck-webmail@sha256:5fec0b565aae71c54fc0bff00900c6bcae031ae71489aad2efe4072703ef34b0 AS upstream

FROM node:22.23.4-alpine
ENV APP_PATH=/app
WORKDIR /app
COPY --from=upstream /app /app
COPY --from=upstream /etc/wildduck/www.toml /etc/wildduck/www.toml
ENTRYPOINT ["node", "server.js"]
CMD ["--config=/etc/wildduck/www.toml"]
