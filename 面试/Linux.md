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

# 5 用户管理

> Linux系统是一个多用户多任务的操作系统，任何一个要使用系统资源的用户，都必须首先向系统管理员申请一个账号，然后以这个账号的身份进入系统。

- groups 用户名   查看用户所在的组，以及组内成员

- /etc/group    文件包含所有组，用户组配置文件

  每一个组一条记录，4个字段分别为：组名：密码：组ID：组内用户列表（仅显示将该组作为附加组的用户）

- /etc/gshadow   用户组的影子文件

- /etc/shadow    用户影子口令文件

  每一个用户一条记录，9个字段含义：用户名：加密口令：最后一次修改时间：最小时间间隔：最大时间间隔：警告时间：不活动时间：失效时间：标志

- /etc/passwd    用户的配置文件

  每一个用户一条记录，7个字段分别为：用户名：密码（隐藏显示x）：用户ID：用户主组ID：用户描述：用户主目录：用户默认shell

  **用户的口令在/etc/shadow文件中验证**

## 5.1 添加用户

```bash
useradd 用户名
useradd -d 指定目录 新的用户名（指定新创建用户的家目录）
useradd -M 用户名	不创建用户主目录

passwd 用户名
passwd 不加用户名就默认修改当前登录的账户
```

## 5.2 删除用户

> 一般情况下保留家目录,保留工作的数据

```bash
userdel 用户名

# 删除用户，但是要保留家目录
userdel 用户名
# 删除用户以及用户主目录
userdel -r 用户名
```

```bash
[root@CentOS ~]# which userdel	#sbin 超级用户权限
/usr/sbin/userdel
[root@CentOS ~]# which useradd	#sbin 超级用户权限
/usr/sbin/useradd
[root@CentOS ~]# which passwd
/usr/bin/passwd

[clcheng@CentOS ~]$ passwd clcheng
passwd：只有根用户才能指定用户名。
```

## 5.3 查询用户信息指令

```bash
id 用户名
```

```bash
[root@CentOS ~]# which id
/usr/bin/id
[root@CentOS ~]# id root
uid=0(root) gid=0(root) 组=0(root)
[root@CentOS ~]# id clcheng
uid=1000(clcheng) gid=1000(clcheng) 组=1000(clcheng)
[root@CentOS ~]# id cheng
id: cheng: no such user
```

## 5.4 切换用户

> 1.从权限高的用户切换到权限低的用户，不需要输入密码，反之需要；
>
> 2.当需要返回到原来用户时，使用exit/logout指令。

```bash
su - 切换用户
```

## 5.5 查看当前用户/登录用户

```bash
whoami
who am i
```

```bash
[root@CentOS ~]# whoami
root
[root@CentOS ~]# who am i
root     pts/0        2021-01-21 21:57 (39.180.60.172) # 登录的ip
```

## 5.6 管理用户和用户组

- usermod：修改用户命令，可以通过usermod来修改登录名、用户的家目录等等；
- groupmod：修改用户组信息



# 6 用户组

> 类似于角色，系统可以对有共性的多个用户进行统一的管理

创建一个新用户时且未指定组时，默认创建一个同名组，作为该用户的主组

## 6.1 新增组

```bash
groupadd 组名
```

## 6.2 删除组

```bash
groupdel 组名
```

## 6.3 增加用户时直接加上组

```bash
useradd -g 用户组 用户名
```

## 6.4 主组和附加组

### 6.4.1 主组

也叫初始组，是用户登录系统时的组，规则如下：

- 创建新用户时，若未明确指定该用户所属的主组，会默认创建一个与用户名相同的组，作为用户的主组
- 用户创建文件时，文件的所属权限组就是当前用户的主组
- 用户有且仅有一个主组
- 用户使用`useradd -g 用户名`可以指定主组
- 用户的主组不能被删除
- 用户不能直接被移出主组，但可以更换主组
- 用户被删除时它的主组若没有其他所属用户，则会自动删除该主组n

### 6.4.2 附加组

登录后可切换的其他组，规则如下：

- 使用`useradd -G 用户组 用户名`可以指定附加组
- 用户可以所属零个或多个附加组
- 用户的附加组和主组可相同
- 附加组可以直接被删除而无需关心是否所属于用户
- 附加组可以新增和移除任意个所属用户
- 用户被删除时所属附属组不会受影响

