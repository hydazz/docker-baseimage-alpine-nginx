FROM vcxpz/baseimage-alpine:latest

RUN set -xe && \
	echo "**** install runtime packages ****" && \
	apk add --no-cache \
		apache2-utils \
		curl \
		git \
		libressl3.1-libssl \
		logrotate \
		nano \
		nginx \
		openssl \
		php8 \
		php8-fileinfo \
		php8-fpm \
		php8-json \
		php8-mbstring \
		php8-openssl \
		php8-pear \
		php8-session \
		php8-simplexml \
		php8-xml \
		php8-xmlwriter \
		php8-zlib && \
	echo "**** configure php ****" && \
	ln -s /usr/bin/php8 /usr/bin/php && \
	echo "**** configure nginx ****" && \
	echo 'fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> \
		/etc/nginx/fastcgi_params && \
	rm -f /etc/nginx/conf.d/default.conf && \
	echo "**** fix logrotate ****" && \
	sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
	sed -i 's#/usr/sbin/logrotate /etc/logrotate.conf#/usr/sbin/logrotate /etc/logrotate.conf -s /config/log/logrotate.status#g' \
		/etc/periodic/daily/logrotate && \
	echo "**** cleanup ****" && \
	rm -rf \
		/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
