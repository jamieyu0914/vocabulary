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
