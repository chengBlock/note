# -*- coding: utf-8 -*-
from pymysql import *

# 建立数据库连接
conn = connect(host="www.clcheng.top",port=3306,user="root",passwd="cheng123456",database="jd",charset="utf8")
print("%s:%d" % (conn.host,conn.port))
# 创建Cursor对象
cursor = conn.cursor()

# 查询语句
sql = "select * from goods"

# 执行sql语句,返回受影响行数
count = cursor.execute(sql)

print("共查询到%d条数据!" % count)

for i in range(count):
    content = cursor.fetchone()
    print(content)

# 关闭连接
cursor.close()
conn.close()
