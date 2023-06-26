#!/bin/sh
apt-get update -y
apt-get upgrade -y
apt-get install sudo -y
sudo apt -y install lsb-release apt-transport-https ca-certificates wget
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update -y
sudo apt upgrade -y
sudo apt install php php8.2-mysql mariadb-client php8.2-fpm -y
mkdir -p /run/php/;
touch /run/php/php8.2-fpm.pid;