# Update
sudo dnf check-update
sudo dnf update

# yum for old one But for RHEL 8 and above (including RHEL 10), dnf is the recommended package manager.

# Create seperate user and group for monitoring
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

# By Linux convention, /etc/ is used for system-wide configuration files.
# holds Prometheus configuration files
sudo mkdir /etc/prometheus

# According to Linux Filesystem Hierarchy Standard (FHS), /var/lib/ is used to store variable state data 
# This is the data storage directory for Prometheus.
sudo mkdir /var/lib/prometheus

# set the ownership of the directories to the prometheus user and group
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

# install wget file
sudo dnf install wget -y

# Download the latest version of Prometheus -> here use the link of LTS version file
wget https://github.com/prometheus/prometheus/releases/download/v2.53.5/prometheus-2.53.5.linux-amd64.tar.gz

# Extract the downloaded tarball
tar -xvf prometheus-2.53.5.linux-amd64.tar.gz

cd prometheus-2.53.5.linux-amd64

# Move the binaries to /usr/local/bin
sudo mv prometheus promtool /usr/local/bin/

# Move configuration files 
sudo mv prometheus.yml /etc/prometheus/
sudo mv consoles/ console_libraries/ /etc/prometheus/

# Change ownership of the files
sudo chown prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles /etc/prometheus/console_libraries /var/lib/prometheus


# Create Prometheus Systemd Service
sudo tee /etc/systemd/system/prometheus.service > /dev/null << 'EOF'
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
EOF

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Enable and start the Prometheus service
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Check the status of the Prometheus service
sudo systemctl status prometheus
curl -k http://localhost:9090/metrics
