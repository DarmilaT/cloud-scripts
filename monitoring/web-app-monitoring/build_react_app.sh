# Pre-request: npm & Node.js must be installed
sudo apt update
sudo apt install nodejs npm -y
# Check versions
node -v
npm -v
# installed npm: 8.5.1 
# installed nodejs: 12.22.9
# IF already installed node js code to remove that
sudo apt remove -y nodejs libnode-dev
sudo apt autoremove -y
sudo apt remove -y nodejs-doc npm
sudo apt clean
# To install the latest version of Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# When I run this command I got following Notification:
# system notification telling you that a newer Linux kernel version is installed on your system, but your system is still running an older version.
# Current kernel in use: 6.8.0-1029-aws
# Newer kernel installed: 6.8.0-1032-aws
# For that run following
sudo reboot
# To get kernal version
uname -r
# Kernel updates often include security patches, bug fixes, and hardware improvements.
# Until you reboot, you are still running the older kernel, and those updates won't take effect.


# Create the react app
# Create project skeleton (interactive — pick “React” and then “JavaScript” or “TypeScript”)
npm create vite@latest my-monitoring-app -- --template react
cd my-monitoring-app
npm install
# Build the app
npm run build

# Put on apache server
sudo cp -r dist/* /var/www/html/
sudo systemctl restart apache2

apache2 -v
# To install apache2
sudo apt update
sudo apt install apache2 -y


