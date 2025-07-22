# System updates
sudo dnf update -y
sudo reboot

# Check if EPEL repo is installed
dnf repolist | grep epel
# if installed, edit the following file
sudo vi /etc/yum.repos.d/epel.repo
# add this line under the [epel] section
excludepkgs=zabbix*
# If this line is present, Zabbix packages will be excluded from EPEL repo.
# If missing, you can add it under the [epel] section to prevent conflicts.

# Install the zabbix repository
sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.4/release/rhel/10/noarch/zabbix-release-latest-7.4.el10.noarch.rpm
sudo dnf clean all

# Install Zabbix Server, Frontend, Agent, and Database
sudo dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent

# if the above commad fails, try following:
# for Error: Failed to download metadata for repo 'zabbix-third-party'
dnf repolist all | grep zabbix
sudo dnf config-manager --set-disabled zabbix-third-party
sudo dnf config-manager --set-disabled zabbix-tools
# for Error: Failed to download metadata for repo 'zabbix-tools'
sudo dnf install epel-release
sudo dnf install fping
# But after installing epel, the epel.repo file not there
# Check if EPEL repo is installed
dnf repolist | grep epel
# if yes, then check the repo file
ls /etc/yum.repos.d/ | grep epel
# if not, install EPEL repo
sudo dnf install -y \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
# Now edit the EPEL repo file
sudo vi /etc/yum.repos.d/epel.repo
# here add the following line under the [epel] section
excludepkgs=zabbix*


# Install MariaDB server
sudo dnf install mariadb-server
# Start and enable MariaDB service
sudo systemctl enable --now mariadb

# Create initial database
sudo mysql -uroot

create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'abdrhelgh';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit;

# On Zabbix server host import initial schema and data
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p'abdrhelgh' zabbix

# Disable log_bin_trust_function_creators option after importing database schema.
sudo mysql -uroot
set global log_bin_trust_function_creators = 0;
quit;

# Configure the database for Zabbix server
sudo vi /etc/zabbix/zabbix_server.conf
# Update password for the database user
DBPassword='abdrhelgh'

sudo systemctl enable zabbix-server zabbix-agent httpd php-fpm
sudo systemctl restart zabbix-server zabbix-agent httpd php-fpm