### 6.4.3 修改用户的主组

```bash
usermod -g group1 user1
```

### 6.4.4 将用户加入附属组

建议使用`gpasswd`命令而不是`usermod`，因为`usermod -G`命令如果不写全用户的附属组，会清空之前的所有附属组

```bash
gpasswd -a user1 group2
```

# 7 运行级别

**运行级别说明：**

```bash
0：关机
1：单用户	（找回丢失root密码）
2：多用户无网络服务	（一般不适用）
3：多用户有网络服务
4：系统未使用保留给用户
5：图像界面
6：系统重启

常用的运行级别是3和5，也可以指定默认用户级别
```

## 7.1 切换用户级别

**命令：**init [0123456]

```bash
[root@CentOS ~]# cat /etc/inittab
# inittab is no longer used when using systemd.
#
# ADDING CONFIGURATION HERE WILL HAVE NO EFFECT ON YOUR SYSTEM.
#
# Ctrl-Alt-Delete is handled by /usr/lib/systemd/system/ctrl-alt-del.target
#
# systemd uses 'targets' instead of runlevels. By default, there are two main targets:
#
# multi-user.target: analogous to runlevel 3
# graphical.target: analogous to runlevel 5
#
# To view current default target, run:
# systemctl get-default
#
# To set a default target, run:
# systemctl set-default TARGET.target
```

**查看当前默认用户运行级别:**

```bash
systemctl get-default
```

**设置默认用户运行级别：**

```bash
systemctl set-default TARGET.target
```

- multi-user.target->runlevel 3（多用户有网络服务）
- graphical.target->runlevel 5（图形界面）

# 8 帮助指令

- man [命令或配置文件]    （获取帮助信息）
- help 命令      （获得shell内置命令的帮助信息）
- 百度

# 9 时间日期类

**date 命令参数：**

```
-d<字符串>：显示字符串所指的日期与时间。字符串前后必须加上双引号； 
-s<字符串>：根据字符串来设置日期与时间。字符串前后必须加上双引号； 
-u：显示GMT； 
--help：在线帮助； 
--version：显示版本信息
```

## 9.1 显示当前日期

```bash
# 基本语法
1)date			显示当前时间
2)date "+ %Y"		显示当前年份
3)date "+ %m"		显示当前月份
4)date "+ %d"		显示当前日期
5)date "+ %Y-%m-%d %H:%M:%S" 	可以插入格式任意字符
6)date +%s		时间戳

# 日历
1)cal 		显示本月日历
2)cal 年份
```

```bash
clcheng@clcheng MINGW64 ~
$ date "+%Y/%m/%d %H:%M:%S"
2021/01/22 11:30:26
```

- Y：年
- m：月
- d：日
- H：时
- M：分
- S：秒

## 9.2 设置时间

- date -s "时间"
  - 只是暂时更新，重启后恢复实际时间

## 9.3 恢复&更新linux系统时间

- 安装ntpdate
  - yum install ntpdate
- 选择一个时间服务器来更新时间
  - ntpdate time.windws.com

## 9.4 时区(Time Zone)

> 由于世界各国家与地区经度不同，地方时也有所不同，因此会划分为不同的时区。

​		有关国际会议决定将地球表面按经线从东到西，划成一个个区域，并且规定相邻区域的时间相差1小时。在同一区域内的东端和西端的人看到太阳升起的时间最多相差不过1小时。当人们跨过一个区域，就将自己的时钟校正1小时（向西减1小时，向东加1小时），跨过几个区域就加或减几小时。这样使用起来就很方便。

​		正式的时区划分包括24个时区，每一时区由一个英文字母表示。每隔经度15°划分一个时区，有一个例外，每个时区有一条中央子午线；例如，GMT属于“z”区，因此其时间后通常添加后缀“Z”（口语中用后缀“Zulu”）。

| 时区  | 时区中心线 |
| :---: | :--------: |
|  UTC  |     0°     |
| UTC+8 |   120°E    |

中国时间是东八区，使用北京时间作为全国统一时间

### 9.4.1 CST

中国标准时间：China Standard Time UT+8:00

### 9.4.2 GMT

