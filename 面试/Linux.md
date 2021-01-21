# 1 Linux介绍

## 1.1 Linux内核

[The Linux Kernel Archives](https://www.kernel.org/) linux内核网站

查看内核信息：

1. uname -a：可显示电脑以及操作系统的相关信息

   ```bash
   [root@CentOS ~]# uname -a
   Linux CentOS 3.10.0-1160.11.1.el7.x86_64 #1 SMP Fri Dec 18 16:34:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
   ```

2. cat /proc/version：说明正在运行的内核版本

   ```bash
   [root@CentOS ~]# cat /proc/version
   Linux version 3.10.0-1160.11.1.el7.x86_64 (mockbuild@kbuilder.bsys.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC) ) #1 SMP Fri Dec 18 16:34:56 UTC 2020
   ```

3. cat /etc/issue：查看发行版本

   ```bash
   
   ```

4. lsb_release -a：显示LSB和特定版本的相关信息

   > lsb: Linux Standards Base，LSB是一套核心标准，它保证了LINUX发行版同LINUX应用程序之间的良好结合

   ```bash
   [root@CentOS ~]# lsb_release -a
   LSB Version:    :core-4.1-amd64:core-4.1-noarch:cxx-4.1-amd64:cxx-4.1-noarch:desktop-4.1-amd64:desktop-4.1-noarch:languages-4.1-amd64:languages-4.1-noarch:printing-4.1-amd64:printing-4.1-noarch
   Distributor ID: CentOS
   Description:    CentOS Linux release 7.9.2009 (Core)
   Release:        7.9.2009
   Codename:       Core
   ```

   ```
   -v 显示版本信息。
   -i 显示发行版的id。
   -d 显示该发行版的描述信息。
   -r 显示当前系统是发行版的具体版本号。
   -c 发行版代号。
   -a 显示上面的所有信息。
   -h 显示帮助信息。
   ```

## 1.2 发行版

​		Linux 主要作为Linux发行版（通常被称为"distro"）的一部分而使用。这些发行版由个人，松散组织的团队，以及商业机构和志愿者组织编写。它们通常包括了其他的系统软件和应用软件，以及一个用来简化系统初始安装的安装工具，和让软件安装升级的集成管理器。大多数系统还包括了像提供GUI界面的XFree86之类的曾经运行于BSD的程序。 一个典型的Linux发行版包括：Linux内核，一些GNU程序库和工具，命令行shell，图形界面的X Window系统和相应的桌面环境，如KDE或GNOME，并包含数千种从办公套件，编译器，文本编辑器到科学工具的应用软件。

## 1.3 GNU

> GNU's Not Unix
>
> GNU是为了打破Unix系统的封闭，创建一个自由开放的操作系统，但至今完备功能的内核尚未被开发成功。

​		GNU是一个自由的操作系统，其内容软件完全以GPL方式发布。这个操作系统是GNU计划的主要目标，名称来自GNU's Not Unix!的递归缩写，因为GNU的设计类似Unix，但它不包含具著作权的Unix代码。

- 在自由的时代用户应该免费享有对软件源代码阅读、修改的权利
- 软件公司可以靠提供服务和训练获得盈利

## 1.4 GPL

> 通用性公开许可证（General Public License）

​		GPL同其它的自由软件许可证一样，许可社会公众享有：运行、复制软件的自由，发行传播软件的自由，获得软件源码的自由，改进软件并将自己作出的改进版本向社会发行传播的自由。

## 1.5 Linux和Unix的关系

GNU/Linux：linux弥补了GNU缺乏内核的缺陷。

Linux是在GNU的背景下，借鉴MiniX操作系统产生的。

- Unix：只针对大型主机或服务器
- GNU/Linux：适用于x86的个人计算机

# 2 Linux安装

## 2.1 分区

Linux主要分为三个区：

- boot：引导区（1G、ext4）
- swap：交换区 （跟内存设置成一样大、swap）
- / : 根分区 （剩余的硬盘存储空间、ext4）

Kdump：是一个内核崩溃转储机制，在系统崩溃的时候，Kdump将捕获系统崩溃信息。这对于诊断崩溃的原因很重要，但同时也会消耗一部分内存空间，并且这部分内存空间其他用户无法使用。

## 2.2 网络配置

网络连接的三种模式：

1. 桥接模式：虚拟主机直接连接到外部系统
2. NAT：网络地址转换
3. 主机模式：独立的系统，自建局域网

## 2.3 虚拟机的克隆

方式一：直接拷贝一份安装好的虚拟机文件

方式二：使用vmware的克隆操作，克隆时要关闭linux系统

## 2.4 Linux目录结构

1. linux的文件系统是采用级层式的树状目录结构，此结构的最上层是根目录"/"，然后在此目录下再创建其他目录；
2. 在Linux世界里，一切皆文件。

![image-20210121005638756](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210121005638756.png)

- /usr/bin 系统预装的一些可执行程序，随系统升级会改变

- /usr/local/bin 用户安装的可执行程序，不受系统升级影响，用户编译安装软件时，一般放到/usr/local目录下

*如果两个目录含有相同的可执行程序，通过查看PATH，比较优先级：

```bash
[root@clcheng /]# echo $PATH
/home/clcheng/.local/bin:/home/clcheng/bin:/home/clcheng/.local/bin:/home/clcheng/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
```

PATH这个目录下放的可执行程序，在系统任何地方都可以直接执行，不需要指定路径

首先注意usr 指 **Unix System Resource**，而不是User 然后通常/usr/bin下面的都是系统预装的可执行程序，会随着系统升级而改变 /usr/local/bin目录是给用户放置自己的可执行程序的地方，推荐放在这里，不会被系统升级而覆盖同名文件 如果两个目录下有相同的可执行程序，谁优先执行受到PATH环境变量的影响，比如我的一台服务器的PATH变量为 echo $PATH /usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/dean/bin 这里/usr/local/bin优先于/usr/bin,

### 2.4.1 具体文件结构

- /bin (/usr/bin、/usr/local/bin)

  Binary的缩写，存放着最常使用的命令

- /sbin (/usr/sbin、/usr/local/sbin)

  s就是Super User的意思，存放的是系统管理员使用的系统管理程序

- /etc

  所有的系统管理所需要的配置文件和子目录，比如安装mysql数据库my.conf

- /usr    

  > 程序都安装在里面，是Unix System Resources的缩写。/usr 是Linux系统核心所在，包含了所有的共享文件、二进制文件、各种文档、各种头文件、各种库；还有诸多程序：ftp、telnet等。类似于windows下的program files目录

  /usr 文件系统经常很大，因为所有程序安装在这里。 /usr 里的所有文件一般来自Linux distribution；本地安装的程序和其他东西在/usr/local 下。这样可能在升级新版系统或新distribution时无须重新安装全部程序。

  > which + 命令（可执行程序） 可以查看命令的路径
  >
  > echo $PATH 输出环境变量

  - /usr/bin： 系统（distribution）预装的一些可执行程序，随系统升级会改变：gcc、telnet

  - /usr/local/bin： 用户安装的可执行程序，不受系统升级影响，用户编译安装软件时，一般放到/usr/local目录下
  - /usr/local：主要存放那些手动安装（源码）的软件，即不是通过apt-get安装的软件
    - apt-get默认安装路径
      1. 下载的软件存放位置：/var/cache/apt/archives
      2. 安装后软件默认位置：/usr/share
      3. 可执行文件位置：/usr/bin
      4. 配置文件位置：/etc
      5. lib文件位置：/usr/lib
  - /usr/include：编译文件等时所需要的各种头文件
  - /usr/lib：所有可执行文件所需要的库文件
  - /usr/share：包含了各种程序间的共享文件，如字体、图标、文档等
  - /usr/src：Linux内核的源码和说明文档

- /boot

  存放的是启动Linux时使用的一些核心文件，包括一些连接文件以及镜像文件
  
- /var 

  这个目录中存放着不断扩充着的东西，习惯将经常被修改的目录放在这个目录下。包括各种日志文件



- /dev

  类似于windows的设备管理器，把所有的硬件用文件的形式存储：cpu、disk、bus等

- /mnt

  临时挂载别的文件系统，我们可以将外部的存储设备挂载在/mnt/上，然后进入该目录就可以查看其中的内容

- /media
	
  linux会自动识别一些设备，例如U盘、光驱等等，当识别后，linux会把识别的设备挂载到这个目录下



- /home

  存放普通用户的子目录，linux中每个用户都有一个自己的目录

- /root

  系统管理员主目录



- /proc

  这个目录是个虚拟目录，它是系统内存的映射，访问这个目录来获取系统信息

- /srv

  service的缩写，该目录存放一些服务启动之后需要提取的数据

- /lib

  系统开机所需要最基本的动态连接共享库，其作用类似于Windows里的DLL文件。几乎所有的应用程序都需要用到这些共享库

- /opt

  给主机额外安装软件所摆放的位置

- /tmp

  用来存放一些临时文件

- /lost+found （默认隐藏）

  这个目录一般是空的，当系统非法关机后，这里就存放了一些文件

## 2.5 主机名

> 主机名配置文件(static)
>
> /etc/hostname

```bash
# 查看主机名配置文件，查看到的是静态的
cat /etc/hostname

# 查看当前linux操作系统相关信息（主机名称、内核版本号、硬件架构和操作系统类型等）
uname -a
[root@CentOS ~]# uname -a
Linux CentOS 3.10.0-1160.11.1.el7.x86_64 #1 SMP Fri Dec 18 16:34:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

# 查看操作系统环境
cat /etc/redhat-release
[root@CentOS ~]# cat /etc/redhat-release
CentOS Linux release 7.9.2009 (Core)
```

在CentOS中有三种定义的主机名：

- Static hostname：静态主机名

  也称内核主机名，是系统在启动时从/etc/hostname文件中自动初始化的主机名

- Tansient hostname：瞬态主机名

  系统运行期间临时分配的主机名。例如，通过DHCP或mDNS服务器分配

- Pretty hostname：灵活主机名

  允许使用自由形式（包括特殊/空白主机名）的主机名，以展示给终端用户

在CentOS7中，有个叫hostnamectl的命令行工具，它允许查看或修改与主机名相关的配置

### 2.5.1 查看主机名

```bash
# 查看当前主机名的情况
[root@CentOS ~]# hostnamectl
   Static hostname: CentOS
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 20190711105006363114529432776998
           Boot ID: f3da6a8f9c3f4a1ba3437fa82562ef33
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-1160.11.1.el7.x86_64
      Architecture: x86-64
```

```bash
# 只查看静态、瞬时或灵活主机名
hostnamectl --static
hostnamectl --transient
hostnamectl --pretty
```

### 2.5.2 修改主机名

> 在修改静态/瞬态主机名时，任何特殊字符或空白字符会被移除，而提供的参数中的任何大写字母会自动转化为小写

```bash
# 修改瞬时名
hostname transientName
[root@CentOS ~]# hostname xh01
[root@CentOS ~]# hostname
xh01
[root@CentOS ~]# hostnamectl --transient
xh01
```

```bash
# 修改静态主机名
hostnamectl set-hostname xxx
```

**永久生效：**

修改配置文件/etc/hostname来实现主机名的修改。把该文件内容hostname中的name替换成自己想要的主机名重启即可。

# 3 vi 和 vim

## 3.1 三种模式

1. 正常模式

2. 插入模式

3. 命令行模式

   

### 3.1.1 快捷键

**撤销：**

```bash
u	撤销上一步操作
```

**反撤销：**

```bash
ctrl + r	反撤销
```

**U命令：**

```bash
U 命令	该命令会一次性撤销自上次移动到当前行以来做过的所有操作，再使用一次 U 命令则撤销之前的 U 命令所做的操作，恢复被撤销的内容。
```

**复制：**y

```bash
yy 拷贝当前行
5yy 拷贝当前行向下5行
```

**粘贴：**p

```bash
p 粘贴
```

**删除：**d

```bash
dd 删除当前行
5dd 删除当前行向下5行
```

**剪切：**c

```bash
cw	剪切一个单词
cl	剪切一个字母
cc 剪切一整行
c5c	剪切5行
```



**查找：**

```bash
#命令行模式：
/key	回车搜索
输入n查找下一个
输入N查找上一个
```

**行定位：**

```bash
G	最末行
gg	最首行
num + shift + g		定位到num行
:num	光标定位到num行
```

## 3.2 进入插入模式

**插入模式：**

```bash
"i"                在光标所在位置插入字符
"I"               在光标所在行的行首插入字符
"o"              在光标所在行的下一行新行插入字符
"O"             在光标所在行的上以行新行插入
"s"              删除光标所在字符并插入字符
"S"              删除光标所在行并插入字符
"a"              光标所在字符的下一个字符插入
"A"              光标所在行的行尾插入字符
```

# 4 关机注销

## 4.1 关机&重启

- shutdown -h now	立刻关机
  - -h	halt：关机、停止、停下
- shutdown -h 1 "comment"    指定一分钟后关机，并以广播的形式通知所有的多用户终端”comment“信息
- shutdown -r now    重启
- halt    立刻关机
- reboot     立刻重启
- sync    将内存数据同步到磁盘中
- shutdown   默认执行”shutdown -h -1"

*目前的shutdown/halt/reboot等命令在关机前都会自动执行sync

## 4.2 登录&注销

- 正常生产环境应该使用用户账户登录，需要时再使用su命令切换到系统管理员身份，避免权限过大，出现操作失误
- logout注销指令在图形界面运行级别无效，在命令行界面有效