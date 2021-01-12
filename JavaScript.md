# jQuery

> jQuery库，里面存在大量的JavaScript函数

jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and extensibility, jQuery has changed the way that millions of people write JavaScript.

[jQuery文档](http://jquery.cuishifeng.cn/)

write less，do more.

> $(selector).action()

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--CDN引入jQuery-->
    <script src="https://cdn.bootcss.com/jquery/3.5.2/core.js"></script>
</head>
<body>
<!--
	选择器加事件
	公式：	$(selector).action()
	$指代jquery
-->
    <a href="" id="test-jquery">点我</a>
    <script type="text/javascript">
    	//选择器就是css的选择器
        $('#test-jquery').click(function() {
            alert('hello, jQuery!');
        });
    </script>
</body>
</html>
```

**选择器**

```javascript
//css原生选择器
//标签
document.getElementsByTagName();
//id
document.getElementById();
//class
document.getElementsByClassName();


//jQuery	css中的选择器jQuery均支持
$('p').click();
$('#id').click();
$('.class').click();
```

**事件**

- 鼠标事件
- 键盘事件
- 其他事件

```javascript
//当网页元素加载完毕之后，响应事件
$(document).ready(function(){
    
});
//简化版
$(function(){
    
});
```

**操作DOM**

```javascript
<ul id="test-ul">
    <li class="js">Java</li>
	<li name="python">Python</li>
</ul>

//原生操作DOM节点
document.getElementById('test-ul');

//jQuery
$('#test-ul').action()

$('#test-ul li[name=python]').text() //Python
$('#test-ul li[name=python]').text("设置新值")

<input type="text" id="txtName">
$('#txtName').val(); //获取输入的值
```

**操作CSS**

```javascript
//参数name
$('#test-ul li[name=python]').css("color"); //取得color样式属性的值
//参数properties
$('#test-ul li[name=python]').css({"color":"red","background":"blue"});	//设置
//参数name,value
$('#test-ul li[name=python]').css("color","red"); //设置
```

**元素的显示与隐藏**

```javascript
$('#test-ul li[name=python]').show();
$('#test-ul li[name=python]').hide();
```

# Ajax

> Asynchronous JavaScript and XML（异步的JavaScript和XML），AJAX是一种在无需重新加载整个网页的情况下，能够更新部分网页的**前端**技术。

Ajax不是一种新的编程语言，而是一种用于创建更好更快以及交互性更强的Web应用程序的技术。

传统的网页想要更新内容或者提交一个表单，都需要重新加载整个网页。使用Ajax技术的网页，通过与后台服务器进行少量的数据交换，就可以实现异步局部更新。

使用Ajax，用户可以创建接近本地桌面应用的直接、高可用、更丰富、更动态的Web用户界面。



Ajax的核心（本质）是XMLHttpRequest对象（XHR）。XHR对象为向服务器发送请求和解析服务器响应提供了接口，能够以异步方式从服务器获取新数据。

jQuery提供多个与Ajax有关的方法，能够使用HTTP Get和POST从远程服务器上请求文本、HTML、XML或JSON--同时能够把这些外部数据直接载入网页的被选元素中。

jQuery Ajax本质就是XMLHttpRequest，对他进行了封装，方便调用！

```javascript
jQuery.get()
jQuery.post()
jQuery.getJSON()
jQuery.getScript()
	url:待载入页面的URL地址
    data:待发送Key/Value参数
	success:载入成功时回调函数
    dataType:返回内容格式，xml,json,script,text,html
```

```javascript
// 通用方法
jQuery.ajax()
	url:请求地址
	type:请求方式:GET,POST(1.9.0之后用method)
	headers:请求头
	data:要发送的数据
	contentType:发送信息的内容编码类型（默认："application/x-www-form-urlencoded;charset=UTF-8")
	async:是否异步
	timeout:设置请求超时时间(ms)
	beforeSend:发送请求之前执行的函数(全局)
	complete:完成之后执行的回调函数(全局)
```













