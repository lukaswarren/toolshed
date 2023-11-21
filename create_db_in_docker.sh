#!/bin/bash

# MySQL container details
CONTAINER_NAME="tool_shed_db"
MYSQL_USER="root"
MYSQL_PASSWORD="root_password"
DATABASE_NAME="tool_shed_db"
NEW_USER="toolshed"
NEW_USER_PASSWORD="tool_shed"

docker run --name="$CONTAINER_NAME" --env="MYSQL_ROOT_PASSWORD=$MYSQL_PASSWORD" -p 3306:3306 -d mysql:latest

echo "Waiting 10 seconds for MySQL to boot..."
sleep 20

# Create a MySQL database in the running container
docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Create a user and grant privileges
docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE USER '$NEW_USER'@'%' IDENTIFIED BY '$NEW_USER_PASSWORD';"

docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$NEW_USER'@'%';"

docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "FLUSH PRIVILEGES;"
