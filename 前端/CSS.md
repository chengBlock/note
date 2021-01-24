# 什么是CSS

菜鸟教程:https://www.runoob.com/css/css-tutorial.html

Cascading Style Sheet 层叠级联样式表

CSS:表现(美化网页)

![image-20210108083700176](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210108083700176.png)

## 发展史

1. CSS1.0
2. CSS2.0 : DIV(块) + CSS, HTML与CSS结构分离的思想, 网页变得简单, SEQ
3. CSS2.1 : 浮动, 定位
4. CSS3.0 : 圆角, 阴影, 动画... 浏览器兼容性...

## 快速入门

> HTML使用css遵循就近原则

```html
<!--编写css的代码,规范:每一个声明最后使用分号结尾
语法:
	选择器 {
		声明1;
		声明2;
		声明3;
	}
-->
<style>
	
</style>
```

```html
<!--行内样式:在标签元素中,编写一个style属性,编写样式即可-->
<h1 style="color: red">
    
</h1> 
```

```html
<head>
    <!--内部样式-->
    <style>
        /*渲染所有h1标签*/
        h1{
            color:green;
        }
    </style>    
</head>
```

```html
<!--外部样式-->
<link rel="stylesheet" href="./style.css">
```

# 选择器

## 基本选择器

1. 标签选择器 : 全局同标签
2. 类选择器 : 同类一组
3. id选择器 : 全局唯一

> 选择优先级 : id > class > 标签

```html
<head>
    <style>
    	/*
        1. #id
        2. .类名
        3. 标签
        */
        h1{
            color:black
        }
        .Class{
            color:blue
        }
        #ID{
            color:red
        }
    </style>
</head>

<body>
    <h1 id="ID" class="Class">
        红色
    </h1>
    <h1 class="Class">
        蓝色
    </h1>
    <h1>
        黑色
    </h1>
    <h1 class="Class">
        蓝色
    </h1>
    <p class="Class">
        蓝色
    </p>
</body>
```



## 层次选择器

1. 后代选择器

   ```html
   body p{
   	background:red;
   }
   ```

2. 子选择器

   ```html
   body>p{
   	background:red;
   }
   ```

3. 相邻兄弟选择器(不包含自己,向下选择)

   ```html
   .active + p{
   	background:red;
   }
   ```

4. 通用选择器(包括自己,后面的所有兄弟)

   ```html
   .active~p{
   	background:red;
   }
   ```

## 伪类选择器

























