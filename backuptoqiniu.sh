#!/bin/bash
#author:ccbikai
#web:http://miantiao.me

## 备份配置信息 ##

# 备份名称，用于标记
BACKUP_NAME="qiniu-backup"
# 备份目录，多个请空格分隔
BACKUP_SRC="/home/wwwroot/"
# Mysql主机地址
MYSQL_SERVER="127.0.0.1"
# Mysql用户名
MYSQL_USER="root"
# Mysql密码
MYSQL_PASS="mysqlpassword"
# Mysql备份数据库，多个请空格分隔
MYSQL_DBS="dbname"
# 备份文件临时存放目录，一般不需要更改
BACKUP_DIR="/tmp/backuptoqiniu/"

## 备份配置信息 End ##

## 七牛配置信息 ##

#存放空间
QINIU_BUCKET="<YOUR_APP_bucket>"
#ACCESS_KEY
QINIU_ACCESS_KEY="<YOUR_APP_ACCESS_KEY>"
#SECRET_KEY
QINIU_SECRET_KEY="<YOUR_APP_SECRET_KEY>"

## 七牛配置信息 End ##



## Funs ##
NOW=$(date +"%Y%m%d%H%M%S") #精确到秒，统一秒内上传的文件会被覆盖

mkdir -p $BACKUP_DIR

# 备份Mysql
echo "start dump mysql"
for db_name in $MYSQL_DBS
do
	mysqldump -u $MYSQL_USER -h $MYSQL_SERVER -p$MYSQL_PASS $db_name > "$BACKUP_DIR/$BACKUP_NAME-$db_name.sql"
done
echo "dump ok"

# 打包
echo "start tar"
BACKUP_FILENAME="$BACKUP_NAME-backup-$NOW.tar.gz"
tar -cPzf $BACKUP_DIR/$BACKUP_FILENAME $BACKUP_DIR/*.sql $BACKUP_SRC
echo "tar ok"

# 上传
echo "start upload"
python $(dirname $0)/upload.py -a $QINIU_ACCESS_KEY -s $QINIU_SECRET_KEY -b $QINIU_BUCKET -f $BACKUP_DIR/$BACKUP_FILENAME
echo "upload ok"

# 清理备份文件
rm -rf $BACKUP_DIR
echo "backup clean done"
