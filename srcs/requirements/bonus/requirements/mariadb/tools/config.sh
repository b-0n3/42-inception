#!/bin/bash

service mysql start

if [ -z "$(mysql -u root -e -p $DB_ADMIN_PASSWORD "SHOW DATABASES LIKE '${DB_NAME}'" | grep ${DB_NAME})" ]; then
    
    echo "Creating database ${DB_NAME}"
    mysql -u root -e "CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;"
    mysql -u root ${DB_NAME} < /tmp/wordpress.sql

    mysql -u root -e "\
    GRANT ALL PRIVILEGES ON ${DB_NAME}.*\
     TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
    FLUSH PRIVILEGES;"
    mysql -u root -e "\
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';
    FLUSH PRIVILEGES;"
fi
echo $DB_ADMIN_PASSWORD |  mysqladmin -u root -p  shutdown
mysqld_safe /etc/mysl/mariadb.conf.d/50-server.cnf