格林尼治标准时间：一般指世界时

# 10.RPM & YUM

## 10.1 rpm包的管理

​		rpm是linux用于互联网下载包的打包及安装工具，它包含在某些Linux分发版中。它生成具有.rpm扩展名的文件。RPM是RedHat Package Manager(RedHat 软件包管理工具)的缩写，(.rpm文件)类似于Windows的setup.exe,这一文件格式已经成为公认的行业标准（suse,redhat,centos等）

### 10.1.1 rpm包的简单查询指令

- 查询已安装的rpm列表：rpm -qa | grep mysql

  ```bash
  [root@CentOS ~]# rpm -qa | grep mysql
  mysql-community-client-8.0.23-1.el7.x86_64
  mysql-community-libs-8.0.23-1.el7.x86_64
  mysql-community-client-plugins-8.0.23-1.el7.x86_64
  mysql80-community-release-el7-3.noarch
  mysql-community-common-8.0.23-1.el7.x86_64
  *mysql-community-server-8.0.23-1.el7.x86_64 
  ```

- 查询软件包信息：rpm -qi mysql-community-server-8.0.23-1.el7.x86_64

  ```bash
  [root@CentOS ~]# rpm -qi mysql-community-server-8.0.23-1.el7.x86_64
  *Name        : mysql-community-server
  *Version     : 8.0.23
  *Release     : 1.el7
  *Architecture: x86_64
  Install Date: 2021年01月22日 星期五 11时39分26秒
  Group       : Applications/Databases
  Size        : 2535835057
  License     : Copyright (c) 2000, 2020, Oracle and/or its affiliates. Under GPLv2 license as shown in the Description field.
  Signature   : DSA/SHA1, 2020年12月16日 星期三 17时16分31秒, Key ID 8c718d3b5072e1f5
  Source RPM  : mysql-community-8.0.23-1.el7.src.rpm
  Build Date  : 2020年12月11日 星期五 16时53分12秒
  Build Host  : pb2-el7-09.appad3iad.mysql2iad.oraclevcn.com
  Relocations : (not relocatable)
  Packager    : MySQL Release Engineering <mysql-build@oss.oracle.com>
  Vendor      : Oracle and/or its affiliates
  URL         : http://www.mysql.com/
  Summary     : A very fast and reliable SQL database server
  Description :
  The MySQL(TM) software delivers a very fast, multi-threaded, multi-user,
  and robust SQL (Structured Query Language) database server. MySQL Server
  is intended for mission-critical, heavy-load production systems as wellas for embedding into mass-deployed software. MySQL is a trademark of
  Oracle and/or its affiliates
  
  The MySQL software has Dual Licensing, which means you can use the MySQL
  software free of charge under the GNU General Public License
  (http://www.gnu.org/licenses/). You can also purchase commercial MySQL
  licenses from Oracle and/or its affiliates if you do not wish to be bound by the terms of
  the GPL. See the chapter "Licensing and Support" in the manual for
  further info.
  
  The MySQL web site (http://www.mysql.com/) provides the latest news andinformation about the MySQL software.  Also please see the documentation
  and the manual for more information.
  
  This package includes the MySQL server binary as well as related utilities
  to run and administer a MySQL server.
  ```

