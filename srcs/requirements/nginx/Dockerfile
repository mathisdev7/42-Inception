FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY tools/script.sh /etc/nginx/tools/script.sh

RUN mkdir -p /etc/nginx/certs /etc/ssl/private

RUN chmod +x /etc/nginx/tools/script.sh

RUN sh /etc/nginx/tools/script.sh

CMD ["nginx", "-g", "daemon off;"]
