#!/bin/python
#author:ccbikai
#web:http://miantiao.me
#version:0.1
import qiniu.conf
import qiniu.rs
import qiniu.io
import time
import random
qiniu.conf.ACCESS_KEY = "QnH9x6nJ_"
qiniu.conf.SECRET_KEY = "SyDoO7oAK_"
bucket="bucketname"
host="hostname"
class PutPolicy(object):
    scope = None
    expires = 3600
    callbackUrl = None
    callbackBody = None
    returnUrl = None
    returnBody = None
    endUser = None
    asyncOps = None

    def __init__(self, scope):
        self.scope = scope
		
policy = qiniu.rs.PutPolicy(bucket)
uptoken = policy.token()
host = ''.join(("/root/uploadtoqiniu/",host))
data = time.strftime("%Y-%m-%d-%H")
random = str(random.randint(1000, 9999))
key = '-'.join(("inbiji",data,random,"backup.tar.gz"))
localfile = '-'.join((host,data,"backup.tar.gz"))
print "start upload"
err = qiniu.io.put_file(uptoken,key,localfile)
if err is not None:
    print "upload wrong"
else:
	print "upload ok"
exit()
