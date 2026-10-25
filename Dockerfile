# Upstream nodemailer/wildduck-webmail:latest runs Alpine 3.18's Node 18 (EOL).
# Re-home the app on a patched Node (CVE-2026-111497, Node2Shell).
FROM nodemailer/wildduck-webmail:latest@sha256:0367a948ffb545b3001985313b663364d95f4f07440eb6a41a72628b85704399 AS upstream

FROM node:22.23.4-alpine
ENV APP_PATH=/app
WORKDIR /app
COPY --from=upstream /app /app
COPY --from=upstream /etc/wildduck/www.toml /etc/wildduck/www.toml
ENTRYPOINT ["node", "server.js"]
CMD ["--config=/etc/wildduck/www.toml"]
