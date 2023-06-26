FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache \
        nginx && apk add --no-cache openssl

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/trubat-d.42.ch.key -out /etc/ssl/trubat-d.42.ch.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=trubat-d/CN=trubat-d.42.ch"

RUN rm -rf /etc/nginx/http.d/default.conf

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443


ENTRYPOINT ["nginx", "-g", "daemon off;"]