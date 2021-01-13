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

  ### CentOS7 安装Python3
  
  > www.clcheng.top开放6000~10000端口、3306、443、80
  
  **软连接：**
  
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
  
  **环境变量：**
  
  > Linux export 命令用于设置或显示环境变量
  
  ```bash
  export 参数 变量名称=变量设置值
  
  export -p #列出当前的环境变量
  export MYENV //定义环境变量MYENV
  export MYENV="path" //定义环境变量
  ```
  
  - -f：代表“变量名称”中为函数名称
  - -n：删除指定的变量。变量实际上并未删除，只是不会输出到后续指令的执行环境中
  - -p：列出所有的shell赋予程序的环境变量
  
  

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

**布尔值在数据库中True用1代替，False用0代替**

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

[DjangoB站课程博客](https://www.cnblogs.com/clschao/articles/10409764.html)

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
    --settings.py #配置
    --urls.py	  #路由
    --wsgi.py    
```

- manage.py——Django项目里面的工具，通过它可以调用django shell和数据库等
- setting.py——包含项目的默认设置，包括数据库信息，调试标志以及其它的工作变量
- urls.py——负责把URL模式映射到应用程序（URL控制器）

3.启动django项目

> python manage.py runserver 8080

创建好了一个django项目，就可以将Web应用程序放到项目中来

### 创建Django应用

1.创建Web应用blog

> python manage.py startapp blog

2.项目结构

```python
mysites
--manage.py 
--mysites
--blog
	--models.py #跟数据库打交道
    --views.py	#跟用户打交道
    --......
```

可以看到上述项目缺少Template模块，所以正常项目结构应该为：

```python
mysites
--manage.py 
--mysites
--templates #模板
--blog
```

3.创建简单项目

**urls.py**

- r''：原始字符串
- u'\u5220'：unicode
- b'abc'：bytes

```python
from django.contrib import admin
from django.urls import path

from app01 import views

urlpatterns = [
    path('admin/', admin.site.urls),
    #url：timer/，调用views.py中的timer()
    path('timer/',views.timer),
]
```

**views.py**

```python
from django.shortcuts import render

# Create your views here.

# 注意：这里必须传入一个request参数，代表接收到的请求
def timer(request):

    import time

    # 获取当前时间
    cname = 'Alice'
    ctime = time.time()
    print(cname)

    #response = wrapped_callback(request, *callback_args, **callback_kwargs)
    #render是django中自带的库，用于处理返回Template
    return render(request,"timer.html",{"date":ctime,"cname":cname})
```

直接返回，不进行views.py处理

```python
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.

# 注意：这里必须传入一个request参数，代表接收到的请求
def timer(request):

    import time

    # 获取当前时间
    ctime = time.time()
    
    return HttpResponse(ctime)
```

**timer.html**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--{{ 变量名 }}，接收view传过来的数据-->
<h1>Hello, {{ cname }}</h1>
<h2>当前时间：{{ date }}</h2>

</body>
</html>
```

> render方法默认打开template文件夹下面的html文件，渲染完成之后，返回响应页面数据，最终交给wsgi.py中的socket将页面数据返回给客户端
>
> setting.py 中的 TEMPLATE中设置render的默认路径为template下

- BASE_DIR ： setting.py中定义的项目根目录 

- request：HttpRequest对象
- url(r'^admin/',admin.site.urls) : django提供的内置应用，正则表达式，以admin开头的url都跳转到admin
- request ：wsgi封装的一个对象

**表单提交**

```html
<!--提交到本网站的url中，缺省host:post,http://host:port/login/-->
<form action="/login/" method="post">
    
    <input type=submit>
</form>
```

post请求在django中有限制，可以通过注释掉setting.py->MIDDLEWAER.'django.middleware,csrf.CsrfViewMiddleware'解除限制

```python
request.POST : queryDict对象其实就是一个普通字典加工成的一个新的字典对象，操作和字典差不多
 # <QueryDict:{'username':['root'],'password':['123']}   
# 拿出来的不是列表，就是里面的值
uname = request.POST.get("username") #root
pwd = request.POST.get('password')	#123
```

用户直接在浏览器输入url访问的请求方式为GET请求，可以通过METHOD判断具体请求类型：

```python
def login(request):
    #浏览器输入url操作
    if request.method == 'GET':
        return render(request,'login.html')
    else:
        #逻辑判断，用户名和密码
        return render(request,'index.html')
        else：
        return HttpResponse('Error')
```



### Request对象

**请求常用值**

- path : 返回用户访问的url
- get_full_path() : 带有参数的url
- method：请求中使用的HTTP方法的字符串表示
- GET：包含HTTP GET参数的类字典对象
- POST：包含所有HTTP POST参数的类字典对象
- body：请求体，byte类型request.POST就是从body里面提取到的
- META：请求头
- REMOTE——ADDR：客服端ip
- *request.FILES : 接收上传的文件对象，文件对象在body中取不到
  - request.FILES.get('file') #获取具体的文件类对象（对象名）

### Response

```python
from django.shortcuts import render,HttpResponse,redirect

return HttpResponse('你好')

# 返回的是经过render()渲染后的HttpResponse对象
return render(request,"index.html",{"key":"value"})

return redirect('/login/') 
```

python字典加键值对：

```python
dict['a'] = 'b' #{'a':'b'}
```

```python
#ret仍然是一个HttpResponse对象
ret = render(request,'home.html',status=202)
ret['a'] = 'b'
ret.status_code = 201
response['Content-Type'] = 'text/html;charset=UTF-8'
```

- content：响应内容
- charset：响应内容编码
- status_code：响应状态码

### JsonResponse对象

> JsonResponse是HttpResponse的子类，专门用来生成JSON编码的响应。默认Content-Type类型被设置为：application/json

```python
from django.http import JsonResponse

response = JsonResponse({"foo":"bar"})
response
print(response.content)  #b'{"foo":"bar"}
```

```python
class JsonResponse(data,encoder=DjangoJSONEncoder,safe=True,json_dumps_params=None,**Kwargs)
```

- data : 应该是一个字典类型
- safe：False时，data可以为任何能够被转换为JSON格式的对象，默认为True，不是字典类型会抛出TypeError的异常

### 静态文件配置

> js、css、img等都叫做静态文件

django静态文件的配置，需要在settings配置文件中写上：

```python
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS=(
    os.path.join(os.path.dirname(__file__),"..",'static').replace('\\','/'),
    os.path.join('static'),
)
```

![image-20210113192116599](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210113192116599.png)

直接使用项目的相对路径会暴露服务器的文件结构，所以Django对此做了静态文件的保护：

```python
STATIC_URL = '/static/' #静态文件的别名，叫什么都行，代指静态文件夹

# 指定静态文件夹的真实路径
STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'statics') #statics为真实文件夹
]

"""后面的HTML中引入静态资源使用 /static/... 即可"""
```

**静态文件可以直接通过url访问**

![image-20210113195042342](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210113195042342.png)

### 手动配置App

pycharm配置App会自动在setting.py中添加 ‘app01.apps.App01Config'

```python
# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'app01.apps.App01Config',
]
```

```python
INSTALLED_APPS = [
    'app01.apps.App01config', #全称
    'app02',	#简写
]
```



### ORM

> Object Relational Mapping（对象关系映射），通过python代码实现对数据的操作

类对象->sql->pymysql->mysql服务器->磁盘，orm其实就是将类对象的语法翻译成sql语句的一个引擎。

**牺牲了部分性能**

https://cnblogs.com/clschao/articles/10427807.html![img](https://images2018.cnblogs.com/blog/877318/201804/877318-20180425153356710-1116321211.png)

  #### 生成表

> 在models.py中编写表类

```python
'''
create table book(
    id int primary key auto_increment not null,
    title varchar(64),
    state boolean not null ,
    pub_date date not null,
    price decimal(20,5) not null ,
    publish varchar(32) not null
)
'''
#继承Model类
class Book(models.Model):

    #orm生成的字段都默认为not null
    #models的子类AutoField在这里作为Book的一个字段
    # 自增、主键
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=64)
    state = models.BooleanField()
    pub_date = models.DateField()
    price = models.DecimalField(max_digits=20,decimal_places=5)
    publish = models.CharField(max_length=32)
```

> 执行命令

```bash
#将models.py中的语句记录到migrations下的py文件中
python manage.py makemigrations

#在db.sqlite3中执行orm语句
python manage.py migrate
```

```python
D:\WorkSpace\Python\Django\JQuery_Django>python manage.py makemigrations
Migrations for 'app01':
  app01\migrations\0001_initial.py
    - Create model Book

D:\WorkSpace\Python\Django\JQuery_Django>python manage.py migrate
Operations to perform:
  Apply all migrations: admin, app01, auth, contenttypes, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying app01.0001_initial... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying auth.0012_alter_user_first_name_max_length... OK
  Applying sessions.0001_initial... OK
```

> 生成数据表

![image-20210113214138072](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210113214138072.png)

#### 执行数据库同步指令的问题

- 因为django的orm语句都是默认not null 的字段值，当新增字段时要指定默认值，保证已存在的表项不会存在新增字段的空值的情况

### 指定Mysql数据库

> 默认情况

setting.py

```python
# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {
    'default': {
        #等价于：External Livraries-> site-packages->django->db->backends->sqlite3
        'ENGINE': 'django.db.backends.sqlite3', #使用sqlite3
        'NAME': BASE_DIR / 'db.sqlite3',	#在根目录下，生成名为db.sqlite3的数据库
    }
}
```

![image-20210113221338014](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210113221338014.png)



> 改为mysql

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', #使用db下的mysql
        'NAME': 'orm01', #库名
        'HOST':'www.clcheng.top',
        'PORT':3306,
        'USER':'root',
        'PASSWORD':'666',
    }
}
```

#### 配置连接mysql数据库

1. 去mysql里面创建一个库

   ```sql
   create database orm01 charset=utf8mb4; #涵盖生僻字
   ```

2. 将setting.py配置文件中的DATABASES

   ```python
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.mysql', #使用db下的mysql
           'NAME': 'orm01', #库名
           'HOST':'www.clcheng.top',
           'PORT':3306,
           'USER':'root',
           'PASSWORD':'cheng123456',
       }
   }
   # 一个数据库连接所需要的完整的信息
   # mysql -hwww.clcheng.top -P3306 -uroot -pcheng123456
   ```

   python连接mysql需要pymysql，django需要mysqlclient or MySQL-python(版本原因，必须使用pymysql0)

3. 指定django连接mysql的python模块（将pymysql设置为django连接Mysql的模块）

   ```python
   1.安装pymysql
   2.项目文件的__init__.py添加以下内容
   	import pymysql
       pymysql.install_as_MySQLdb()
   ```

4. 执行数据库migrate指令

   ```bash
   python manage.py migrations
   python manage.py migrate
   ```

   

5. 可以通过pycharm database图形界面连接到mysql

### migrate数据库同步指令执行过程

![image-20210113225213004](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210113225213004.png)

1. makemigration生成记录文件
2. migrate执行记录文件，翻译成sql，并到配置的数据库中生成表
3. migrate执行完之后，django会将执行过的migration文件记录到django_migrations表中做一个执行记录，记录哪些migrations文件已经被执行过了，被执行过了的就不再执行，以防出现migrations文件被重复执行的情况

### Field属性

```python
data_types = {
        'AutoField': 'integer AUTO_INCREMENT',
        'BigAutoField': 'bigint AUTO_INCREMENT',
        'BinaryField': 'longblob',
        'BooleanField': 'bool',
        'CharField': 'varchar(%(max_length)s)',
        'DateField': 'date',
        'DateTimeField': 'datetime(6)',
        'DecimalField': 'numeric(%(max_digits)s, %(decimal_places)s)',
        'DurationField': 'bigint',
        'FileField': 'varchar(%(max_length)s)',
        'FilePathField': 'varchar(%(max_length)s)',
        'FloatField': 'double precision',
        'IntegerField': 'integer',
        'BigIntegerField': 'bigint',
        'IPAddressField': 'char(15)',
        'GenericIPAddressField': 'char(39)',
        'JSONField': 'json',
        'NullBooleanField': 'bool',
        'OneToOneField': 'integer',
        'PositiveBigIntegerField': 'bigint UNSIGNED',
        'PositiveIntegerField': 'integer UNSIGNED',
        'PositiveSmallIntegerField': 'smallint UNSIGNED',
        'SlugField': 'varchar(%(max_length)s)',
        'SmallAutoField': 'smallint AUTO_INCREMENT',
        'SmallIntegerField': 'smallint',
        'TextField': 'longtext',
        'TimeField': 'time(6)',
        'UUIDField': 'char(32)',
    }
