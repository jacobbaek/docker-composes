local cjson = require "cjson"
-- ngx.say(ngx.var.rurl)
-- ngx.say(ngx.hostname)
jsondata= '[{"remote_url": ngx.var.rurl}, {"hostname": ngx.hostname}]'
ngx.say(cjson.encode(jsondata))
ngx.exit(ngx.HTTP_OK)
