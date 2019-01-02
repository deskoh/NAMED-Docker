FROM alpine:3.8

#
# Install all required dependencies.
#

RUN apk add --no-cache bind

VOLUME ["/etc/bind", "/var/log/named"]

EXPOSE 53/udp

WORKDIR /usr/sbin/

#
# Start named.
#
CMD ["./named", "-f"]
