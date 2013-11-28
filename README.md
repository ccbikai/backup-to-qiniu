##备份vps到七牛云存储脚本

利用七牛python SDK上传，需要配置banckuptoqiniu.sh和upload.py。  
作者：(ccbikai)[http://weibo.com/ccbikai]  
博客：(http://miantiao.me/)[http://miantiao.me/]

1. 配置banckuptoqiniu.sh;

	BACKUP_SRC="/home/wwwroot/www.qiniu.com/web" #需要备份的目录，多个目录用空格隔开
	MYSQL_SERVER="127.0.0.1" #mysql主机地址
	MYSQL_USER="mysqluser" #mysql用户名
	MYSQL_PASS="mysqlpassword" #mysql密码
	DATEBASE="dbname" #mysql数据库名称
	HOST="hostname" #主机名称，方便标记

2. 配置upload.py;
	qiniu.conf.ACCESS_KEY = "QnH9x6nJ_" #从七牛获取
	qiniu.conf.SECRET_KEY = "SyDoO7oAK_" #从七牛获取
	bucket="bucketname" #buket名称就是你在七牛添加的空间
	host="hostname" #主机名称，方便标记，需要和banckuptoqiniu.sh里边的主机名称一样

3. 给banckuptoqiniu.sh授权，`chmod +x banckuptoqiniu.sh`;

4. 执行./banckuptoqiniu.sh 既可以上传;

5. 定时上传请在cron里边添加任务，方法自己谷歌。
