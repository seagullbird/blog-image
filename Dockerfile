FROM alpine:latest
MAINTAINER seagullbird823@gmail.com

RUN apk add --no-cache curl git bash

RUN apk add --update wget ca-certificates

# install caddy
RUN curl https://getcaddy.com | bash -s personal http.git,http.hugo \
    && caddy -version

EXPOSE 80 443 2015

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
