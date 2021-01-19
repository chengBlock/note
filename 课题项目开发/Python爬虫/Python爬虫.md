# 爬虫初识

- 什么是爬虫

  网络爬虫,是一种按照一定规则,自动抓取互联网信息的程序或者脚本。由于互联网数据的多样性和资源的有限性，根据用户需求定向抓取相关网页并分析已成为如今主流的爬取策略。
  
- 爬虫的本质

  模拟浏览器打开网页，获取网页中我们想要的那部分数据。

# 基本流程

1. 准备工作

   通过浏览器查看分析目标网页，学习编程基础规范。

2. 获取数据

   通过HTTP库向目标站点发起请求，请求可以包含额外的header等信息，如果服务器能够正常响应，会得到一个Response，便是所要获取的页面内容。

3. 解析内容

   得到的内容可能是HTML、json等格式，可以用页面解析库、正则表达式等进行解析。

4. 保持数据

   保存形式多样，可以存为文本，也可以保存到数据库，或者保持特定格式的文件。

# 编码规范

- 一般Python程序第一行需要加入

   `# -*-coding:utf-8 -*-` 或者 `# coding=utf-8`

  这样可以在代码中包含中文

- Python中可复用的代码段写成函数，提高代码复用率

- Python文件中可以加入main函数当做程序执行入口，用于测试程序：

  > `if __name__ ==  "__main__" :`

- 三引号可以用于打印多行内容，每行结尾需要显示的输入\n才能换行；

- 字符串前加一个r表示不转义



# 爬虫库

- bs4	#网页解析，获取数据
- re       #正则表达式，文字匹配
- urllib    #制定url，获取网页数据
- xlwt      #进行excel操作
- sqlite3  #进行SQLite数据库操作



# 构建流程

```python
from bs4 import BeautifulSoup #网页解析
import re	#正则
impore urllib.request,urllib.error #url
import xlwt	#excel操作
import sqlite3 #SQLite数据库

# 执行函数
def main():
    #1.爬取网页
    #2.解析数据
    #3.保存数据
    
# 爬虫网页
def getData(baseurl):
    
# 保存数据
def saveData(savePath):
    
# 执行入口
if __name__ == "__main__";
	# 执行函数
    main()
```





