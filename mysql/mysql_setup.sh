#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
mysql_install_db > /dev/null

rm -rf /var/run/mysqld/*
mysqld_safe &

while [ ! -x /var/run/mysqld/mysqld.sock ]; do
  sleep 1
done

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '';"
mysqladmin -u root shutdown
