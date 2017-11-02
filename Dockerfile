FROM nmhung1210/nginx-alpine-amplify:1.0.0

LABEL maintainer="Hung Nguyen <nmhung1210@gmail.com>"

ENV NGINX_FPM_AMPLIFY_VERSION 1.0.0

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        php5 \
        php5-common \
        php5-fpm \
        php5-gd \
        php5-mysqli \
        php5-zlib \
        php5-zip \
        php5-curl \
        php5-openssl \
        php5-pdo_mysql \
        php5-mysql \
        php5-pdo \
        php5-mcrypt

VOLUME [ "/usr/share/etc/nginx", "/usr/share/etc/php5", "/var/www/html" ]

EXPOSE 80 443

STOPSIGNAL SIGTERM

COPY conf.d/nginx /etc/nginx
COPY conf.d/php5 /etc/php5

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT []
CMD ["/entrypoint.sh"]