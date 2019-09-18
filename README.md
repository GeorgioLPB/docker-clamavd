# ClamAV container

## Supported tags and respective `Dockerfile` links

| Tags         | Alpine   | ClamAV       |
|:-------------|:---------|:-------------|
| `latest`     | `3.10.2` | `0.101.4-r0` |
| `0.100.3-r0` | `3.10.1` | `0.100.3-r0` |

* [latest, (latest/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/master/Dockerfile)
* [0.100.3-r0, (0.100.3-r0/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/0.100.3-r0/Dockerfile)

## Quick reference

* ClamAV
  * [ClamAV official website](https://www.clamav.net/)
  * [Clam AntiVirus User Manual](https://www.clamav.net/documentation)
* Alpine Linux
  * [Alpine Linux official website](https://www.alpinelinux.org/)
  * [Alpine Linux Wiki](https://wiki.alpinelinux.org/wiki/Main_Page)
  * [Alpine Docker Official Images](https://hub.docker.com/_/alpine)

## What is ClamAV?

* ClamAV is an open source antivirus engine for detecting Trojans, viruses, malware and other malicious threats.
* This container is intended to be used with the [Nextcloud](https://nextcloud.com/) self-hosted productivity platform and its application [Antivirus for files](https://apps.nextcloud.com/apps/files_antivirus), but it can also be used in other situations.

## How to use this image

### Simple Usage

	docker run -d -p 3310:3310 ggregorio/clamavd

### Usage with persistent data

	docker run -d -p 3310:3310 -v $(pwd)/data:/data ggregorio/clamavd

## Configuration (environment variables)

None at the moment.
