# Markdown 图片问题解决方案

## 序言

对于markdown文件，文件内容自身不包含图片，只能通过图片语法外链引入图片。所以，要在markdown中使用图片，大体分为两种方式：本地引用和图床引入



## 本地引入

本地引入方式最清晰。直接将图片和markdown文件放在同一文件夹下，然后使用markdown语法\!\[\]\(图片相对路径)这样引入即可，也就是链接语法前面加上一个感叹号即可。

不过这种方式相对麻烦，特别对于截图来说，要保存成文件，然后移动到该目录下改名，操作起来不是很舒服。所以更多的，还是靠第二种方式：图床引入。

PS: 如果倾向于本地引入，推荐使用编辑器[typora](https://www.typora.io/),免费精致的markdown编辑器，支持直接粘贴图片，并且会弹框询问是否要将图片移动到同一目录下。



## 图床引入

所谓图床，其实就是在公网上开辟一个共享空间，使用者可以很方便的快速拖拽上传图片，拿到图片的公网url，然后直接插入markdown中或者做其他分享使用。



### 图床以及工具选择

* 图床：介于程序员来说，最常用的分享社区就是github了，所以这里优先的选择便是使用github公有仓库制作图床，方便且免费。
* 工具：这里推荐使用picgo，操作简单，支持github图床，并且可以集成到编辑器中。



## PicGo

### 安装

* 如果安装过cake-brew

  ```bash
  brew cask install picgo
  ```

* 直接下载[安装包](https://github.com/Molunerfinn/PicGo/releases)

### 配置

安装完后需要进行一些简单的配置.

首先，在插件设置中搜索plugin,然后安装github-plus插件:

![](https://raw.githubusercontent.com/tanlukang/inceptionpad-wiki/images/xiabin/CleanShot%202019-11-12%20at%2012.11.30@2x.png)



然后在侧边栏就会出现githubPlus的设置选项：

![](https://raw.githubusercontent.com/tanlukang/inceptionpad-wiki/images/xiabin/CleanShot%202019-11-12%20at%2012.13.38@2x.png)



这里统一设置仓库名为 ```tanlukang/inceptionpad-wiki```,分支名为```images```,token在[这里创建](https://github.com/settings/tokens/new),token需要的权限只需要仓库的读写权限即可. 存储路径填写自己的名字缩写，比如我这里就是```xiabin/```,自定义域名暂时留空，设为默认图床，然后确定即可.



现在，点击左边的上传区，就可以使用图床了：

![](https://raw.githubusercontent.com/tanlukang/inceptionpad-wiki/images/xiabin/CleanShot%202019-11-12%20at%2012.15.08@2x.png)



如图所示，支持直接剪贴板上传，或者拖拽图片或者点击上传。上传成功后会直接生成markdown语法的图片链接，自动复制到剪贴板，所以只需要上传成功后，在markdown编辑器中粘贴即可......



同时，在左侧还有相册功能，可以查看历史上传的图片，复制历史图片的链接什么的。



**PS: 部分截图软件截图到剪贴板后默认文件名会有空格，所以在剪贴板上传的方式上传图床时，弹出是否修改上传文件名的框中，需要去掉空格，或者把空格替换成%20这个转义字符，不然的话部分markdown解析器会不认带空格的url (没错，我指的就是bitbucket的md解析器！)**



### PicGo编辑器插件

目前PicGo支持与VScode直接集成，使用vscode编辑markdown文件时，可以直接插入图片，图片会自动上传然后生成url插入到markdown中。不过需要手动编辑配置，设置本机PicGo的配置目录，才能读取到上传图床的相关配置。[传送门](https://github.com/PicGo/vs-picgo)





## 附录：截图神器-CleanShot

* 搞笑的快捷键截图

* 便捷的截图后编辑功能（需在设置中开启，类似QQ）

* 支持屏幕录制

* 截图编辑后自动拷贝到剪贴板（需在设置中开启）

  ![](https://raw.githubusercontent.com/tanlukang/inceptionpad-wiki/images/xiabin/CleanShot%202019-11-12%20at%2012.22.31@2x.png)

