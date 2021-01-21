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

- 字符串

   - u：后面字符串以Unicode编码格式进行编码，一般用在中文字符串前面

   - r：生成一个普通字符串，不再进行转义

   - b：表示这是一个bytes对象，后面字符串是bytes类型

      **网络编程中，服务器和浏览器只认bytes类型数据**

      - str.encode('utf-8') ：将str字符串生成utf8格式的字节数组
      - bytes.decode('utf-8')：将字节数组通过utf8编码格式解码成字符串

      



# 爬虫库

- bs4	#网页解析，获取数据
- re       #正则表达式，文字匹配
- urllib    #制定url，获取网页数据
- xlwt      #进行excel操作
- sqlite3  #进行SQLite数据库操作



# 构建流程

```python
# douban.com

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
  
# 创建正则表达式对象，表示字符串模式
#(.*?)中间会有任意个字符
#(.*)至少有1个任意字符
findLink = re.compile(r'<a href ="(.*?)">)
    
# 爬虫网页：豆瓣排名前250影片
def getData(baseurl):
    datalist = []
    for i in range(0,10):
        url = baseurl + str(i*25)
        # 保存获取到的html源码
        html = askURL(url)   
        
        # 解析网页
        soup = BeautifulSoup(html,"html.parser")
        # 查找符合要求的字符串，形成列表
        for item in soup.find_all('div',class_="item"):
            item = str(item)
            
            link = re.findall(findLink,item)[0] # 去第一个元素，防止找到多个符合项
            print(link)
        	datalist.append(link)               
    return datalist 
    	  
    
    
# 保存数据
def saveData(savePath):
    
    
# 得到一个指定URL的网页内容:GET
def askURL(url):
    headers = {
    "User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) 	AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36"
	}
    request = urllib.request.Request(url,headers=headers)
    html = ""
    try:
        response = urllib.request.urlopen(request)
        html = response.read().decode('utf-8')
        print(html)
    except urllib.error.URLError as e:
        if hasattr(e,"code"):
            print(e.code)
        if hasattr(e,"reason"):
            print(e.reason)
            
    return html
    
    
# 执行入口
if __name__ == "__main__";
	# 执行函数
    main()
```

```python
# urllib
import urllib.request

#将获取到的html网页内容封装成一个 http.client.HTTPResponse 对象
#GET请求格式
response = urllib.request.urlopen("http://www.baidu.com")

#以utf8编码格式输出网页内容
print(response.read().decode('utf-8'))
```

> 一个HTTP数据交互网站 httpbin.org

```python
url = "https://www.douban.com"

req = urllib.request.Request(url=url,data=data,headers=headers,method="POST")

```



# urllib

在python3中urllib集成了原本的urllib和urllib2的功能，不再使用urllib2

- urlopen：返回一个类文件对象
  - url：统一资源定位符
  - data：表示向网页传输的内容，即POST请求
  - timeout：超时时间，默认为180s
  - response.read()：读取文件内容，返回字符串

```python
url = "http://httpbin.org/post"

# 请求头
headers = {
    "User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36"
}
# 请求体,网络编程中，服务器浏览器只认字节类型数据
data = bytes(urllib.parse.urlencode({'name':'alice'}),encoding='POST')

# 构造request对象
req = urllib.request.Request(url=url,data=data,headers=headers,method='POST')

# 获取response对象
response = urllib.request.urlopen(req)

# read()返回字符串，decode将bytes数组解码为utf8字符串
print(response.read().decode('utf-8'))
```

# BeautifulSoup4(bs4)

> 将复杂的HTML文档转换成一个复杂的树形结构，每个节点都是Python对象

所有对象可归纳为4种：

- Tag
- NavigableString
- BeautifulSoup
- comment

解析HTML文档

```python
#以HTML格式解析html源代码，生成一个树型结构的对象
bs = BeautifulSoup(html,"html.parser")

# 1.Tag:标签及其内容，<class 'bs4.element.Tag'>
# *只返回第一个HTML源码中的第一个标签内容 
print(bs.title)
print(bs.a)
print(bs.head)

# 2.NavigableString:标签中的内容,<class 'bs4.element.NavigableString'>
print(bs.title.string)

# 以字典形式拿到标签里面的值
print(ba.a.attrs)


# 3.bs：<class 'bs4.BeautifulSoup'>
# BeautifulSoup 整个文档
print(bs.name) #[document]
print(bs)


# 4.Comment 是一个特殊的NavigableString，输出的内容不包含注释符号
```

