# 英文意思

- alter : 改变、修改
- modify : 修饰,调整

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

