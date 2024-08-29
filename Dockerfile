# Use the official Node.js image as the build stage
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY ./vocabulary/package*.json ./
RUN npm install 

# Copy all source code and build the application
COPY vocabulary ./
RUN npm run build

# Use the official Nginx base image for the final stage
FROM nginx:alpine

# Install bash (optional, if you need bash for some reason)
RUN apk add --no-cache bash

# Copy custom Nginx configuration file, if you have one
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy the built application files to the Nginx default static directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the default HTTP port for Nginx
EXPOSE 5000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