# 文档的遍历

```python
# contents:获取Tag的所有子节点，返回一个list
print(bs.head.contents)
print(bs.head.contents[1])
```

- contents：获取Tag的所有子节点，返回以节点为元素的list
- children：获取Tag的所有子节点，返回一个生成器
- descendants：获取Tag的所有子孙节点
- parent：获取Tag的父节点
- strings：如果Tag包含多个字符串，即在子孙节点中有内容，可用此获取，而后进行遍历

# 文档的搜索

```python
# 1.find_all()
# 字符串过滤：查找完全匹配的标签，返回以节点为元素list
t_list = bs.find_all("a")

# 2.正则
# 通过正则编译，返回只要是节点内包含“a”子串的节点为元素的list
t_list = bs.find_all(re.compile("a"))

# 3.方法：传入一个函数（方法），根据函数要求来搜索
def name_is_exists(tag):
    return tag.has_attr("name")

# 查找带有“name”属性的Tag的list
t_list = bs.find_all(name_is_exists)

# 4.kwargs：关键字参数
#返回Tag中带有id=“head”属性的list
t_list = bs.find_all(id="head")
#返回带有class属性的Tag的list
t_list = bs.find_all(class_=True)

# 5.text参数，查找标签里的字符串
t_list = bs.find_all(text="123")
# 符合text列表中的任一个字符串即可
t_list = bs.find_all(text=["hao123","地图"])
# 正则,"\d"查找带有标签内容中含有数字的字符串
t_list = bs.find_all(text=re.compile("\d"))

# 6.limit：限制查找前3个a标签的节点
t_list = bs.find_all("a",limit=3)

# *选择器 select()
# 类似与jQuery中css选择器，定位到具体元素
# id、class、tag
# Tag
t_list = bs.select('title')
# class
t_list = bs.select('.mnav')
# id
t_list = bs.select('#u1')

# 通过子标签来查找
# head标签下的title标签
t_list = bs.select("head > title")

# 通过兄弟标签查找
# mnav同级别的标签称为manv的兄弟标签
t_list = bs.select(".mnav ~ .bri")
print(t_list[0].get_text())

#a标签的class等于‘bri’的节点列表
#a[]:a代表标签，[]中指定属性
t_list = bs.select("a[class='bri']")
```

# 正则表达式

## 一、校验数字的表达式

 

1. 数字：^[0-9]*$

2. n位的数字：^\d{n}$

3. 至少n位的数字：^\d{n,}$

4. m-n位的数字：^\d{m,n}$

5. 零和非零开头的数字：^(0|[1-9][0-9]*)$

6. 非零开头的最多带两位小数的数字：^([1-9][0-9]*)+(.[0-9]{1,2})?$

7. 带1-2位小数的正数或负数：^(\-)?\d+(\.\d{1,2})?$

8. 正数、负数、和小数：^(\-|\+)?\d+(\.\d+)?$

9. 有两位小数的正实数：^[0-9]+(.[0-9]{2})?$

10. 有1~3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$

11. 非零的正整数：^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$

12. 非零的负整数：^\-[1-9][]0-9"*$ 或 ^-[1-9]\d*$

13. 非负整数：^\d+$ 或 ^[1-9]\d*|0$

14. 非正整数：^-[1-9]\d*|0$ 或 ^((-\d+)|(0+))$

15. 非负浮点数：^\d+(\.\d+)?$ 或 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$

16. 非正浮点数：^((-\d+(\.\d+)?)|(0+(\.0+)?))$ 或 ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$

17. 正浮点数：^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ 或 ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$

18. 负浮点数：^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$ 或 ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$

19. 浮点数：^(-?\d+)(\.\d+)?$ 或 ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$

 

 

## 二、校验字符的表达式

 

1. 汉字：^[\u4e00-\u9fa5]{0,}$

2. 英文和数字：^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$

3. 长度为3-20的所有字符：^.{3,20}$

4. 由26个英文字母组成的字符串：^[A-Za-z]+$

5. 由26个大写英文字母组成的字符串：^[A-Z]+$

6. 由26个小写英文字母组成的字符串：^[a-z]+$

7. 由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$

8. 由数字、26个英文字母或者下划线组成的字符串：^\w+$ 或 ^\w{3,20}$

