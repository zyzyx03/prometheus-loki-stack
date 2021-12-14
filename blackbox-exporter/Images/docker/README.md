## Building blackbox exporter image to include setcap

[Blackbox Exporter Git](https://github.com/prometheus/blackbox_exporter)

```docker
FROM prom/blackbox-exporter:v0.18.0 as bbe

FROM alpine:3.14
RUN apk update && apk add libcap
COPY --from=bbe /bin/blackbox_exporter /bin/blackbox_exporter
COPY --from=bbe /etc/blackbox_exporter/config.yml /etc/blackbox_exporter/config.yml
RUN setcap cap_net_raw+ep /bin/blackbox_exporter

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "-config.file=/etc/blackbox_exporter/config.yml" ]
```