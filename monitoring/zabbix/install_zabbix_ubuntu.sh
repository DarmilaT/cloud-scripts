#!/bin/bash

# Update and upgrade the system
# ignore these 3 lines
# sudo apt update
# sudo apt upgrade -y
# sudo reboot

# Add Zabbix repository
wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_latest_7.4+ubuntu22.04_all.deb
sudo apt update

# Verify Zabbix repository is added
apt policy | grep zabbix

# Install Zabbix server, frontend, agent, Apache and MySQL support
sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

# Install MariaDB server
sudo apt install -y mariadb-server

# Configure the database
sudo mysql -uroot <<EOF
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'abdefgh';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
EOF

# Import initial schema
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p'abdefgh' zabbix

# Disable log_bin_trust_function_creators
sudo mysql -uroot -e "set global log_bin_trust_function_creators = 0;"

# Update DBPassword in Zabbix config
sudo sed -i "s/^# DBPassword=.*/DBPassword=abdefgh/" /etc/zabbix/zabbix_server.conf

# Enable and restart services
sudo systemctl enable mariadb zabbix-server zabbix-agent apache2
sudo systemctl restart mariadb zabbix-server zabbix-agent apache2

# Check service status
sudo systemctl status zabbix-server zabbix-agent apache2

# # # Steps to install zabbix through bash script
# sudo nano install_zabbix_ubuntu.sh
# # Paste the above code into the file
# # Save and exit the file
# # Make the script executable and run it
# chmod +x install_zabbix_ubuntu.sh
# ./install_zabbix_ubuntu.sh