mysql -uroot -papp2020 -e "GRANT ALL PRIVILEGES ON app.* TO 'app'@'app' IDENTIFIED BY 'app'"
mysql -uroot -papp2020 -e "GRANT ALL PRIVILEGES ON app.* TO 'app'@'%' IDENTIFIED BY 'app'"
mysql -uroot -papp2020 -e "create database app"
