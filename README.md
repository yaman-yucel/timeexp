# timeexp

A small NTP server for experiments: chrony on Alpine, in Docker.

Upstream sources:
- `pool.ntp.org`
- `time.cloudflare.com` over NTS (authenticated NTP)
- `time.ume.tubitak.gov.tr` (TÜBİTAK UME, stratum 1)

It runs with `chronyd -x`, so it never changes the host clock.

## Run

```sh
docker build -t timeexp .
docker run -d --name timeexp -p 127.0.0.1:12300:123/udp timeexp
```

## Look around

```sh
docker exec timeexp chronyc sources -v    # upstream servers and their state
docker exec timeexp chronyc sourcestats   # offset and jitter per source
docker exec timeexp chronyc tracking      # current estimate of true time
docker exec timeexp chronyc -N authdata   # NTS keys and cookies
docker exec timeexp chronyc clients       # who queries this server
```

Query it from the host with any SNTP client on `127.0.0.1:12300`.

## Clean up

```sh
docker rm -f timeexp && docker rmi timeexp
```