9. 中文、英文、数字包括下划线：^[\u4E00-\u9FA5A-Za-z0-9_]+$

10. 中文、英文、数字但不包括下划线等符号：^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$
11. 可以输入含有^%&',;=?$\"等字符：[^%&',;=?$\x22]+ 12 禁止输入含有~的字符：[^~\x22]+

 

 

## 三、特殊需求表达式

 

1. Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$

2. 域名：[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?

3. InternetURL：[a-zA-z]+://[^\s]* 或 ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$

4. 手机号码：^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$

5. 电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)：^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$

6. 国内电话号码(0511-4405222、021-87888822)：\d{3}-\d{8}|\d{4}-\d{7}

7. 身份证号(15位、18位数字)：^\d{15}|\d{18}$ 

8. 短身份证号码(数字、字母x结尾)：^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18}?$ 

9. 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$ 

10. 密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$

11. 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$

 

12. 日期格式：^\d{4}-\d{1,2}-\d{1,2}

13. 一年的12个月(01～09和1～12)：^(0?[1-9]|1[0-2])$

14. 一个月的31天(01～09和1～31)：^((0?[1-9])|((1|2)[0-9])|30|31)$

15. 钱的输入格式：
    1. 有四种钱的表示形式我们可以接受:"10000.00" 和 "10,000.00", 和没有 "分" 的 "10000" 和 "10,000"：^[1-9][0-9]*$*
    2. 这表示任意一个不以0开头的数字,但是,这也意味着一个字符"0"不通过,所以我们采用下面的形式：^(0|[1-9][0-9]*)$*
    3. *一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号：^(0|-?[1-9][0-9]*)$
    4. 这表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了.把负号的也去掉,因为钱总不能是负的吧.下面我们要加的是说明可能的小数部分：^[0-9]+(.[0-9]+)?$
    5. 必须说明的是,小数点后面至少应该有1位数,所以"10."是不通过的,但是 "10" 和 "10.2" 是通过的：^[0-9]+(.[0-9]{2})?$
    6. 这样我们规定小数点后面必须有两位,如果你认为太苛刻了,可以这样：^[0-9]+(.[0-9]{1,2})?$
    7. 这样就允许用户只写一位小数.下面我们该考虑数字中的逗号了,我们可以这样：^[0-9]{1,3}(,[0-9]{3})*(.[0-9]{1,2})?$*
    8. *1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不是必须：^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$

 备注：这就是最终结果了,别忘了"+"可以用"*"替代如果你觉得空字符串也可以接受的话(奇怪,为什么?)最后,别忘了在用函数时去掉去掉那个反斜杠,一般的错误都在这里

- xml文件：^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$

- 中文字符的正则表达式：[\u4e00-\u9fa5]

- 双字节字符：[^\x00-\xff] (包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))

- 空白行的正则表达式：\n\s*\r (可以用来删除空白行)

- HTML标记的正则表达式：<(\S*?)[^>]*>.*?</\1>|<.*? /> (网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)

- 首尾空白字符的正则表达式：^\s*|\s*$或(^\s*)|(\s*$) (可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)

- 腾讯QQ号：[1-9][0-9]{4,} (腾讯QQ号从10000开始)
- 中国邮政编码：[1-9]\d{5}(?!\d) (中国邮政编码为6位数字)
- IP地址：\d+\.\d+\.\d+\.\d+ (提取IP地址时有用)

- IP地址：((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))

## 常用符号意思

| 操作符 |                     说明                     |                   实例                   |
| :----: | :------------------------------------------: | :--------------------------------------: |
|   .    |               表示任何单个字符               |                                          |
|  [ ]   |         字符集，给出单个字符取值范围         | [abc]表示a、b、c，[a-z]表示a到z单个字符  |
|  [^ ]  |        非字符集，排除单个字符取值范围        |      [^abc]表示非a或b或c的单个字符       |
|   *    |          前一个字符0次或无限次扩展           |        abc*表示ab、abc、abcc等等         |
|   +    |          前一个字符1次或无限次扩展           |          abc+表示abc、abcc等等           |
|   ?    |          前一个字符的0次或一次扩展           |             ab？表示ab、abc              |
|   \|   |              左右表达式任意一个              |           abc\|def表示abc或def           |
|  {m}   |              扩展前一个字符m次               |              ab{2}c表示abbc              |
| {m,n}  |             扩展前一个字符m至n次             |          ab{1,2}c表示abc、abbc           |
|   ^    |                匹配字符串开头                |      ^abc表示abc且在一个字符串开头       |
|   $    |                匹配字符串结尾                |      abc$表示abc且在一个字符串结尾       |
| （ ）  |    分组标记（整体），内部只能使用\|操作符    | （abc）表示abc，（abc\|def）表示abc、def |
|   \d   |              数组，等价于[0-9]               |                                          |
|   \w   |         单词字符，等价于[A-Za-z0-9_]         |                                          |
|   \s   | 空白，包括空格、换行zhi、tab缩进等所有的空白 |                                          |
|   \S   |                    非空白                    |                                          |

