
# Start mysql service so that mysql commands can be interpreted
# service mysql start needs to be put inside the script so it is run
# from inside the container
service mysql start

# Set the root password = admin user
# Setting the root password ensures that nobody can log into the MySQL
# root user without the proper authorisation.
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('rootpwd') WHERE User='root';"
#UPDATE mysql.user SET Password=PASSWORD('$esc_pass') WHERE User='root';
# Remove anonymous users
# By default, a MySQL installation has an anonymous user, allowing anyone
# to log into MySQL without having to have a user account created for
# them. You should remove them.
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"

# Disallow remote root login
# Normally, root should only be allowed to connect from 'localhost'.  This
# ensures that someone cannot guess at the root password from the network.
mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# Remove test database
# By default, MySQL comes with a database named 'test' that anyone can
# access.  This should be removed.
mysql -u root -e "DROP DATABASE IF EXISTS test;"

# Create wordpress database
mysql -u root -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

# Create user and give him all right on this database
mysql -u root -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'wppwd';"

# Reload privilege tables (Make our changes take effect)
mysql -u root -e "FLUSH PRIVILEGES;"
