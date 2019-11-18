#!/usr/bin/env bash

# This script is intended for automatic installation in the provided virtual machine.

# Read database configuration parameters
echo "Please provide the database configuration parameters..."
read -p "DB host [localhost]: " dbHost
dbHost=${dbHost:-localhost}
read -p "DB port [3306]: " dbPort
dbHost=${dbHost:-3306}
read -p "DB root password [Gibz1234]: " dbRootPassword
dbHost=${dbHost:-Gibz1234}
read -p "DB database name [quiz]: " dbDatabaseName
dbHost=${dbHost:-quiz}
read -p "DB username [quizmaster]: " dbUsername
dbHost=${dbHost:-quizmaster}
read -p "DB password [qu!z_m150]: " dbPassword
dbHost=${dbHost:-qu!z_m150}

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

# Prepare the laravel framework
sudo cp .env.example .env

for i in "${!dbConfiguration[@]}"
do
    search=${i}
    replace=${dbConfiguration[$i]}
    sed -i "" "s/${search}/${replace}/g" .env
done