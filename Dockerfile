FROM nginx:alpine as proxy

# Add ngnix config file
COPY nginx.conf /etc/nginx/nginx.conf

# Add certifcate (crt and key)
ADD ca.crt /etc/nginx/certs/
ADD server.crt /etc/nginx/certs/
ADD server.key /etc/nginx/certs/

# Add htpasswd database for basic auth
ADD .htpasswd /etc/nginx/

FROM nginx:alpine as web

# Add our content
COPY public-html/index.html /usr/share/nginx/html/index.html