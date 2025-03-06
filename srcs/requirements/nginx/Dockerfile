FROM debian:bullseye

# download and install nginx
RUN apt update && apt install -y nginx openssl

# copy the default configuration file
COPY conf/default /etc/nginx/conf.d/default.conf

COPY tools/script.sh /etc/nginx/tools/script.sh
RUN chmod +x /etc/nginx/tools/script.sh

COPY certs/cert.pem /etc/nginx/certs/cert.pem
COPY certs/privkey.pem /etc/nginx/certs/privkey.pem

# expose port 443
EXPOSE 443

# start nginx with daemon off
CMD ["nginx", "-g", "daemon off;"]