```

```python
1.default
 
字段的默认值。可以是一个值或者可调用对象。如果可调用 ，每有新对象被创建它都会被调用，如果你的字段没有设置可以为空，那么将来如果我们后添加一个字段，这个字段就要给一个default值
 
2.primary_key
 
如果为True，那么这个字段就是模型的主键。如果你没有指定任何一个字段的primary_key=True，
Django 就会自动添加一个IntegerField字段做为主键，所以除非你想覆盖默认的主键行为，
否则没必要设置任何一个字段的primary_key=True。
 
3.unique
 
如果该值设置为 True, 这个数据字段的值在整张表中必须是唯一的

4.null
如果该值设置为 True, 这个数据字段的值可以为空
```

```python
DatetimeField、DateField、TimeField这个三个时间字段，都可以设置如下属性。

1.auto_now_add
    配置auto_now_add=True，创建数据记录的时候会把当前时间添加到数据库。

2.auto_now
    配置上auto_now=True，每次更新数据记录的时候会更新该字段，标识这条记录最后一次的修改时间。
```

# ORM数据库的增删改查

## 增加

> 数据表就类似于一个类模板，每个表项就是一个根据类模板生成的实例

views.py

```python
from app01 import models
import datetime

#方式1
#生成数据表对象
book_obj = models.Book(
	title="西游记",
    state=True,
    pub_date = datetime.datetiem.now(),
    #pub_date = '2020-12-12'
    price = 11.11,
    publich='清华出版社'
)
#在数据库中保存对象
book_obj.save() #保存数据
return HttpResponse('ok')

