# Prometheus
## Blackbox Exporter 
    29/9/2021 - K8s local env setup
    30/9/2021 - Blackbox helm chart deployment on local env
    1/10/2021 - Preparing blackbox exporter manifest and images for deployment
    5/10/2021 - Transfering all of the manifest and assets file to UAT environment
    5/10/2021 - Applying blackbox-exporter manifest file and verification

![image info](images\blackbox_exporter.png)

![image info](images\blackbox_exporter1.png)

    6/10/2021 - Testing blackbox exporter icmp module local ENV

![image info](images\blackbox_icmp.png)

    6/10/2021 - Enabling icmp module on UAT ENV

![image info](images\blackbox_exporter_enable_icmp.png)

    7/10/2021 - Custom blackbox exporter image build to fix icmp issue

![image info](images\blackbox-Issue.PNG)

    8/10/2021 - Ping check script result

![image info](images\blackbox-ping-test.PNG)  

    8/10/2021 - Adding blackbox exporter scraping endpoint to loki-stack manifest
    8/10/2021 - Building grafana dashboard for blackbox exporter