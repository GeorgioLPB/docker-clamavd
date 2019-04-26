# ClamAV container

ClamAV is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.

| Tags       | Alpine | ClamAV     |
| :--------: | :----- | :--------- |
| 0.100.3-r0 | 3.9.3  | 0.100.3-r0 |
| 0.100.2-r0 | 3.9.3  | 0.100.2-r0 |

## Supported tags and respective Dockerfile links

* [0.100.3-r0, latest, (0.100.3-r0/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/0.100.3-r0/Dockerfile)
* [0.100.2-r0 (0.100.2-r0/Dockerfile)](https://github.com/GeorgioLPB/docker-clamavd/blob/0.100.2-r0/Dockerfile)

## Usage

### Simple Usage

	docker run -d -p 3310:3310 ggregorio/clamavd

### Usage with persistent data

	docker run -d -p 3310:3310 -v $(pwd)/data:/data ggregorio/clamavd

## Configuration (environment variables)

None at the moment.
