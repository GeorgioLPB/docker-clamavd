FROM alpine:3.10.3
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/packages?name=clamav&branch=v3.10&arch=x86_64
#
LABEL maintainer georges.gregorio@gmail.com

RUN set -eux;\
	apk add --no-cache --upgrade clamav clamav-libunrar && \
	mkdir -p '/run/clamav' && \
	chown clamav:clamav '/run/clamav' && \
	sed -i "s|^#TCPSocket\s.*|TCPSocket 3310|g" '/etc/clamav/clamd.conf'

#WORKDIR /var/lib/clamav

#VOLUME [ "/var/lib/clamav" ]

#EXPOSE 3310/tcp

CMD if [ ! -f /var/lib/clamav/main.cvd ] ; then freshclam ; else freshclam -d -c 6 && clamd --foreground ; fi
