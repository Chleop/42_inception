service mysql restart
mysql_secure_installation

y
rootpwd
rootpwd
y
y
y
y
mariadb
GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;