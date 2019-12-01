#!/usr/bin/env bash

# This script is intended for automatic installation in the provided virtual machine.

# Read database configuration parameters
echo "Please provide the database configuration parameters..."
echo "You may press 'enter' to accept de default values\n"

read -p "DB host [localhost]: " dbHost
dbHost=${dbHost:-localhost}
read -p "DB port [3306]: " dbPort
dbPort=${dbPort:-3306}
read -p "DB root password [Gibz1234]: " dbRootPassword
dbRootPassword=${dbRootPassword:-Gibz1234}
read -p "DB database name [quiz]: " dbDatabaseName
dbDatabaseName=${dbDatabaseName:-quiz}
read -p "DB username [quizmaster]: " dbUsername
dbUsername=${dbUsername:-quizmaster}
read -p "DB password [qu!z_m150]: " dbPassword
dbPassword=${dbPassword:-qu!z_m150}

declare -A dbConfiguration
dbConfiguration=(
    ['__DB_HOST__']=${dbHost}
    ['__DB_PORT__']=${dbPort}
    ['__DB_DATABASE_NAME__']=${dbDatabaseName}
    ['__DB_USERNAME__']=${dbUsername}
    ['__DB_PASSWORD__']=${dbPassword}
)

# Change to quiz directory
cd /var/www/html/m150/quiz

# Use composer to install dependencies
composer install

# Build frontend using npm
mkdir /home/webadmin/m150
mkdir /home/webadmin/m150/node_modules
ln -s /home/webadmin/m150/node_modules /var/www/html/m150/quiz/node_modules
npm install

# Setup the database
sed -i "s/__DB_DATABASE_NAME__/${dbConfiguration['__DB_DATABASE_NAME__']}/g" /var/www/html/m150/initDb.sql
sed -i "s/__DB_USERNAME__/${dbConfiguration['__DB_USERNAME__']}/g" /var/www/html/m150/initDb.sql
sed -i "s/__DB_PASSWORD__/${dbConfiguration['__DB_PASSWORD__']}/g" /var/www/html/m150/initDb.sql

mysql --user=root --password=${dbRootPassword} < /var/www/html/m150/initDb.sql
mysql --user=quizmaster --password=${dbPassword} quiz < /var/www/html/m150/seedDb.sql

# Prepare the laravel framework
cp .env.example .env

for i in "${!dbConfiguration[@]}"
do
    search=${i}
    replace=${dbConfiguration[$i]}
    sed -i "s/${search}/${replace}/g" .env
done

# Generate application keys
php artisan key:generate
php artisan passport:keys

# Restart apache webserver
systemctl restart httpd

# Save current ip address (for public access) in variable
pubIp=$(ip addr show | grep -m1 "inet.*global" | cut -d " " -f6 | cut -d "/" -f1)
echo
echo Access the application in your browser: ${pubIp}
echo