- 查询软件包中的文件：rpm -ql mysql

  ```bash
  [root@CentOS ~]# rpm -ql mysql-community-server-8.0.23-1.el7.x86_64
  /etc/logrotate.d/mysql
  /etc/my.cnf
  /etc/my.cnf.d
  /usr/bin/ibd2sdi
  /usr/bin/innochecksum
  /usr/bin/lz4_decompress
  /usr/bin/my_print_defaults
  /usr/bin/myisam_ftdump
  /usr/bin/myisamchk
  /usr/bin/myisamlog
  /usr/bin/myisampack
  /usr/bin/mysql_secure_installation
  /usr/bin/mysql_ssl_rsa_setup
  /usr/bin/mysql_tzinfo_to_sql
  /usr/bin/mysql_upgrade
  /usr/bin/mysqld_pre_systemd
  /usr/bin/mysqldumpslow
  /usr/bin/perror
  /usr/bin/zlib_decompress
  /usr/lib/systemd/system/mysqld.service
  /usr/lib/systemd/system/mysqld@.service
  /usr/lib/tmpfiles.d/mysql.conf
  /usr/lib64/mysql/mecab
  /usr/lib64/mysql/mecab/dic
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/char.bin
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/dicrc
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/left-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/matrix.bin
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/pos-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/rewrite.def
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/right-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/sys.dic
  /usr/lib64/mysql/mecab/dic/ipadic_euc-jp/unk.dic
  /usr/lib64/mysql/mecab/dic/ipadic_sjis
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/char.bin
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/dicrc
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/left-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/matrix.bin
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/pos-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/rewrite.def
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/right-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/sys.dic
  /usr/lib64/mysql/mecab/dic/ipadic_sjis/unk.dic
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/char.bin
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/dicrc
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/left-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/matrix.bin
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/pos-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/rewrite.def
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/right-id.def
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/sys.dic
  /usr/lib64/mysql/mecab/dic/ipadic_utf-8/unk.dic
  /usr/lib64/mysql/mecab/etc
  /usr/lib64/mysql/mecab/etc/mecabrc
  /usr/lib64/mysql/plugin
  /usr/lib64/mysql/plugin/adt_null.so
  /usr/lib64/mysql/plugin/auth_socket.so
  /usr/lib64/mysql/plugin/component_audit_api_message_emit.so
  /usr/lib64/mysql/plugin/component_log_filter_dragnet.so
  /usr/lib64/mysql/plugin/component_log_sink_json.so
  /usr/lib64/mysql/plugin/component_log_sink_syseventlog.so
  /usr/lib64/mysql/plugin/component_mysqlbackup.so
  /usr/lib64/mysql/plugin/component_query_attributes.so
  /usr/lib64/mysql/plugin/component_reference_cache.so
  /usr/lib64/mysql/plugin/component_validate_password.so
  /usr/lib64/mysql/plugin/connection_control.so
  /usr/lib64/mysql/plugin/ddl_rewriter.so
  /usr/lib64/mysql/plugin/debug
  /usr/lib64/mysql/plugin/debug/adt_null.so
  /usr/lib64/mysql/plugin/debug/auth_socket.so
  /usr/lib64/mysql/plugin/debug/component_audit_api_message_emit.so
  /usr/lib64/mysql/plugin/debug/component_log_filter_dragnet.so
  /usr/lib64/mysql/plugin/debug/component_log_sink_json.so
  /usr/lib64/mysql/plugin/debug/component_log_sink_syseventlog.so
  /usr/lib64/mysql/plugin/debug/component_mysqlbackup.so
  /usr/lib64/mysql/plugin/debug/component_query_attributes.so
  /usr/lib64/mysql/plugin/debug/component_reference_cache.so
  /usr/lib64/mysql/plugin/debug/component_validate_password.so
  /usr/lib64/mysql/plugin/debug/connection_control.so
  /usr/lib64/mysql/plugin/debug/ddl_rewriter.so
  /usr/lib64/mysql/plugin/debug/group_replication.so
  /usr/lib64/mysql/plugin/debug/ha_example.so
  /usr/lib64/mysql/plugin/debug/ha_mock.so
  /usr/lib64/mysql/plugin/debug/innodb_engine.so
  /usr/lib64/mysql/plugin/debug/keyring_file.so
  /usr/lib64/mysql/plugin/debug/keyring_udf.so
  /usr/lib64/mysql/plugin/debug/libmemcached.so
  /usr/lib64/mysql/plugin/debug/libpluginmecab.so
  /usr/lib64/mysql/plugin/debug/locking_service.so
  /usr/lib64/mysql/plugin/debug/mypluglib.so
  /usr/lib64/mysql/plugin/debug/mysql_clone.so
  /usr/lib64/mysql/plugin/debug/mysql_no_login.so
  /usr/lib64/mysql/plugin/debug/rewrite_example.so
  /usr/lib64/mysql/plugin/debug/rewriter.so
  /usr/lib64/mysql/plugin/debug/semisync_master.so
  /usr/lib64/mysql/plugin/debug/semisync_slave.so
  /usr/lib64/mysql/plugin/debug/validate_password.so
  /usr/lib64/mysql/plugin/debug/version_token.so
  /usr/lib64/mysql/plugin/group_replication.so
  /usr/lib64/mysql/plugin/ha_example.so
  /usr/lib64/mysql/plugin/ha_mock.so
  /usr/lib64/mysql/plugin/innodb_engine.so
  /usr/lib64/mysql/plugin/keyring_file.so
  /usr/lib64/mysql/plugin/keyring_udf.so
  /usr/lib64/mysql/plugin/libmemcached.so
  /usr/lib64/mysql/plugin/libpluginmecab.so
  /usr/lib64/mysql/plugin/locking_service.so
  /usr/lib64/mysql/plugin/mypluglib.so
  /usr/lib64/mysql/plugin/mysql_clone.so
  /usr/lib64/mysql/plugin/mysql_no_login.so
  /usr/lib64/mysql/plugin/rewrite_example.so
  /usr/lib64/mysql/plugin/rewriter.so
  /usr/lib64/mysql/plugin/semisync_master.so
  /usr/lib64/mysql/plugin/semisync_slave.so
  /usr/lib64/mysql/plugin/validate_password.so
  /usr/lib64/mysql/plugin/version_token.so
  /usr/lib64/mysql/private
  /usr/lib64/mysql/private/libprotobuf-lite.so.3.11.4
  /usr/lib64/mysql/private/libprotobuf.so.3.11.4
  /usr/sbin/mysqld
  /usr/sbin/mysqld-debug
  /usr/share/doc/mysql-community-server-8.0.23
  /usr/share/doc/mysql-community-server-8.0.23/INFO_BIN
  /usr/share/doc/mysql-community-server-8.0.23/INFO_SRC
  /usr/share/doc/mysql-community-server-8.0.23/LICENSE
  /usr/share/doc/mysql-community-server-8.0.23/README
  /usr/share/man/man1/ibd2sdi.1.gz
  /usr/share/man/man1/innochecksum.1.gz
  /usr/share/man/man1/lz4_decompress.1.gz
  /usr/share/man/man1/my_print_defaults.1.gz
  /usr/share/man/man1/myisam_ftdump.1.gz
  /usr/share/man/man1/myisamchk.1.gz
  /usr/share/man/man1/myisamlog.1.gz
  /usr/share/man/man1/myisampack.1.gz
  /usr/share/man/man1/mysql_secure_installation.1.gz
  /usr/share/man/man1/mysql_ssl_rsa_setup.1.gz
  /usr/share/man/man1/mysql_tzinfo_to_sql.1.gz
  /usr/share/man/man1/mysql_upgrade.1.gz
  /usr/share/man/man1/mysqldumpslow.1.gz
  /usr/share/man/man1/mysqlman.1.gz
  /usr/share/man/man1/perror.1.gz
  /usr/share/man/man1/zlib_decompress.1.gz
  /usr/share/man/man8/mysqld.8.gz
  /usr/share/mysql-8.0/dictionary.txt
  /usr/share/mysql-8.0/innodb_memcached_config.sql
  /usr/share/mysql-8.0/install_rewriter.sql
  /usr/share/mysql-8.0/mysql-log-rotate
  /usr/share/mysql-8.0/uninstall_rewriter.sql
  /var/lib/mysql
  /var/lib/mysql-files
  /var/lib/mysql-keyring
  /var/run/mysqld
  ```

