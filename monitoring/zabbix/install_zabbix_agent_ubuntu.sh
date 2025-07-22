# install zabbix repository
sudo wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_latest_7.4+ubuntu22.04_all.deb
sudo apt update

# install zabbix agent
sudo apt install zabbix-agent

# configure zabbix server
sudo nano /etc/zabbix/zabbix_agentd.conf
# In the configuration file, set the following parameters:
Server=<Zabbix_Server_IP>
ServerActive=<Zabbix_Server_IP>   



# Start Zabbix agent process
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent