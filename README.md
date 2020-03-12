# [Dzinga PortaControl](https://www.dzinga.com)

![version](https://img.shields.io/badge/version-1.0.0-blue.svg)  ![license](https://img.shields.io/badge/license-MIT-blue.svg) [![GitHub issues open](https://img.shields.io/github/issues/creativetimofficial/argon-design-system-react.svg?maxAge=2592000)](http://git.rnd.mtt/dzakharov/portacontrol_api/issues?q=is%3Aopen+is%3Aissue) [![GitHub issues closed](https://img.shields.io/github/issues-closed-raw/creativetimofficial/argon-design-system-react.svg?maxAge=2592000)](http://git.rnd.mtt/dzakharov/portacontrol_api/issues?q=is%3Aissue+is%3Aclosed) 

# Install and build APP

## System Requements

- OS: Debian 10 Buster,
- CPU: 2 or more cores,
- RAM: 2 Gb or more,
- HDD: 10 Gb or more
- PostgreSQL server

# Install FreeSWITCH

apt-get update && apt-get install -y gnupg2 wget lsb-release
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -
 
echo "deb http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list

apt-get update && apt-get install -y freeswitch-meta-all

## Install NPM

apt install npm

# Install APP

- Clone the repo `git clone http://git.rnd.mtt/dzakharov/portacontrol_api.git' .
- Copy FreeSWITCH 'config' directory to '/etc/freeswitch'
- Copy 'script' directory to '/usr/share/freeswitch'
- Copy 'JS_API' directory to '/home'

- Enter to /home/JS_API directory
- Install via NPM 'npm install'
- Set your DB IP address in knexfile.js file 'sed -i "s/127\.0\.0\.1/IP.ADD.RE.SS/g" ./knexfile.js'
- Set your FreeSWITCH IP address in index.js file 'sed -i "s/127\.0\.0\.1/IP.ADD.RE.SS/g" ./index.js'
- Start APP with 'node index.js'

- If you wanna run this app on OS starts, copy from 'systemd' directory 'portacontrol-api.service' file to '/etc/systemd/system/' directory
- Run 'systemctl daemon-reload' and 'systemctl enable portacontrol-api.service'

# Documentation

To be documented..