- 查询文件所属的软件包：rpm -qf file

  ```bash
  [root@CentOS ~]# rpm -qf /var/run/mysqld/
  mysql-community-server-8.0.23-1.el7.x86_64
  ```

### 10.1.2 rpm包名基本格式

mysql-community-common-8.0.23-1.el7.x86_64

- 软件名：mysql-community-common
- 版本号：8.0.23
- 使用操作系统：1.el7
  - EL5软件包用于在Red Hat 5.x, CentOS 5.x, CloudLinux 5.x的安装
  - EL6软件包用于在Red Hat 6.x, CentOS 6.x, and CloudLinux 6.x进行安装
  - EL7 软件包用于在Red Hat 7.x, CentOS 7.x, and CloudLinux 7.x的安装
- 系统架构：x86_64

```bash
*Name        : mysql-community-server
*Version     : 8.0.23
*Release     : 1.el7
*Architecture: x86_64
```

### 10.1.3 卸载rpm包

- rpm -e 包名：//erase

如果其他软件包依赖要卸载的软件包，卸载时则会产生错误信息。但是可以增加参数`--nodeps`就可以强制删除，一般不推荐这样做，因为依赖于该软件包的程序可能无法运行。所以卸载软件都是先卸载高层，再卸载底层软件。

### 10.1.4 安装rpm包

