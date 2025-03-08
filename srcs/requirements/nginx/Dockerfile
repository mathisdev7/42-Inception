FROM debian:bullseye

RUN apt update && \
    apt install -y nginx vim openssl

RUN mkdir -p /etc/nginx/certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-keyout "/etc/nginx/certs/privkey.pem" -out "/etc/nginx/certs/cert.pem" \
    	-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42Perpignan/CN=mazeghou.42.fr"

RUN mkdir -p /var/run/nginx

COPY ./conf/default.conf /etc/nginx/default.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
