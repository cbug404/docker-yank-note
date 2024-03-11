FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
MAINTAINER cbug404 <cbug404@163.com>

ENV \
    TITLE="Yank-Note" \
    CUSTOM_PORT="8180" \
    CUSTOM_HTTPS_PORT="8281" \ 
    VERSION="3.67.1"
ADD /root /
RUN \
    /app/main.sh 
