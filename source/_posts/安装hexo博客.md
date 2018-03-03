---
title: 如何搭建hexo博客
date: 2017-04-14 14:29:24
tags: quicknote hexo next
categories: blog 博客
---

## 如何搭建hexo博客


### 1. 安装node
hexo博客需要安装nodejs
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node-verison
```

### 2. 安装git
```bash
sudo yum install git
```

### 3. 安装博客框架
```bash
sudo npm install hexo-cli -g

//hexo初始化一个博客
hexo init blog
cd blog
npm install
hexo server

//或者从github checkout项目

git clone

npm install
```
<!--more-->


### 4. 配置Hexo
在_config.yml 在github新建一个仓库(new repository)，命名为YourSiteName.github.io

修改root/_config.yml
```bash
deploy:
  type: git
  repository: git@github.com:**/YourSiteName.github.io
  branch: master
```
### 5. 安装主题

发现还是下载zip包解压到theme文件夹比较好，因为要修改主题的_config.yml文件，这样可以保证修改会保存在git上
如果用clone，那么这个主题文件夹会属于另外的repository，对主题配置文件修改的就没有了


### 基本操作

hexo clean    //清除生成文件
hexo generate //生成静态文件
hexo server   //本地运行blog
hexo deloy    //发布博客


### 添加html页面

如果你是不想`hexo generate`时被模板改变你的html的话，可在在文件头加layout: false 例如新建一个404页面

```
layout: false
title:"404"
date: 2015-02-05 20:03:48
---
<html>
<head>
 <meta charset="UTF-8"/>
<title>公益404</title>
</head>
<body>
<h1>404 Page Not Found</h1>
<br>
<script type="text/javascript"src="http://www.qq.com/404/search_children.js"charset="utf-8">
</script>
<br>
</body>
</html>
```



### 碰到的问题
在执行`hexo clean`时，抛出error

解决办法：重新安装hexo-util模块

`npm install -- save-dev hexo-util`

```bash
ERROR Script load failed: themes/next/scripts/tags/exturl.js
Error: Cannot find module 'hexo-util'
    at Function.Module._resolveFilename (module.js:325:15)
    at Function.Module._load (module.js:276:25)
    at Module.require (module.js:353:17)
    at require (/Users/pro/Documents/workspace/blog/node_modules/hexo/lib/hexo/index.js:214:21)
    at /Users/pro/Documents/workspace/blog/themes/next/scripts/tags/exturl.js:8:12
    at /Users/pro/Documents/workspace/blog/node_modules/hexo/lib/hexo/index.js:230:12
    at tryCatcher (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/util.js:16:23)
    at Promise._settlePromiseFromHandler (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:512:31)
    at Promise._settlePromise (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:569:18)
    at Promise._settlePromise0 (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:614:10)
    at Promise._settlePromises (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:693:18)
    at Promise._fulfill (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:638:18)
    at Promise._resolveCallback (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:432:57)
    at Promise._settlePromiseFromHandler (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:524:17)
    at Promise._settlePromise (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:569:18)
    at Promise._settlePromise0 (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:614:10)
    at Promise._settlePromises (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:693:18)
    at Promise._fulfill (/Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/promise.js:638:18)
    at /Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/bluebird/js/release/nodeback.js:42:21
    at /Users/pro/Documents/workspace/blog/node_modules/hexo/node_modules/hexo-fs/node_modules/graceful-fs/graceful-fs.js:78:16
    at FSReqWrap.readFileAfterClose [as oncomplete] (fs.js:380:3)
```

