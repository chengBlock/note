-- 数据库的操作

--列出数据库
show datebases;

--显示时间
select now(); --数据库支持函数

--显示数据库版本
select version();

--创建数据库
--create database 数据库名 charset=utf8
--默认编码为latin1,所以一般要指定字符集为utf8
--注意是utf8,而不是utf-8
create database python4 charset=utf8;

--查看创建的数据库类型
show create database python4;

--删除数据库
--drop database 数据库名;
drop database python4;

--`str`
`str`代表str是一个整体

--切换/使用数据库
use python4

--查看当前使用的数据库
select database();



-------------------------操作表--------------------------

--查看数据库的所有表
show tables;

--创建数据表
    --auto_increment表示自动增长
    --not null表示不能为空
    --primary key表示主键
    --default默认值
    --create table 表名 (字段 类型 约束[,字段 类型 约束]);
create table student(id int,name varchar(8),age int);

create table people(id int primary key not null auto_increment,name varchar(30));

create table teacher(id int primary key not null,name varchar(10) not null);

create table school(
    id int unsigned primary key not null auto_increment,
    name varchar(30) not null,
    address varchar(30),
    type varchar(10)
);

create table students(
    id int unsigned not null auto_increment primary key,
    name varchar(30),
    age tinyint unsigned default 0,
    high decimal(5,2),
    gender enum("男","女","其它","保密") default "保密",
    cls_id int unsigned
);



--查看表信息
desc 表名;

--插入表项
insert into students values(1,"Alice",19,171.1,"女",5);

--查询数据
select * from students;


-------------------------**crud**--------------------
--修改表-添加字段
alter table 表名 add 字段 类型 约束;

--修改表-修改字段
alter table 表名 modify 字段 类型 约束;

--修改表-修改字段:重命名
alter table 表名 change 原字段 新字段 类型 约束;

--修改表-删除字段
alter table 表名 drop 字段;


--删除表
drop table 表名;









