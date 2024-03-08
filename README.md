# Astro Blog

[![Netlify Status](https://api.netlify.com/api/v1/badges/6c2b739b-642c-44bd-9592-47000a1d182f/deploy-status)](https://app.netlify.com/sites/lighthearted-taiyaki-7ab65a/deploys)

Personal blog built with Astro.

## Deployment

Two main ways to deploy:
- Manually build with `npm run build` and then copy the contents of `/dist`
- Use docker

To use docker:
1. Build docker image, run `docker build -t <your-image-name> .`
2. Run the image locally, or deploy to a platform
   - To run docker container locally, run `docker run -p <local-port>:<container-port> <your-image-name>`

The Dockerfile will spin up a Nginx server that exposes port 8080 (container-port).

---

## Development

This section is just notes for myself.

### Maintenance

To update Astro, run `npm install astro@latest`

To update Preact integration, run `npm install @astrojs/preact@latest`