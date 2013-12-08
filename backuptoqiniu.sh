#!/bin/bash
#author:ccbikai
#web:http://miantiao.me
BACKUP_SRC="/home/wwwroot/www.qiniu.com/web" #需要备份的目录
MYSQL_SERVER="127.0.0.1" #mysql主机地址
MYSQL_USER="mysqluser" #mysql用户名
MYSQL_PASS="mysqlpassword" #mysql密码
DATEBASE="dbname" #mysql数据库名称
HOST="hostname" #主机名称，方便标记
NOW=$(date +"%Y-%m-%d-%H")
echo "start dump mysql"
mysqldump -u $MYSQL_USER -h $MYSQL_SERVER -p$MYSQL_PASS $DATEBASE > "$NOW-Databases.sql"
echo "dump ok"
echo "start tar"
tar -cPzf /root/backuptoqiniu/$HOST-$NOW-backup.tar.gz $NOW-Databases.sql "$BACKUP_SRC"
echo "tar ok"
python /root/backuptoqiniu/upload.py
rm -f $NOW-Databases.sql /root/backuptoqiniu/$HOST-$NOW-backup.tar.gz
echo "ALL ok"
