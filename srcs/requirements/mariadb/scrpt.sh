#!/bin/bash

# Start mysql service
service mysql start

# Enter Mariadb
mariadb

# Set the root password
# Setting the root password ensures that nobody can log into the MySQL
# root user without the proper authorisation.
UPDATE mysql.user SET Password = PASSWORD('rootpwd') WHERE User = 'root';

# Remove anonymous users
# By default, a MySQL installation has an anonymous user, allowing anyone
# to log into MySQL without having to have a user account created for
# them. You should remove them.
DELETE FROM mysql.user WHERE User='';

# Disallow remote root login
# Normally, root should only be allowed to connect from 'localhost'.  This
# ensures that someone cannot guess at the root password from the network.
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# Remove test database
# By default, MySQL comes with a database named 'test' that anyone can
# access.  This should be removed.
DROP DATABASE IF EXISTS test;

# Create admin user
GRANT ALL ON *.* TO 'cproesch'@'localhost' IDENTIFIED BY 'cproeschpwd' WITH GRANT OPTION;

# Create user
GRANT INSERT ON *.* TO 'other'@'localhost' IDENTIFIED BY 'otherpwd' WITH GRANT OPTION;

# Reload privilege tables (Make our changes take effect)
FLUSH PRIVILEGES;