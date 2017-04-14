# Nginx上传文本文件


### Nginx配置

> 需要安装http_dav_module
```
        location /upload/ {
            root html;
            dav_methods PUT;
            create_full_put_path  on;
            dav_access group:rw all:r;
        }
```

### curl实现

```
curl -T abc http://10.11.20.127:22345/upload/
```

### python实现

```
url = "http://10.11.20.127:22345/upload/a/b/2.txt"
headers = {'Content-Type':'application/octet-stream'}
with open('2.txt') as f:
    r = requests.request('PUT',url,data=f,headers = headers)
    print r
```

![Mou icon](http://yyf1986.github.io/img/nginx_upload.png)