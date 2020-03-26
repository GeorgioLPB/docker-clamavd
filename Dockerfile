FROM alpine:3.11.5
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/packages?name=clamav&branch=v3.11&arch=x86_64
#
LABEL maintainer georges.gregorio@gmail.com

ENV \
	s6_release='1.22.1.0' \
	s6_arch='amd64' \
	s6_sha256='73f9779203310ddf9c5132546a1978e1a2b05990263b92ed2c34c1e258e2df6c'

ADD "https://github.com/just-containers/s6-overlay/releases/download/v${s6_release}/s6-overlay-${s6_arch}.tar.gz" /tmp/

RUN set -eux;\
	apk add --no-cache --upgrade clamav clamav-libunrar && \
	mkdir -p '/run/clamav' && \
	chown clamav:clamav '/run/clamav' && \
	sed -i "s|^#TCPSocket\s.*|TCPSocket 3310|g" '/etc/clamav/clamd.conf' && \
	cd /tmp && \
	echo "${s6_sha256} *s6-overlay-${s6_arch}.tar.gz" | sha256sum -c - && \
	tar -xzvf "/tmp/s6-overlay-${s6_arch}.tar.gz" -C / && \
	rm -fv "/tmp/s6-overlay-${s6_arch}.tar.gz"

#COPY --chown=root:root config.init /etc/cont-init.d/00-config
#COPY --chown=root:root bind.run /etc/services.d/bind/run

ADD rootfs/ /

WORKDIR /var/lib/clamav

VOLUME [ "/var/lib/clamav" ]

EXPOSE 3310/tcp

#CMD if [ ! -f /var/lib/clamav/main.cvd ] ; then freshclam ; else freshclam -d -c 6 && clamd --foreground ; fi

CMD [ "/init" ]
