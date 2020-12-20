FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

# install packages
RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
     apache2-utils \
     curl \
     git \
     imagemagick \
     libressl3.1-libssl \
     libxml2 \
     logrotate \
     memcached \
     nano \
     nginx \
     openssl \
     php7 \
     php7-apcu \
     php7-bcmath \
     php7-bz2 \
     php7-ctype \
     php7-curl \
     php7-dom \
     php7-exif \
     php7-fileinfo \
     php7-fpm \
     php7-ftp \
     php7-gd \
     php7-gmp \
     php7-iconv \
     php7-imagick \
     php7-imap \
     php7-intl \
     php7-ldap \
     php7-mcrypt \
     php7-memcached \
     php7-mysqli \
     php7-mysqlnd \
     php7-opcache \
     php7-pdo_mysql \
     php7-pecl-apcu \
     php7-pecl-redis \
     php7-pgsql \
     php7-phar \
     php7-posix \
     php7-simplexml \
     php7-sodium \
     php7-xml \
     php7-xmlreader \
     php7-xmlrpc \
     php7-xmlwriter \
     php7-zip && \
 echo "**** configure nginx ****" && \
 echo 'fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> \
	/etc/nginx/fastcgi_params && \
 rm -f /etc/nginx/conf.d/default.conf && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 sed -i 's#/usr/sbin/logrotate /etc/logrotate.conf#/usr/sbin/logrotate /etc/logrotate.conf -s /config/log/logrotate.status#g' \
	/etc/periodic/daily/logrotate && \
 echo 'apc.enable_cli=1' >> /etc/php7/conf.d/apcu.ini

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