- rpm -ivh 本地包文件
  - i：install 安装
  - v：verbose 提示
  - h：hash 进度条

## 10.2 yum

Yum是一个Shell前端软件包管理器，基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包

### 10.2.1 yum的基本指令

- 安装：yum install package
- 全部更新：yum update/upgrade
- 更新指定程序：yum update/upgrade package
- 检查可更新的程序：yum check-update
- 显示可以安装的程序包：yum list
- 显示指定的可以安装的程序包：yum list package
- 删除程序：yum remove package
- 查看程序package的依赖情况：yum deplist package

# 11.配置Java EE开发环

## 11.1 linux环境配置命令

### 11.1.1 软连接

```shell
ln 参数 源文件或目录 目标文件或目录

ln -s log2013.log link2013
```

- -b 删除，覆盖以前建立的链接
- -d 允许超级用户制作目录的硬链接
- -f 强制执行
- -i 交互模式，文件存在则提示用户是否覆盖
- -n 把符号链接视为一般目录
- -s 软链接(符号链接)
- -v 显示详细的处理过程

### 11.1.2 环境变量

> Linux export 命令用于设置或显示环境变量

```bash
echo $PATH
```

```bash
export 参数 变量名称=变量设置值

export -p #列出当前的环境变量
export MYENV #定义环境变量MYENV
export MYENV="path" #定义环境变量
export PATH=$JAVA_HOME/bin:$PATH #添加path
```

- -f：代表“变量名称”中为函数名称
- -n：删除指定的变量。变量实际上并未删除，只是不会输出到后续指令的执行环境中
- -p：列出所有的shell赋予程序的环境变量

### 11.1.3 环境变量详解

**方法一：**直接修改当前`PATH`值

```bash
# 添加环境变量,"="两边不能有空格
# JAVA_HOME变量保存时结尾不需要加上"/"
export PATH=$JAVA_HOME/bin:$PATH
```

生效方式：立即生效

有效期限：临时改变，只能在当前终端窗口有效

用户局限：仅对当前用户

**方法二：**利用`.bashrc`文件开机自动执行的特性

```bash
vim ~/.bashrc
# 在最后一行添加
export PATH=$JAVA_HOME/bin:$PATH
```

生效方式：`source ./.bashrc`或重启终端

有效期限：永久有效

用户局限：仅对当前用户

**方法三：**修改用户环境变量`/etc/profile`

```bash
vim /etc/profile
# 找到设置PATH的行，添加
export JAVA_HOME=/usr/local/java/jdk1.8.0-261
export PATH=$JAVA_HOME/bin:$PATH
```

生效方式：系统重启（因为`/etc/profile`文件在用户第一次登录时执行）

有效期限：永久有效

用户局限：对所有用户

**方法四：**修改系统环境变量`/etc/environment`

```bash
vim /etc/environment
# 直接修改PATH变量
PATH="/usr/local"
```

**小结：**

- /etc/profile 是所有用户的环境变量
- /etc/environment是系统的环境变量

登录系统时shell读取的顺序应该是：

```bash
/etc/profile -> /etc/environment - > HOME/.profile -> HOME/.env
```

所以，如果同一个变量在用户环境`/etc/profile`和系统环境`/etc/environment`有不同的值，那就应该是以用户环境为准

- **HOME**是个系统变量，代表当前用户的家目录路径

  ```bash
  [clcheng@CentOS root]$ echo $HOME
  /home/clcheng
  ```

（1）/etc/profile： 此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行. 并从/etc/profile.d目录的配置文件中搜集shell的设置。
（2）/etc/bashrc: 为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取。
（3）~/.bash_profile: 每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件。
（4）~/.bashrc: 该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该该文件被读取。
（5） ~/.bash_logout:当每次退出系统(退出bash shell)时,执行该文件. 另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承 /etc/profile中的变量,他们是"父子"关系。
（6）~/.bash_profile 是交互式、login 方式进入 bash 运行的~/.bashrc 是交互式 non-login 方式进入 bash 运行的通常二者设置大致相同，所以通常前者会调用后者。

