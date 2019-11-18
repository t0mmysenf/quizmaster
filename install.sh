#!/usr/bin/env bash

# This script is intended for automatic installation in the provided virtual machine.

# Read git repository url
echo "Please provide the (https) url for cloning your git repository..."
read -p "Git Repository: " gitrepository
echo

# Read database configuration parameters
echo "Please provide the database configuration parameters..."
read -p "DB host [localhost]: " dbHost
dbHost=${dbHost:-localhost}
read -p "DB port [3306]: " dbPort
dbHost=${dbHost:-3306}
read -p "DB database name [quiz]: " dbDatabaseName
dbHost=${dbHost:-quiz}
read -p "DB username [quizmaster]: " dbUsername
dbHost=${dbHost:-quizmaster}
read -p "DB password [qu!z_m150]: " dbPassword
dbHost=${dbHost:-qu!z_m150}

echo Your db-conf: $dbHost $dbPort $dbDatabaseName $dbUsername $dbPassword

decalre -A dbConfiguration
dbConfiguration=(
    [{{DB_HOST}}]=${dbHost}
    [{{DB_PORT}}]=${dbPort}
    [{{DB_DATABASE_NAME}}]=${dbDatabaseName}
    [{{DB_USERNAME}}]=${dbUsername}
    [{{DB_PASSWORD}}]=${dbPassword}
)

# Clone repository
cd /var/www/html/m150
sudo git clone $gitrepository .

# Change to quiz directory
cd /var/www/html/m150/quiz

# Use composer to install dependencies
sudo composer install

# Build frontend using npm
sudo npm install

# Setup the database
mysql -u root -p < /var/www/html/m150/initDb.sql
mysql -u quizmaster -p quiz < /var/www/html/m150/seedDb.sql

# Prepare the laravel framework
sudo cp .env.example .env

for i in "${!dbConfiguration[@]}"
do
    search=${i}
    replace=${dbConfiguration[$i]}
    sed -i "" "s/${search}/${replace}/g" .env
done

# Generate application keys
sudo php artisan key:generate
sudo php artisan passport:keys

# Fix file permissions
# Assign 'apache' as user and user group recursively to the web root directory
sudo chown -R apache:apache /var/www/html
# Adjust permissions for some directories (recursively)
sudo chmod -R 0775 /var/www/html/m150/quiz/storage/ /var/www/html/m150/quiz/bootstrap/cache/

# Restart apache webserver
sudo systemctl restart httpd

