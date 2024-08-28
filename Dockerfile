# Use the official Node.js image as the build stage
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package*.json ./

# Initialize npm, create directories, and install Babel dependencies
RUN npm init -y \
    && mkdir -p src/js src/css src/assets \
    && touch src/index.html src/css/styles.css src/js/app.js \
    && npm install --save-dev @babel/core @babel/cli @babel/preset-env

# Copy all source code
COPY . .

# Use the official Nginx base image
FROM nginx:alpine

# Install bash
RUN apk add --no-cache bash

# Copy the built application files to the Nginx default static directory
COPY ./src /usr/share/nginx/html

# Copy custom Nginx configuration file, if you have one
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose the default HTTP port for Nginx
EXPOSE 3000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
