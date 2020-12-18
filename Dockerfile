FROM vcxpz/baseimage-alpine

# install packages
RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
     apache2-utils \
     curl \
     git \
     imagemagick \
     libressl3.1-libssl \
     logrotate \
     memcached \
     nano \
     nginx \
     openssl \
     php7-apcu \
     php7-bcmath \
     php7-bz2 \
     php7-ctype \
     php7-curl \
     php7-dom \
     php7-exif \
     php7-fileinfo \
     php7-ftp \
     php7-gd \
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
     php7-sodium \
     php7-xmlreader \
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
