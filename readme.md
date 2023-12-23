# yank-note笔记的docker

## 使用说明

开发：

```bash
docker build  -t cbug404/docker-yank-note:1.0.0 .
```

运行:

```bash
# 端口说明：8180是yank-note的gui的web接口；3045是对应开启web服务的接口，PASSWORD是gui和web的密码
# 挂载目录示例：-v /tmp/yank-note:/config
docker run --restart=unless-stopped  --name=yank-note --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Asia/Shanghai -e PASSWORD=cbug404 -p 3045:3045 -p 8180:8180 cbug404/docker-yank-note:1.0.0
```

## 插件推荐

1.  `Luckysheet`，类似excel
2.  `Code Runner`插件，方便运行代码

## 移动端

移动端使用[gitjournal](https://github.com/GitJournal/GitJournal)，可以直接连接git相关地址，查看里面的文档
