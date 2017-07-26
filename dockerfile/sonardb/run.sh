#!/bin/bash
PORT=$1
if [ ! -f /isinit ]; then
  echo "mysql_install_db...."
  mysqld --initialize --user=mysql

  rootpassword=`cat /var/log/mysqld.log |grep 'root@localhost:'|awk '{print $NF}'`
  echo $rootpassword

  echo "modify port..."
  sed -i '19a port='"$PORT"'' /etc/my.cnf

  echo "start mysql..."
  mysqld --user=mysql &
  sleep 10


  mysql -uroot -p"${rootpassword}" --connect-expired-password -e "alter user 'root'@'localhost' identified by 'root';"

  echo "add sonar db..."
  mysql -uroot -proot -e "CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;"
  mysql -uroot -proot -e "CREATE USER 'sonar' IDENTIFIED BY 'sonar';"
  mysql -uroot -proot -e "GRANT ALL ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'sonar';"
  mysql -uroot -proot -e "GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar';"

  echo "stop..."
  mysqladmin shutdown -uroot -proot
  echo "isinit" > /isinit
fi
echo "start mysql when add sonar db is ok"
echo "DBNAME:sonar Username:sonar Password:sonar Port:$PORT"
mysqld --user=mysql
