#----- build stage -----
# Start from the official Node.js LTS base image
FROM node:lts AS build

# Set the working directory in the Docker container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# ----- production stage -----
# Start from the official Nginx base image
FROM nginx:alpine AS runtime

# Copy the custom Nginx configuration file from the local host to the Docker container
COPY --chown=node:node ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copy the built app from the build stage to the Nginx public directory
COPY --chown=node:node --from=build /app/dist /usr/share/nginx/html

# Expose the port that the static files will be served on
EXPOSE 8080