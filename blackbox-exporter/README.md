
## Add repository
```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm search repo grafana
```


## Deploy Loki-Stack Helm Chart
```bash
helm install loki-stack grafana/loki-stack --values ./loki-stack-values.yml -n loki --create-namespace
helm upgrade loki-stack grafana/loki-stack --values ./loki-stack-values.yml -n loki
```

## Upgrade and Deploy Blackbox
```bash
helm upgrade blackbox prometheus-community/prometheus-blackbox-exporter -f prometheus-blackbox-exporter.yml -n loki
```

## Blackbox exporter
```bash
helm install blackbox prometheus-community/prometheus-blackbox-exporter -f prometheus-blackbox-exporter.yml -n loki --create-namespace
```
## Obtain password 
```bash
k get secret -n loki  loki-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

## Port Forward
```bash
k port-forward -n monitoring service/prometheus-grafana 3000:80
```

## Kubectl Patching
```bash
kubectl patch service/loki-stack-prometheus-server --type='json' -p '[{"op":"replace","path":"/spec/type","value":"ClusterIP"},{"op":"replace","path":"/spec/ports/0/nodePort","value":null}]' -n loki-stack
```

## Grafana Links
[Better Blackbox](https://grafana.com/blog/2020/11/25/how-we-eliminated-service-outages-from-certificate-expired-by-setting-up-alerts-with-grafana-and-prometheus)