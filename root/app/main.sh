#!/bin/bash
# 更改一些配置
set -eo pipefail

apt update

# 安装工具
apt-get install -y wget gdebi vim gnome-terminal
# 解决能输入中文问题
apt-get install -y dbus fcitx-rime fonts-wqy-microhei ttf-wqy-zenhei
# 解决一些报错问题，但不重要
apt-get install -y python3-xdg 

# 解决vim中文乱码的问题，还有鼠标复制的问题
echo 'set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set mouse=' >> ~/.vimrc

# 安装
wget https://github.com/purocean/yn/releases/download/v${VERSION}/Yank-Note-linux-amd64-${VERSION}.deb -O /tmp/yank-note.deb
gdebi -n /tmp/yank-note.deb && rm -f /tmp/yank-note.deb

# 增加nginix反向代理方便web使用，重启：s6-svc -r /run/service/svc-nginx
# 注意这里一定不能传递授权，否则/api/settings无法获取到数据
# 灵感来源：https://liujia.anqun.org/index.php/archives/1270/
echo '# 重启：s6-svc -r /run/service/svc-nginx
server {
  auth_basic               "Login";
  auth_basic_user_file     /etc/nginx/.htpasswd;
  listen 3045 default_server;
  listen [::]:3045 default_server;
  location / {
    proxy_http_version      1.1;
    proxy_set_header        Host $host;
    proxy_set_header        Upgrade $http_upgrade;
    proxy_set_header        Connection "upgrade";
    proxy_set_header        X-Real-IP $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Forwarded-Proto $scheme;
    proxy_set_header        Authorization "";
    proxy_pass              http://127.0.0.1:3044;
  }
}' > /etc/nginx/sites-available/yank-note
cd /etc/nginx/sites-enabled && ln -s /etc/nginx/sites-available/yank-note

# 保存home目录
cp -r /config /config.bak

