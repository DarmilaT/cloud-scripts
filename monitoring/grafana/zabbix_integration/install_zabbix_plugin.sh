# install zabbix datasource plugin
sudo grafana-cli plugins install alexanderzobnin-zabbix-app
sudo systemctl restart grafana-server
# chek if the plugin is installed
sudo grafana-cli plugins ls | grep zabbix

sudo tail -f /var/log/zabbix/zabbix_server.log
# Error : [Z3001] connection to database 'zabbix' failed: [1045] Access denied for user 'zabbix'@'localhost' (using password: YES)
sudo nano /etc/zabbix/zabbix_server.conf

sudo mysql
ALTER USER 'zabbix'@'localhost' IDENTIFIED BY 'abdrhelgh';
FLUSH PRIVILEGES;
mysql -uzabbix -p -h localhost zabbix

DROP USER IF EXISTS 'zabbix'@'localhost';
CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'abdrhelgh';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
FLUSH PRIVILEGES;

mysql -uzabbix -p -h localhost zabbix
mysql -uzabbix -p -h 127.0.0.1 zabbix

sudo grep -i DB /etc/zabbix/zabbix_server.conf | grep -v '^#'

sudo tail -f /var/log/zabbix/zabbix_server.log


# Check db pasword correct and datas
mysql -u zabbix -p
USE zabbix;
SELECT itemid, name, key_, status FROM items LIMIT 10;
SELECT itemid, clock, value FROM history ORDER BY clock DESC LIMIT 5;