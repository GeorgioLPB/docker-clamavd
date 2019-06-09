# ClamAV container

* ClamAV is an open source antivirus engine for detecting Trojans, viruses, malware and other malicious threats.
* This container is intended to be used with the [Nextcloud](https://nextcloud.com/) self-hosted productivity platform and its application [Antivirus for files](https://apps.nextcloud.com/apps/files_antivirus), but it can also be used in other situations.


| Tags         | Alpine  | ClamAV       |
|:-------------|:--------|:-------------|
| `latest`     | `3.9.4` | `0.100.3-r0` |
| `0.100.3-r0` | `3.9.4` | `0.100.3-r0` |

## Supported tags and respective Dockerfile links

* [latest, (latest/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/master/Dockerfile)
* [0.100.3-r0, (0.100.3-r0/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/0.100.3-r0/Dockerfile)

## Usage

### Simple Usage

	docker run -d -p 3310:3310 ggregorio/clamavd

### Usage with persistent data

	docker run -d -p 3310:3310 -v $(pwd)/data:/data ggregorio/clamavd

## Configuration (environment variables)

None at the moment.
