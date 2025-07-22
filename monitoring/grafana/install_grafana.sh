# install pre-request packages
sudo apt-get install -y apt-transport-https software-properties-common wget

# Import the GPG key
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

# Add the Grafana APT repository for stable releases
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
sudo apt-get update

# Installs the latest OSS release:
sudo apt-get install grafana

# Enable and start the Grafana service
sudo systemctl enable grafana-server.service
sudo systemctl start grafana-server.service
# If we enable the service only, next time the system boots, Grafana will start automatically.

# Default Grafana port is 3000, you can access it via http://your_server_ip:3000
# Default username and password are both "admin". You will be prompted to change the password on first login.
# new password for ubuntu server demoServer-zabbix -> demoServer-zabbix

