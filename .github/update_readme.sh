#!/bin/bash

NGINX=$(grep <package_versions.txt -E "nginx.*?-" | sed -n 1p | cut -c 7- | sed -E 's/-r.*//g')
PHP=$(grep <package_versions.txt -E "php.*?-" | sed -n 1p | cut -c 6- | sed -E 's/-r.*//g')

echo "## docker-baseimage-alpine

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/baseimage-alpine-nginx) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/baseimage-alpine-nginx?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-baseimage-alpine-nginx/actions?query=workflow%3A\"Auto+Builder+CI\") [![codacy branch grade](https://img.shields.io/codacy/grade/8416508fb00e42d6a34c984d9d894184/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-baseimage-alpine)

Fork of [linuxserver/docker-baseimage-alpine-nginx](https://github.com/linuxserver/docker-baseimage-alpine-nginx/)

A custom base image built with [Alpine Linux][appurl], [Nginx][nginxurl] and [s6 overlay][s6overlay]

## Version Information

![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![nginx](https://img.shields.io/badge/nginx-${NGINX}-269539?style=for-the-badge&logo=nginx) ![php](https://img.shields.io/badge/php-${PHP}-777BB4?style=for-the-badge&logo=php)

See [package_versions.txt](package_versions.txt) for a full list of the packages and package versions used in this image

**Read the official [README.md](https://github.com/linuxserver/docker-baseimage-alpine-nginx/) for more information**

[appurl]: https://alpinelinux.org
[s6overlay]: https://github.com/just-containers/s6-overlay
[nginxurl]: http://nginx.org/en/" >README.md