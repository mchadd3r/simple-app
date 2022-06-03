FROM nginx:alpine as proxy

# Add ngnix config file
COPY nginx.conf /etc/nginx/nginx.conf

# Add certifcate (crt and key)
ADD ca.crt /etc/nginx/certs/
ADD server.crt /etc/nginx/certs/
ADD server.key /etc/nginx/certs/

# Add htpasswd database for basic auth
ADD .htpasswd /etc/nginx/

#RUN apk update && apk add bash
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN chown -R www-data:www-data /var/lib/nginx

#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Expose ports 80 to redirect
#EXPOSE 80 443
# Finally execute ngnix
#CMD ["nginx"]

FROM nginx:alpine as web
#COPY ./public-html/ /usr/local/apache2/htdocs/

# Add our content
COPY public-html/index.html /usr/share/nginx/html/index.html