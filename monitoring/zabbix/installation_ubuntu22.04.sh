# before installation update and upgrade the system
sudo apt update
sudo apt upgrade -y
sudo reboot

# install zabbix repository
# downloads the official Zabbix 7.0 repository package for Ubuntu 22.04.
# .deb file is a Debian package
wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu22.04_all.deb
# install the downloaded package
sudo dpkg -i zabbix-release_latest_7.4+ubuntu22.04_all.deb
sudo apt update

# Check that the Zabbix repo is listed in APT sources
apt policy | grep zabbix

# install 
# Zabbix server, 
# frontend - PHP, 
# Zabbix agent, 
# Web server - apache, and 
# database server - MySQL
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

# install maria db server
sudo apt install mariadb-server
# Create initial database
sudo mysql -uroot

# Create a database named zabbix
create database zabbix character set utf8mb4 collate utf8mb4_bin;
# Create a user named zabbix with password 'abdefgh'
create user zabbix@localhost identified by 'abdefgh';
# Grant all privileges on the zabbix database to the zabbix user
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit;

#  import the Zabbix database schema (tables, stored procedures, triggers, etc.) into the zabbix database
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p'abdefgh' zabbix

# Disable log_bin_trust_function_creators option after importing database schema.
sudo mysql -uroot
set global log_bin_trust_function_creators = 0;
quit;

# Configure the database for Zabbix server
sudo nano /etc/zabbix/zabbix_server.conf
# Update password for the database user
DBPassword='abdefgh'

# restart and enable Zabbix server and agent
sudo systemctl enable mariadb zabbix-server zabbix-agent apache2
sudo systemctl restart zabbix-server zabbix-agent apache2

# Check the status of Zabbix server and agent
sudo systemctl status zabbix-server zabbix-agent apache2


# Steps to install zabbix through bash script
sudo nano install_zabbix_ubuntu.sh
# Paste the above code into the file
# Save and exit the file
# Make the script executable and run it
chmod +x install_zabbix_ubuntu.sh
./install_zabbix_ubuntu.sh

