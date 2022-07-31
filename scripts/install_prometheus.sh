#!bin/bash

sudo useradd --no-create-home prometheus

sudo mkdir /etc/prometheus

sudo mkdir /var/lib/prometheus

wget https://github.com/prometheus/prometheus/releases/download/v2.19.0/prometheus-2.19.0.linux-amd64.tar.gz

tar xvfz prometheus-2.19.0.linux-amd64.tar.gz

sudo cp prometheus-2.19.0.linux-amd64/prometheus /usr/local/bin

sudo cp prometheus-2.19.0.linux-amd64/promtool /usr/local/bin/

sudo cp -r prometheus-2.19.0.linux-amd64/consoles /etc/prometheus

sudo cp -r prometheus-2.19.0.linux-amd64/console_libraries /etc/prometheus

sudo rm -rf prometheus-2.19.0.linux-amd64.tar.gz prometheus-2.19.0.linux-

sudo nano /etc/prometheus/prometheus.yml

'''
global:
  scrape_interval: 15s
  external_labels:
    monitor: 'prometheus'

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
'''
sudo nano /etc/systemd/system/prometheus.service

'''
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
'''

sudo chown prometheus:prometheus /etc/prometheus

sudo chown prometheus:prometheus /usr/local/bin/prometheus

sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo chown -R prometheus:prometheus /etc/prometheus/consoles

sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries

sudo chown -R prometheus:prometheus /var/lib/prometheus

sudo systemctl daemon-reload

sudo systemctl start prometheus

sudo systemctl enable prometheus

### after installing node exporter, run these in this prometheus ec2 instance

sudo nano /etc/prometheus/prometheus.yml
'''
global:
  scrape_interval: 15s
  external_labels:
    monitor: 'prometheus'

scrape_configs:

  - job_name: 'node_exporter'

    static_configs:

      - targets: ['MACHINE-1-PUBLIC-IP:9100','MACHINE-2-PUBLIC-IP:9100']
'''
sudo systemctl restart prometheus