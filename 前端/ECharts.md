# 数据可视化

> 把数据从冰冷的数字转换成图形,清晰有效地传达沟通信息,揭示蕴含在数据中的规律和道理.

技术基础:

- div + css布局
- flex布局
- Less
- 原生js + jquery使用
- rem适配
- echarts基础

前端插件:

- live server
- easyless : 将less文件自动转为css文件
- cssrem：设置”Root Font Size“为80，即通过插件将rem设置为80，避免手动设置

案例适配方案：

- 设计稿是1920px：

  1.flexble.js把屏幕分为24等份，rem=80px

  2.cssrem插件的基准值为80x（与flexble相匹配），通过Root Font Size设置

px、em和rem：

- px像素（Pixel）。相对长度单位，相对于显示器分辨率而言的
- em相对长度单位，相对于当前对象内文本的字体尺寸
- rem是css3新增的一个相对单位（rem,root em),使用rem为元素设定字体大小时，仍然是相对大小，但相对的只是HTML根元素。这个单位可谓集相对大小和绝对大小的优点于一身，通过它既可以做到只修改根元素就成比例地调整所有字体大小，又可以避免字体大小逐层复合的连锁反应。

background-repeat:

> 设置是否及如何重复背景图像，默认地，背景图像在水平和垂直方向上重复

| 值        | 描述                                                |
| :-------- | :-------------------------------------------------- |
| repeat    | 默认。背景图像将在垂直方向和水平方向重复。          |
| repeat-x  | 背景图像将在水平方向重复。                          |
| repeat-y  | 背景图像将在垂直方向重复。                          |
| no-repeat | 背景图像将仅显示一次。                              |
| inherit   | 规定应该从父元素继承 background-repeat 属性的设置。 |

# Echarts介绍

> 百度出品的一个开源JavaScript数据可视化库，可以流畅的运行在PC和移动设备上，兼容当前绝大部分浏览器，底层使用矢量图形库<u>ZRender</u>,提供直观、交互丰富，可高度个性化定制的数据可视化图表。

- 是一个开源的JS插件
- 性能好、可流畅运行PC与移动设备上

## ECharts使用五部曲

1. 下载并引入echarts.js——图表依赖这个js库
2. 准备一个具备大小的DOM容器——用于存放生成的图表
3. 初始化echarts实例对象——生成一个echarts对象
4. 指定配置项和数据（option）——根据具体需求设置配置项
5. 将配置项设置给echarts实例对象——echarts根据配置项生效

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>五步生成ECharts图形实例</title>

    <!-- 1.导入echarts.js -->
    <script src="../js/echarts.min.js"></script>
</head>
<body>
    <!-- 2.创建存放图表的DOM容器 -->
    <!-- echarts.init()通过组件的id属性绑定DOM容器 -->
    <div id="main" style="width: 600px;height: 400px;"></div>
    <div style="width: 600px"></div>


    <script type="text/javascript">
        // 3.基于DOM容器，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 4.配置Option
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip:{
            },
            legend: {
                data: ['销量']
            },
            xAxis:{
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis:{},
            series:[
                {
                    name:'销量',
                    type:'bar',
                    data:[5,20,36,10,10,20]
                }
            ]
        };

        // 5.使用option实例化echarts对象
        myChart.setOption(option);
    </script>
