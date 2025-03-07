FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY conf/default /etc/nginx/conf.d/default.conf
COPY tools/script.sh /etc/nginx/tools/script.sh

RUN chmod +x /etc/nginx/tools/script.sh

EXPOSE 443

CMD ["sh", "-c", "/usr/sbin/nginx -g 'daemon off;' && sh /etc/nginx/tools/script.sh"]