#方式2
models.Book.objects.create(
	title="西游记",
    state=True,
    pub_date = datetime.datetiem.now(),
    #pub_date = '2020-12-12'
    price = 11.11,
    publich='清华出版社'
)
return HttpResponse('ok')
```

```python
#批量添加数据
obj_list = []
for i in range(1,10):
    obj = models.Book(
    	title="西游记",
    	state=True,
    	pub_date = datetime.datetiem.now(),
    	#pub_date = '2020-12-12'
    	price = 11.11,
    	publich='清华出版社'
    )
    obj_list.append(obj)
    
models.Book.objects.bulk_create(obj_list)
```

## 查询

views.py

**全部查询** all()

```python
def get_book(request):
    
    #所有表项
    obj_list = models.Book.objects.all()
    print(obj_list) #返回QuerySet对象，类似于列表，每一项都是一个表项
    print(obj_list[0]) #西游记（因为有__str__()）,Book对象
    return HttpResponse('ok')
```

可以在models.py中的类模板中添加

```python
#等价于java中的toString()，返回字符串类型
def __str__(self):
    return self.title
```

**过滤查询** filter()

```python
# 结果也是QuerySet对象，每一项都是表项
bj_list = models.Book.objects.filter(id=1)
# 等同于where
```

get() 结果为一个模型类对象

```python
obj = models.Book.objects.get(id=1) # Book对象
# 只能查一个，且必须存在，有且仅有一个
```

## 修改

![image-20210114001040126](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210114001040126.png)

![image-20210114001552977](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210114001552977.png)

![image-20210114001653837](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210114001653837.png)

**update()调用者可以是objects控制器，可以是queryset类型数据，但不能是模式类对象**，所以使用models.Book.objects.get(id=1).update() #Error

update，delete返回受影响的行数



## 删除

![image-20210114002328604](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210114002328604.png)



![image-20210114002531916](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210114002531916.png)

obj=models.Book.objects.all().delete() #全删