## Re库主要功能函数

|    函数    |                             说明                             |
| :--------: | :----------------------------------------------------------: |
|  search()  | 在一个字符串中搜索匹配正则表达式的第一个位置，返回match对象  |
|  *match()  |    从一个字符串的开始位置起匹配正则表达式，返回match对象     |
| *findall() |          搜索字符串，以列表类型返回全部能匹配的子串          |
|  split()   |   将一个字符串按照正则表达式匹配结果进行分割，返回列表类型   |
| finditer() |            搜索字符串，返回一个匹配结果的迭代类型            |
|   *sub()   | 在一个字符串中替换所有匹配正则表达式的子串，返回替换后的字符串 |

​	正则表达式可以包含一些可选标志修饰符来控制匹配的模式。修饰符被指定为一个可选的标志。多个标志可以通过按位OR（|）来指定。如re.I | re.M 被设置成I和M标志：

| 修饰符 |                             描述                             |
| :----: | :----------------------------------------------------------: |
|   I    |                     使匹配对大小写不敏感                     |
|   L    |               做本地化识别（locale-aware）匹配               |
|   M    |                      多行匹配，影响^和$                      |
|   S    |                使.匹配包括换行在内的所有字符                 |
|   U    |      根据Unicode字符集解析字符。这个标志影响\w,\W,\b,\B      |
|   X    | 该标志通过给予你更灵活的格式，以便你将正则表达式写的更易于理解 |

 ```python
# 正则表达式
import re

# 创建模式对象,用来验证其他字符串
pat = re.compile("AA")
# 使用正则表达式pat，匹配"CBA"字符串
m = pat.search("CBA") # None
m = pat.search("ABCAA") #match对象：<re.Match object;span=(3,5),match='AA')

# 无模式对象
# 前面的字符串是模板，后面的字符串是被校验的对象
m = re.search("asd","Aasd")  #<re.Match object;span=(1,4),match='asd'>


re.findall('a','ASDaDFGAa') #['a','a']
re.findall('[A-Z]','ASDaB') #['A','S','D','B']
# 返回直到满足不符合条件的字符串
re.findall('[A-Z]+','jajgJHG') #['JHG']

# 找到a用A替换，返回替换后的字符串
re.sub('a','A','aniJHAa') #AniJHAA
 ```

> 建议在正则表达式中，被比较的字符串前面加上r，不用担心转义字符的问题

```python
# 影片详情链接的规则
findLink = re.compile(r'<a href="(.*?)">')
# 影片图片,让换行符包含在字符中，因为*默认不包含换行
findImagSrc = re.compile(r'<img.*src="(.*>)"',re.S)
# 影片片名
findTitle = re.compile(r'<span class="title">(.*)</span>')
# 影片评分
findRating = re.compile(r'<span class="rating_nm" property="v:average">(.*)</span>')
# 评价人数
findJudge = re.compile(r'<span>(\d*)人评价</span>')
# 找到影片的相关内容
findBd = re.compile(r'<p class="">(.*)</p>',re.S)
```

# 保存数据

## Excel表存储

利用Python的xlwt库将抽取的数据datalist写入Excel表格

1. 以utf-8编码创建一个Excel对象
2. 创建一个Sheet表
3. 往单元格写入内容
4. 保存表格

```python
import xlwt

# 创建workbook对象(Excel文件)
workbook = xlwt.Workbook(encoding="utf-8")

# 创建工作表(Sheet对象)
worksheet = workbook.add_sheet('sheet1')

# 往单元格中写入内容
worksheet.write(0,0,"hello") # (行，列，内容)

# 保存数据表（从内存中保存到硬盘）
workbook.save('student.xls') #(filename_or_stream)
```