</body>
</html>
```

### echarts实例

- 一个网页中可以创建多个echarts实例
- 每个echarts实例通过option可以创建多个图表和坐标系等等
- 每个echarts实例独占一个DOM节点![img](https://echarts.apache.org/zh/documents/asset/img/basic-concepts-overview/multiple-ec-instance.jpg)



![img](https://echarts.apache.org/zh/documents/asset/img/basic-concepts-overview/series-all-a.jpg)



### 系列Series

> 一组数值以及他们映射成的图。“系列”这个词原本可能来源于“一系列的数据”，而在 echarts 中取其扩展的概念，不仅表示数据，也表示数据映射成为的图。

- 一组数值
- 图表类型(series.type)
  - line : 折线图
  - bar : 柱状图
  - pie : 饼图
  - scatter : 散点图
- 设定数据映射成图的参数

### 组件Component

> 在系列之上,echarts中的各项内容被抽象成组件

- xAxis :  直角坐标系下的x轴
- yAxis : 直角坐标系下的y轴
- grid : 直角坐标系底板



- angleAxis : 极坐标系角度轴
- radiusAxis : 极坐标系半径轴
- polar : 极坐标系底板



- tooltip : 提示框组件
- toolbox : 工具框组件
- dataZoom : 数据区缩放组件
- visualMap : 视觉映射组件
- dataset : 数据集,用于单独的数据集声明



- series : 专门绘制"图"的组件

  > series也是一种组件

  - type
  - data

![img](https://echarts.apache.org/zh/documents/asset/img/basic-concepts-overview/components.jpg)

### Option

> 描述对图表的各种需求 : 数据,数据如果映射为图形,交互行为

- 有什么数据
- 要画什么图表
- 图表长什么样子
- 含有什么组件
- 组件能怎么操作
- ......



- dataset

  > 数据存放在dataset中可以单独管理，被多个组件复用，并且可以自由指定数据到视觉的映射。

  

  series.data是本系列的数据,而另一种描述方式,系列数据从dataset中取 :

```javascript
var option = {
    //option的每一个属性都是一个组件
    
    //如果有多个同类组件,那么就是个数组,用type描述子类型
    series: [
        // 每个系列，也有 type 描述“子类型”，即“图表类型”。
        {type: 'line',data:[['AA',332],['CC',124],['FF',412],...]},
        {type: 'line',data:[21,31,22,...]},
        {type: 'line',data:[[4,51],[8,12],...]}
    ]
};
```

```javascript
var option = {
    //数据单独管理,可被多个组件复用
    dataset: {
        source: [
            [121, 'XX', 442, 43.11],
            [663, 'ZZ', 311, 91.14],
            [913, 'ZZ', 312, 92.12],
            ...
        ]
    },
    xAxis: {},
    yAxis: {},
    series: [
        //可以自由指定数据到视觉的映射
        // 数据从 dataset 中取，encode 中的数值是 dataset.source 的维度 index （即第几列）
        {type: 'bar',encode:{x: 1,y: 0}},
        {type: 'bar',encode:{x: 1,y: 2}},
        {type: 'scatter',encode:{x: 1,y: 3}}
    ]
};
```

### 组件的定位

#### 类CSS的绝对定位

> 绝对定位基于的是echarts容器DOM节点

- 绝对数值——bottom：54，距离echartDOM容器底边界54像素
- 相对数值——right：‘20%’，距离 echarts 容器右边界的距离是 echarts 容器宽度的 `20%`

- 横向:
  - left/right/width
- 纵向:
  - top/bottom/height

**每组中,至多设置两项就可以确定位置**

![img](https://echarts.apache.org/zh/documents/asset/img/basic-concepts-overview/locate.jpg)

#### 中心半径定位

> 中心半径定位，往往依据 [center](https://echarts.apache.org/zh/option.html#series-pie.center)（中心）、[radius](https://echarts.apache.org/zh/option.html#series-pie.radius)（半径）来决定位置。

## 坐标系

> 一个坐标系，可能由多个组件协作而成。

**直角坐标系：**

> `xAxis`、`yAxis` 被 `grid` 自动引用并组织起来，共同工作。

- xAxis：直角坐标系x轴
- yAxis：直角坐标系y轴
- grid：直角坐标系底板



最简单的使用直角坐标系的方式：只声明了`xAxis`、`yAxis` 和一个 `scatter`（散点图系列），echarts 暗自为他们创建了 `grid` 并关联起他们：

![img](https://echarts.apache.org/zh/documents/asset/img/basic-concepts-overview/coord-sys-0.jpg)

两个 `yAxis`，共享了一个 `xAxis`。两个 `series`，也共享了这个 `xAxis`，但是分别使用不同的 `yAxis`，使用 [yAxisIndex](https://echarts.apache.org/zh/option.html#series-line.yAxisIndex) 来指定它自己使用的是哪个 `yAxis`：

**![image-20210111214251910](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210111214251910.png)**

一个 echarts 实例中，有多个 `grid`，每个 `grid` 分别有 `xAxis`、`yAxis`，他们使用 `xAxisIndex`、`yAxisIndex`、`gridIndex` 来指定引用关系：

- xAxisIndex
- yAxisIndex
- gridIndex

![image-20210111214449364](C:\Users\cheng\AppData\Roaming\Typora\typora-user-images\image-20210111214449364.png)





















