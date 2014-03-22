#!/bin/python
#author:ccbikai
#web:http://miantiao.me
#version:0.2

import os, sys, getopt
import qiniu.conf, qiniu.rs, qiniu.io

# args
localfile = ''
bucket = ''

try:
	opts, args = getopt.getopt(sys.argv[1:], 'a:s:f:b:')
except getopt.GetoptError, err:
	print str(err)
	exit()

for k, val in opts:
	if k == '-a':
		qiniu.conf.ACCESS_KEY = val
	elif k == '-s':
		qiniu.conf.SECRET_KEY = val
	elif k == '-f':
		localfile = val
	elif k == '-b':
		bucket = val


# upload
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

if os.path.isfile(localfile):
	qiniu.io.put_file(uptoken, os.path.basename(localfile), localfile)
else:
	print localfile + ' not exists!'

exit()