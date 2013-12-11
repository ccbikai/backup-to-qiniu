##备份vps到七牛云存储脚本

利用七牛python SDK上传，需要配置backuptoqiniu.sh和upload.py。  
作者：[ccbikai](http://weibo.com/ccbikai)  
博客：http://miantiao.me/  
小白教程：http://www.inbiji.com/biji/vps-backup-data-to-cloud-storage-seven-cattle.html

0. 安装 `python setup.py install`

1. 配置backuptoqiniu.sh;

    BACKUP_SRC="/home/wwwroot/www.qiniu.com/web" #需要备份的目录  
    MYSQL_SERVER="127.0.0.1" #mysql主机地址  
    MYSQL_USER="mysqluser" #mysql用户名  
    MYSQL_PASS="mysqlpassword" #mysql密码  
    DATEBASE="dbname" #mysql数据库名称  
    HOST="hostname" #主机名称，方便标记  

2. 配置upload.py;
    qiniu.conf.ACCESS_KEY = "QnH9x6nJ_" #从七牛获取  
    qiniu.conf.SECRET_KEY = "SyDoO7oAK_" #从七牛获取  
    bucket="bucketname" #buket名称就是你在七牛添加的空间  
    host="hostname" #主机名称，方便标记，需要和backuptoqiniu.sh里边的主机名称一样  
    
3. 检查mysqldump命令能否执行，不能执行这样配置一下 http://www.inbiji.com/biji/mysqldump-command-not-found.html

4. 给backuptoqiniu.sh授权，`chmod +x backuptoqiniu.sh`;

5. 执行./backuptoqiniu.sh 既可以上传;

6. 定时上传请在cron里边添加任务，方法自己谷歌。

