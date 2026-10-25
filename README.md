# wildduck-webmail

[WildDuck Webmail](https://github.com/nodemailer/wildduck-webmail) repackaged on a current Node.js base image.

The upstream `nodemailer/wildduck-webmail` image runs Alpine 3.18's Node.js 18, which is end of life.
This image copies the upstream application unchanged onto `node:<version>-alpine`.
Renovate keeps both the upstream image digest and the Node.js base up to date.

Images: `ghcr.io/codemowers/wildduck-webmail:sha-<commit>` and `:latest`.
