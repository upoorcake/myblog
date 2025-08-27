---
title: PaddleOCR 数据标注
date: 2025-08-27 16:14:03
tags:
  - PaddleOCR
  - 数据标注
categories:
  - PaddleOCR 
  - 数据标注
cover: http://img.upoorcake.cn/upoorcake/202508231007870.jpg
description:
---

# PaddleOCR 数据标注

## 概述

PaddleOCR 训练数据标注

先说一下我的环境：

cuda 12.6 cudnn 8.9.7  GPU 4070ti 

## 详细步骤

### 步骤一：安装cuda cudnn 英伟达软件包

这个网上已经有太多教程了 这里就不再赘述了
### 步骤二：安装anaconda 

[Anaconda.org](https://anaconda.org/)

没啥好说的，官网下载 一直下一步就行了
### 步骤三：安装paddlepaddle
1. 打开anaconda 新建环境
```
	conda create -n paddle_ocr3.02 python=3.12
```
![image.png](http://img.upoorcake.cn/upoorcake/202508271626937.png)
2. 创建环境后激活环境
```
activate paddle_ocr3.02
```
![image.png](http://img.upoorcake.cn/upoorcake/202508271628875.png)

3. 安装paddlepaddle 我们根据官方给的安装步骤来
	1. [PaddleOCR/readme/README\_cn.md at main · PaddlePaddle/PaddleOCR · GitHub](https://github.com/PaddlePaddle/PaddleOCR/blob/main/readme/README_cn.md)
	2. [开始使用\_飞桨-源于产业实践的开源深度学习平台](https://www.paddlepaddle.org.cn/install/quick?docurl=/documentation/docs/zh/develop/install/pip/windows-pip.html)
	我们从github的页面上可以找到安装文档 
	![image.png](http://img.upoorcake.cn/upoorcake/202508271652070.png)
	复制安装指令 
```
	python -m pip install paddlepaddle-gpu==3.1.1 -i https://www.paddlepaddle.org.cn/packages/stable/cu126/

```
![image.png](http://img.upoorcake.cn/upoorcake/202508271654421.png)


这一步下载会非常慢 推荐挂梯子
### 步骤三：安装ppocrlabel

1. 打开ppocrlabel github页面[GitHub - PFCCLab/PPOCRLabel: PPOCRLabelv2 is a semi-automatic graphic annotation tool suitable for OCR field, with built-in PP-OCR model to automatically detect and re-recognize data.](https://github.com/PFCCLab/PPOCRLabel)
2. 根据文档来，因为我们已经安装了paddlepaddle 可以省略1.1 直接1.2：
![image.png](http://img.upoorcake.cn/upoorcake/202508271657884.png)
3. 安装ppocrlabel 这里用清华源
```
pip install PPOCRLabel -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 步骤三：安装完之后并不能启动，往往运行启动没反应

![image.png](http://img.upoorcake.cn/upoorcake/202508271700516.png)


可以运行试一下 是没反应的。但是实际上后台在运行 ，因为它需要下载各种模型

但没有打印日志给我们看

我们把ppocrlabel源码下载下来 

```
cd E:\PaddleOCR\PPOCRLabel-3.1.2
```

然后运行他的PPOCRLabel.py 文件就能看到运行进程

```
python PPOCRLabel.py
```

![image.png](http://img.upoorcake.cn/upoorcake/202508271704637.png)

这样运行就可以看到他后台在下载各种各样的模型 ，并且往往因为下载速度慢报错 。这里同样要挂梯子下载

下载完 再次运行 会有文件检查速度也很慢，但要等一等

再之后就可以 直接输入 ppocrlabel 运行软件了。不过很有可能会卡住，因为加载模型也很慢
![image.png](http://img.upoorcake.cn/upoorcake/202508271706695.png)

大概打开之后这样，然后就是常规的标标标了。牛马开始干活吧

![image.png](http://img.upoorcake.cn/upoorcake/202508271708201.png)