### 11.1.4 Linux之.bashrc文件作用

> Linux 系统中很多 shell，包括bash，sh，zsh，dash 和 korn 等，不管哪种 shell 都会有一个 `.bashrc` 的隐藏文件，它就相当于 shell 的配置文件。

一般会有多个`.bashrc`文件，打开终端时就会自动执行：

```bash
[root@CentOS ~]# find / -name .bashrc
/home/clcheng/.bashrc
/home/cheng/.bashrc
/home/zwj/.bashrc
/home/test/.bashrc
/etc/skel/.bashrc
```

不同目录下的 `.bashrc` 文件其作用不尽相同，比如：

- `/etc/skel/.bashrc`：文件将被复制到系统上创建的任何新用户的主文件夹中
- `/home/clcheng/.bashrc`：是bash的配置文件，保存个人的一些个性化设置，如别名、路径等

```bash
[root@CentOS ~]# cat .bashrc
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
================================================================
[root@CentOS ~]# cat /etc/skel/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
=================================================================
[root@CentOS ~]# cat /home/clcheng/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
```

每次修改`.bashrc`后，使用`source ~/.bashrc`就可以立刻加载修改后的设置，使之立即生效。

一般会在`.bash_profile`文件中显式调用`.bashrc`。登陆 `linux` 启动 `bash`时首先会去读取 `~/.bash_profile`文件，这样 `~/.bashrc`也就得到执行了，你的个性化设置也就生效了。

利用这一特性，可以实现一些个性化设置，如：Linux 系统开机执行自动某个脚本文件等，这在自动化运维方面有一定的用处。

1、修改 `/home/hj/.bashrc` 文件：

```python
sudo vim /home/hj/.bashrc

# 在最后添加两句后保存
echo '这句话开机就会启动'			# 打印输出
python3 /home/hj/test.py			# 执行 test.py  这个脚本
```

2、执行`source ./.bashrc`立即生效、或重启终端窗口。

## 11.2 安装JDK

```bash
1.mkdir /opt/jdk		#/opt是额外安装软件摆放的位置
2.jdk通过xftp6上传到/opt/jdk下
3.cd /opt/jdk
4.解压 tar -zxvf jdk-8u261-linux-x64.tar.gz
5.mkdir /usr/local/java
6.mv /opt/jdk/jdk1.8.0_261 /usr/local/java
7.vim /etc/profile	#配置环境变量的配置文件
# 在文件末尾添加export语句
8.export JAVA_HOME=/usr/local/java/jdk1.8.0_261 #定义环境变量
9.export PATH=$JAVA_HOME/bin:$PATH	#添加环境变量
10.source /etc/profile		#让配置文件生效

#测试是否生效
java -version
```

**注意：**linux执行程序时，若直接在终端输入程序名会优先从环境变量中查询

- `./java -version`：执行当前文件下的程序
- `java -version`：执行环境变量下的程序

## 11.3 安装Tomcat

1. 解压缩
2. `startup.sh or shutdown.sh`

- tomcat程序未在运行时，执行`shutdown.sh`会报错
- tomcat会自动导入jdk

## 11.4 安装IDEA（图形界面）

1. 下载linux安装包
2. 解压缩到`/opt/idea`
3. 启动`/opt/idea/bin`目录下的`./idea.sh`，配置jdk

## 11.5 安装mysql

