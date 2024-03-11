# yank-note笔记的docker
[yank-note](https://github.com/purocean/yn)，是一款好用的笔记软件，推荐使用

docker构建的基本思路：
* vnc+novnc访问原生界面
* 通过nginx反向代理加授权为原生程序的web加一道权限

## 运行
* 8180是yank-note的gui的web接口（先登录这里，可以把语言改为中文，然后新建一个笔记库）
* 3045是对应开启note-web服务的接口（需要提前通过8180端口程序先新建笔记库，这里无法新建的）
* PASSWORD是gui和web的密码，账户是：`abc`
* /config是数据目录

```bash
docker run --restart=unless-stopped --name=yank-note \
    --security-opt seccomp=unconfined \
    -e PUID=1000 -e PGID=1000 -e TZ=Asia/Shanghai \
    -e PASSWORD=cbug404 -p 3045:3045 -p 8180:8180 \
    -v yank-note:/config \
    cbug404/docker-yank-note:latest
```

## 使用

1. 登陆：`http://ip:3045`，输入运行配置信息：账号`abc`密码`cbug404`
2. 把软件设置为中文，然后创建一个笔记库；这步只需要第一次运行需要，以后直接第3步就好
3. 然后平时记笔记就可以用：`http://ip:8180`来管理笔记，账号密码同步骤1，使用起来非常丝滑

>还有不懂的，可以关注公众号来获取视频说明，[具体看底部说明](#获取帮助和支持)

## 插件推荐

1.  `Luckysheet`，类似excel
2.  `Code Runner`插件，方便运行代码

## 移动端

移动端没有很好的客户端，可以使用[gitjournal](https://github.com/GitJournal/GitJournal)临时凑合用，可以直接连接git相关地址，查看里面的文档

## 获取帮助和支持
更多视频的使用说明关注公众号`程序员派对`，回复：`yank-note`来获取

|![程序员派对](https://raw.githubusercontent.com/cbug404/cbug404/main/assets/gzh.jpg)|![赞赏](https://raw.githubusercontent.com/cbug404/cbug404/main/assets/zsm-m.jpg)|
|:-:|:-:|
|回复 `yank-note` 获取视频|如果你觉得有用支持下|
