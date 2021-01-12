# 英文意思

- alter : 改变、修改
- modify : 修饰,调整
- fetch : 拿来

# python命令

- pip install --user --upgrade pip : 升级pip
- pip -v list : 查看已安装package
- pip -V : 查看当前版本



- 格式化输出 : 占位符

```python
print("Hello%s,you are %d years old!" % (name,age))
#name将替换%s的位置，b将替换%d的位置，字符串后的%用来说明是哪些变量要替换前面的占位符，当只有一个变量的时候，可以省略括号
```



- 查看python安装路径（命令行模式）

  ```python
  In [1]: import sys
  
  In [2]: sys.path
  Out[2]:
  ['C:\\Users\\cheng\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\ipython.exe',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39\\python39.zip',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39\\DLLs',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39\\lib',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39',
   '',
   'C:\\Users\\cheng\\AppData\\Roaming\\Python\\Python39\\site-packages',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39\\lib\\site-packages',
   'c:\\users\\cheng\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\IPython\\extensions',
   'C:\\Users\\cheng\\.ipython']
  ```

  

# MySql基本使用

## 数据存储

- 持久化存储(存在硬盘上)
- 读写速度极高
- 保证数据有效性
- 对程序支持性非常好,容易扩展

*冯诺依曼计算机结构的存储器结构相当于现在的内存和外存,之所以分为内存和外存是考虑匹配CPU的高速运算与硬盘的性价比.

## RDBMS

- mysql : 存储关系型数据,需要先建表(提前确定数据之间关系)
- redis : 缓存
- mongodb : 存储非关系型数据(爬虫,存储没有关系的数据)

> Relational Database Management System : 关系型数据库系统

**我们学习学习数据库只是学习如果通过SQL语句操作数据库,拿到或生成我们需要的数据.**

![image-20210110200427947](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210110200427947.png)

## Navicat

![image-20210110205219115](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210110205219115.png)

![image-20210110205821514](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210110205821514.png)

## 数据完整性

- 一个数据库就是一个完整的业务单元可以包含多张表,数据就存在表中
- 为保证数据的正确有效,创建表时为表添加一些强制性的验证——字段的类型和约束



数据类型

| 数据类型 |        符号        |
| :------: | :----------------: |
|   整数   |      int,bit       |
|   小数   |      decimal       |
|  字符串  | varchar,char,text  |
| 日期时间 | date,time,datetime |
|   枚举   |        enum        |

- 特别说明
  - decimal表示浮点数,如decimal(5,2)表示共存5位数,小数占两位
  - char表示固定长度的字符串,如char(3),填充"ab"时会补一个空格"ab "
  - varchar表示可变字长的字符串,varchar(3)意思是最大长度是3
  - 字符串text表示存储大文本,当字符大于4000时推荐使用
  - <u>对于图片、音频、视频等二进制文件，并不存储在数据库中，而是上传到某个服务器中，在表中存储这个文件的url</u>



约束

- 主键primary key : 物理上存储的顺序

- 非空not null : 此字段不允许填写空值

- 唯一unique ： 此字段的值不允许重复

- 默认default : 默认值

- 外键foreign key : 对关系字段进行约束，当为关系字段填写值时，会到关联的表中查询此值是否存在

  - 存在，则填写成功

  - 不存在，则填写失败并抛出异常

    > 虽然外键约束可以保证数据有效性，但进行crud时，会降低数据库性能，所以不推荐使用。一般通过在逻辑层进行控制

# SQL

> SQL是一门特殊的语言,用于操作关系型数据库.<u>不区分大小写</u>

```python
# 创建Connection连接
conn = connect(host='localhost',port=3306,user='root',password='cheng123456',database='python1',charset='utf8')

# 得Cursor对象
cs = conn.cursor()

# 更新语句
# sql = 'update students set name="刘邦" where id =6'

# 删除语句
# sql = 'delete from students where id=6'

# select语句
sql = 'select id,name form students where id=7'

# 执行select语句,返回受影响的行数
count = cs.execute(sql)

# 打印受影响的行数
print(count)
                 
```

```sql
--显示创建数据库类型(字符集)
mysql> show create database python4;
+----------+-----------------------------------------------------------------------------------------------------+
| Database | Create Database                                                                                     |
+----------+-----------------------------------------------------------------------------------------------------+
| python4  | CREATE DATABASE `python4` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+-----------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
```

# 准备数据

## 创建数据表

```sql
create database JD charset=utf8;

use JD;

create table goods(
	id int unsigned primary key not null auto_increment,
    name varchar(150) not null,
    cate_name varchar(40) not null,
    brand_name varchar(40) not null,
    price decimal(10,3) not null default 0,
    is_show bit not null default 1,
    is_saleoff bit not null default 0
);
```

# Python操作Mysql

![image-20210111103512147](C:\Users\clcheng\AppData\Roaming\Typora\typora-user-images\image-20210111103512147.png)

游标:

> 游标是系统为用户开设的一个数据缓冲区,存放SQL语句的执行结果.

