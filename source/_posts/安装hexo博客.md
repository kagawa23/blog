---
title: 如何搭建hexo博客
date: 2017-04-14 14:29:24
tags: quicknot
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


基本操作

hexo clean    //清除生成文件
hexo generate //生成静态文件
hexo server   //本地运行blog
hexo deloy    //发布博客
