#备份网站数据到七牛云存储脚本

利用七牛python SDK上传，需要配置 `backuptoqiniu.sh`
作者：[ccbikai](http://weibo.com/ccbikai)  
博客：http://miantiao.me/    没有注册的同学需要[注册七牛账号](http://126.am/qiniuyun)  

1. 安装七牛SDK，需要 `python` 环境：
	```
	python setup.py install
	```

2. 配置 `backuptoqiniu.sh`
	```
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
	```

3. 给 `./backuptoqiniu.sh` 添加执行权限
	```
	chmod +x backuptoqiniu.sh
	```
	
4. 执行 `./backuptoqiniu.sh` 开始备份上传

5. 利用 `cron` 定时执行，以下示例为每天凌晨02:00执行备份，请确认脚本路径
	```
	crontab -e
	```
	进入 cron 编辑，按 `i` 进入编辑模式，在最后输入以下内容
	```
	0 2 * * * /root/backuptoqiniu/backuptoqiniu.sh
	```
	按 `esc` 键，输入 `:wq`，回车保存文件，正常会出如下提示：
	```
	crontab: installing new crontab
	```

##多个网站备份

多个网站备份只需要将 `backuptoqiniu.sh` 拷贝一份，修改其中配置，运行新脚本，即可执行备份

##常见问题

1. `mysqldump: command not found`，如果出现此错误，请参考以下方式解决
	http://www.inbiji.com/biji/mysqldump-command-not-found.html

