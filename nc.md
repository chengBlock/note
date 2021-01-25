# 1.Windows安装netcat

https://eternallybored.org/misc/netcat/

解压文件后，设置环境环境变量后，在命令行输入nc即可使用

# 2.CentOS安装netcat

自带

# 3.netcat基本操作

## 3.1 简单文本传输

一、服务器端

```bash
# 监听本机端口port
# l:listen
# p:Port
nc -l -p [local_port]
```

![image-20210124095317101](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210124095317101.png)

二、客户端

```bash
# 连接服务器
nc [remote_host] [remote_port]
```

![image-20210124095336717](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210124095336717.png)

## 3.2 返回shell的使用

一、服务器端

```bash
# 返回windows下的cmd程序
# e:指定软件
nc -l -p [local_port] -e cmd.exe
```

![image-20210124101549287](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210124101549287.png)

二、客户端

```bash
# 连接服务器
nc [remote_host] [remote_port]
```

![image-20210124101606660](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210124101606660.png)