[CentOS7.6安装MYSQL8.0](https://www.cnblogs.com/guarderming/p/11895778.html)

# 12.VM配置虚拟机

## 12.1 CentOS7

### 12.1.1 网络选择

使用NAT模式，虚拟机同样可以与主机通信。此时虚拟机与主机的`VMnet8`处于同一网段中，主机的IP地址为`VMnet8`网卡的IP地址。

**不要将NAT的DHCP修改到与主机同一网段中，这样会与实际网络产生冲突。**

- 桥接模式：VMnet0
- 仅主机模式：VMnet1
- NAT模式：VMnet8

实体机中会出现VMnet1、VMnet8两个虚拟网卡，但是VMnet0直接桥接到物理网卡上，默认不安装独立的网卡。

### 12.1.2 CentOS7普通用户添加sudo权限

```bash
# 1.切换root用户
su

# 2.修改/etc/sudoers的文件权限
chmod 640 /etc/sudoers

# 3.添加clcheng的sudoer权限
## Allow root to run any commands anywhere 
root	ALL=(ALL) 	ALL
clcheng	ALL=(ALL) 	ALL
## nopasswd,如果不想输入密码
## clcheng ALL=(ALL) NOPASSWD:ALL

# 4.恢复/etc/sudoers的默认权限
chmod 440 /etc/sudoers
```

### 12.1.3 CentOS7 共享文件夹

**步骤：**

1. 虚拟机设置共享文件夹
2. 进入CentOS中自动挂载共享文件夹



共享文件夹不能使用mount工具挂载，而是得用vmhgfs-fuse，需要使用安装工具包：

```bash
# 安装vm工具包（CentOS7默认自带）
# open-vm-tools-devel(centos)、open-vm-dkms(unbuntu)
yum install open-vm-tools-devel -y

[clcheng@CentOS hgfs]$ which vmhgfs-fuse
/usr/bin/vmhgfs-fuse
```

**脚本命令：**

```bash
# 查看共享目录情况
[clcheng@CentOS hgfs]$ vmware-hgfsclient
Share

# 临时生效
# Share是主机共享的文件名，挂载到/mnt/hgfs上
vmhgfs-fuse .host:/Share /mnt/hgfs

# 自动挂载
vim /etc/fstab
# 添加
.host:/Share /mnt/hgfs fuse.vmhgfs-fuse allow_other,defaults 0 0
```

### 12.1.4 linux配置ssh公钥认证

​		如果A主机想免密码登录到B主机上，则A主机上存放私钥，B 主机上存放公钥。通过ssh-keygen 命令生成的两个文件为：公钥文件 ~/.ssh/id_rsa.pub； 私钥文件 ~/.ssh/id_rsa 。

​		【而B主机上存放公钥时，需要将id_rsa.pub的内容存放到~/.ssh/authorized_keys 文件内，并且保证权限为600 。】（可以不使用这种方法）

一、生成和导入KEY

A主机上生成key

```bash
# -t 指定加密算法
ssh-keygen -t rsa
```

- 私钥：id_rsa
- 公钥：id_rsa.pub

使用ssh-copy-id命令将A主机的公钥自动添加到B主机的`authorized_keys`，且**不需要修改权限**，默认即为600

```bash
ssh-copy-id -i id_rsa.pub clcheng@远程服务器B的ip
```

二、配置sshd_config（sshd，服务器端）

配置完key后，B主机需要在`sshd_config`文件中开启key认证

```bash
vim /etc/ssh/sshd_config
# 允许ssh公钥认证登录
RSAAuthentication yes
PubkeyAuthentication yes
```

```bash
# 设置root用户能否通过SSH登录
PermitRootLogin yes
# 设置完密钥登录后，可以禁用密码登录
PasswordAuthentication no
```

重启sshd，使配置生效

```bash
systemctl restart sshd
```

- sshd、mysqld，在这里d是`daemon`的缩写，说明它自己是个**守护进程**，它在后台运行,一般都是用来做服务端程序。

三、ssh_config及多私钥配置（ssh，客户端）

​		当客户机需要连接多个服务器时，私钥管理有两种方案：

1. 在不同的主机上，使用相同的公钥，则这些机器的私钥也相同。客户端上只需要配置这一个私钥就可以登录所有的主机。

2. 不同的主机上使用不同的公钥时， 这时会有多个不同的私钥。这就需要为不同的主机指定不同的私钥文件，这个配置可以在ssh_config中配置（不存在时自己创建）：

   ```bash
   Host xxxx
   IdentityFile 私钥文件名
   Port 端口号
   User 你登陆xxxx服务器用的账号
   ```

## 12.2 Windows7

## 12.2.1 TMD，Win7可以安装vmtools工具

windows系统在VM中可以通过Vmware直接安装VmTools，但是CentOS上面是灰色的。

![image-20210123233042805](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210123233042805.png)

### 12.2.2 Win7配置共享文件夹

http://www.windows7en.com/jiaocheng/26974.html