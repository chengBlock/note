# HTML详解

HTML5 + CSS3：HTML5——2013.5.6

所有的浏览器厂商都支持HTML5，形成标准化，由W3C负责标准化管理

W3C标准包括：

- 结构化标准语言（HTML、XML）
- 表现标准语言（CSS）
- 行为标准（DOM、ECMAScript）

## HTML基本结构

```html
<html>
    <!--网页头部-->
    <head>
        <title></title>
    </head>
    <!--主体部分-->
    <body>
        
    </body>
</html>
```

- 成对出现的标签称为开发标签和闭合标签
- 单独呈现的标签为自闭合标签

## 网页结构

```html
<!--DOCTYPE：告诉浏览器我们使用的规范，默认就是HTML5（可省略）-->
<!DOCTYPE html>
<html lang="en">
<head>
    <!--meta描述性标签，用来描述网站-->
    <meta charset="UTF-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>好好学习</title>
</head>
<!--ctrl+/: IDEA中的快捷键-->
<body>
    <h1>Hello</h1>
</body>
</html>
```

## 网页基本标签

```html
<!--标题标签-->
<h1>
    
</h1>
<h2>
    
</h2>

<!--段落标签-->
<!--tab：idea快捷键自动生成标签-->
<p>
    
</p>

<!--换行标签-->
<!--自闭合标签默认是<br>形式，为了便于区分最后写出闭合形式-->
<br/>

<!--水平线标签-->
<hr/>

<!--字体样式标签-->
<strong>粗体</strong>
<em>斜体</em>

<!--特殊符号-->
HTML中所有空白符不管数量多少都只显示为一个空格
HTML使用&xxx；代表特殊符号
空格：&nbsp;
大于：&gt;
小于：&lt;
版权符：&copy;
```

## 图像格式

```html
<img src="path" alt="text" title="text" width="x" height="y"/>
```

- src：图片的保存路径
- alt：图片加载失败的时候text文字代替
- title：鼠标悬停提示文字

## 链接标签

```html
<a href="url" target="目标窗口位置">链接文本或图像</a>
<a href="url">
	<img src="path"/>
</a>
```

```html
<!--锚链接
1.需要一个锚标记；
2.跳到标签
url中的#xxx就代表锚链接
-->
<!--锚标记-->
<a name="top">顶部</a>
<!--跳转链接
跳转到top锚链接所在位置
支持跨页面跳转
-->
<a href="#top">回到顶部</a>
<a href="1.html#top">跳转到页面1的顶部</a>
```

```html
<!--功能性标签
1.邮件链接：mailto
2.QQ链接——https://shang.qq.com/v3/widget.html
-->

<a href="mailto:499886834@qq.com">点击联系我</a>
<!--qq推广自动生成-->
<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
```

- href：链接路径
- target：链接在哪个窗口打开，默认调用_self当前页面打开
  - _self
  - _blank

## 块标签和行内标签

- 块标签：
  - 无论内容多少，该内容独占一行
  - p、h1
- 行内标签
  - 内容撑开宽度，左右都是行内元素可以在一行内显示
  - a、strong、em

