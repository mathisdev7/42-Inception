FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli

WORKDIR /var/www/html
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xvzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz

CMD ["php-fpm"]
