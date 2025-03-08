FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 750 /var/lib/mysql

COPY conf/custom-50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/script_mariadb.sh /usr/local/bin/script_mariadb.sh
RUN chmod +x /usr/local/bin/script_mariadb.sh && \
    ls -l /usr/local/bin/script_mariadb.sh

CMD ["/usr/local/bin/script_mariadb.sh"]
