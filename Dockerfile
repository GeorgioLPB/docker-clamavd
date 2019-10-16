FROM alpine:3.10.2
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/packages?name=clamav&branch=v3.10&arch=x86_64
#
LABEL maintainer georges.gregorio@gmail.com

RUN set -eux;\
	apk add --no-cache --upgrade clamav clamav-libunrar && \
	mkdir -p '/run/clamav' && \
	chown clamav:clamav '/run/clamav' && \
	mkdir -p '/data' && \
	chown clamav:clamav '/data' && \
	#
	# Configure '/etc/clamav/freshclam.conf'
	#
	sed -i "s|^#DatabaseDirectory\s.*|DatabaseDirectory /data|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#UpdateLogFile\s.*|UpdateLogFile /proc/self/fd/1|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#LogFileMaxSize\s.*|LogFileMaxSize 0|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#LogTime\s.*|LogTime yes|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#LogSyslog\s.*|LogSyslog yes|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#SafeBrowsing\s.*|SafeBrowsing yes|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#Bytecode\s.*|Bytecode yes|g" '/etc/clamav/freshclam.conf' && \
	#
	# Configure '/etc/clamav/clamd.conf'
	#
	sed -i "s|^LogFile\s.*|LogFile /proc/self/fd/1|g" '/etc/clamav/freshclam.conf' && \
	sed -i "s|^#DatabaseDirectory\s.*|DatabaseDirectory /data|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#TemporaryDirectory\s.*|TemporaryDirectory /tmp|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^PidFile\s.*|PidFile /run/clamav/clamd.pid|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^LocalSocket\s.*|LocalSocket /run/clamav/clamd.sock|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#TCPSocket\s.*|TCPSocket 3310|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#Foreground\s.*|Foreground yes|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#ScanPE\s.*|ScanPE yes|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#DisableCertCheck\s.*|DisableCertCheck yes|g" '/etc/clamav/clamd.conf' && \
	sed -i "s|^#DetectBrokenExecutables\s.*|DetectBrokenExecutables yes|g" '/etc/clamav/clamd.conf'

#WORKDIR /data

#VOLUME [ "/data" ]

#EXPOSE 3310/tcp

CMD if [ ! -f /data/main.cvd ] ; then freshclam ; else freshclam -d -c 6 && clamd ; fi
