# Base image
# Use Nginx to serve static files
FROM nginx:alpine

# Remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy built files to Nginx web root
COPY ./my-web-app/dist /usr/share/nginx/html

# Start the app
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]