在数据库中，游标是一个十分重要的概念。游标提供了一种对从表中检索出的数据进行操作的灵活手段，就本质而言，游标实际上是一种能从包括多条数据记录的结果集中每次提取一条记录的机制。游标总是与一条SQL 选择语句相关联因为游标由结果集（可以是零条、一条或由相关的选择语句检索出的多条记录）和结果集中指向特定记录的游标位置组成。当决定对结果集进行处理时，必须声明一个指向该结果集的游标。如果曾经用 C 语言写过对文件进行处理的程序，那么游标就像您打开文件所得到的文件句柄一样，只要文件打开成功，该文件句柄就可代表该文件。对于游标而言，其道理是相同的。可见游标能够实现按与传统程序读取平面文件类似的方式处理来自基础表的结果集，从而把表中数据以平面文件的形式呈现给程序。

**引入模块**

- 在py文件中引入pymysql模块

```python
from pymysql import *
```

**Connection对象**

- 用于建立与数据库的连接
- 创建对象 : 调用connect()方法

```python
conn = connect(参数列表)
```

- 参数列表 : 
  - host :
  - port : 
  - database : 
  - user : 
  - password : 
  - charset : utf8
- 对象的方法 : 
  - close() : 关闭连接
  - commit() : 提交
  - cursor() ; 返回Cursor对象,用于执行sql语句并获得结果



**Cursor对象**

- 用于执行sql语句,使用频率最高的语句为select、insert、update、delete
- 获取Cursor对象 
- 遍历结果集

```python
cs1 = conn.cursor()
```

- 对象方法：
  - close()
  - execute(operation [,parameters])执行语句,返回受影响的行数
  - fetchone() : 执行查询语句时,获取查询结果集的第一行数据,返回一个元组,<u>同时游标指向下一条数据</u>
  - fetchall() : 执行查询语句时,获取结果集的所有行,一行构成一个元组,再将这些元组装入一个元组返回
  - fetmany() : 指定返回的数据数,并放在一个元组中
-  对象属性
  - rowcount : 只读属性,表示最近一次execute()执行后受影响的行数
  - connection : 获得当前连接对象

**查询一行数据**

```python
from pymysql import * 

def main():
    # 创建Connection连接
    conn = connect(host="localhost",port=3306,user="root",password="cheng123456",database="jd",charset="utf8")
    
    # 获得Cursor对象
    cursor = conn.cursor()
    
	"""执行代码的逻辑功能是用户自己设定的其他的都是固定模式"""
    
    # 执行查询语句,并返回受影响的行数:查询一行数据
    count = cursor.execute('select id,name from goods where id>=4')
    
    # 打印受影响的行数
    print("查询到%d条数据" % count)
    
    for i in range(count):
        # 获取查询的结果
        result = cursor.fetchone()
        # 打印查询的结果(元组形式)
        print(result)
        
        
    # 关闭连接
    cursor.close()
    conn.close()
    
"""
__name__ 是当前模块名，当模块被直接运行时模块名为 __main__ 。这句话的意思就是，当模块被直接运行时，以下代码块将被运行，当模块是被导入时，代码块不被运行。
"""
if _name_ == '_main__':
    main()
```

# Django

## MVC

MVC就是把Web应用分为Model、Controller、View三层，他们之间一种插件式、松耦合的方式连接在一起：

- Model：负责业务对象与数据库的映射（ORM）
- View：负责与用户交互（页面）
- Controller：负责接受用户的输入，调用模型和视图完成用户的请求

![img](https://images2018.cnblogs.com/blog/877318/201804/877318-20180418162558974-92667466.png)



## MTV

Django的MTV模式本质上和MVC是一样的，也是为了各组件间保持松耦合关系，只是定义上有些许不同，Django的MTV分别指：

- M（Model）：模型，负责业务对象和数据库的关系映射（ORM）
- T（Template）：模板，负责如何把页面展示给用户（html）
- V（View）：视图，负责业务逻辑，并在适当时候调用Model和Template

除了以上三层之外，还需要一个URL分发器，它的作用是将一个个URL的页面请求分发给不同的View处理，View再调用相应的Model和Template：

![img](https://images2018.cnblogs.com/blog/877318/201804/877318-20180418162350672-193671507.png)

**流程：**

1. 用户通过浏览器向服务器发起一个请求（request）：
2. 请求访问视图函数
3. 视图函数调用模型
4. 模型去数据库查找数据
5. 视图函数把模型层返回的数据填充到模板中
6. 返回模板（HTML页面）给用户

## Django操作

### 创建Django项目

1.下载Django

> pip install django

2.创建一个diango project

> django-admin.py startproject mysites

​	目录结构：

```python
mysites
--manage.py
--mysites
	--_init_.py
    --asgi.py
    --settings.py
    --urls.py
    --wsgi.py    
```

- manage.py——Django项目里面的工具，通过它可以调用django shell和数据库等
- setting.py——包含项目的默认设置，包括数据库信息，调试标志以及其它的工作变量
- urls.py——负责把URL模式映射到应用程序

3.启动django项目

> python manage.py runserver 8080

创建好了一个django项目，就可以将Web应用程序放到项目中来

### 创建Django应用

1.创建Web应用blog

> python manage.py startapp blog

2.项目结构

```python

```













