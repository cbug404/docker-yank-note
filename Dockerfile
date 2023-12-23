FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
MAINTAINER PG-Party <PG-Party@163.com>

ENV \
    TITLE="Yank-Note" \
    CUSTOM_PORT="8180" \
    CUSTOM_HTTPS_PORT="8281" \ 
    VERSION="3.59.2"
ADD /root /
RUN \
    /app/main.sh 

