---
title: 'js:window.open被拦截问题和fetch方法缓存'
date: 2018-03-11 20:45:20
tags: js
---
1. window.open问题

问题的缘由是要打开新的网页，在鼠标点击时间里加了一段window.open的方法，由于这段点击时间还要访问另外一个api去取数据，所以导致了被浏览器拦截了。

因为还写了别的类似的按钮发现弹出代码出现在ajax或者是异步调用的内部时，马上出现被拦截的表现。

原因是浏览器检查到非用户的操作产生的新弹出窗口，会对其进行阻止，浏览器认为这个不是用户希望看到的页面，

解决方案：

1. 使用a标签代替
 将标签可以换成a锚点来替代

2. 先弹出窗口，再重定向

先通过用户打开页面，在对页面进行重定向
```
foo.addEventListener('click',function(){
    var win = window.open('xxxx');
    ajax().done(funciton(){
        win.location.href = "taget url"
    })
})
```
<!--more-->

2. fetch缓存

碰上一个问题，fetch api请求一个s3上的资源，对他进行了修改，保存很快又一次去请求这个资源，发现资源没有变化。

是由于调用fetch api碰上了http的缓存，可以在header设置为{cache：no-store} 来避免缓存影响运行结果。

同样的微信浏览器有些图片也会被缓存如果图片发生改变了如果缓存存在就不会更新，可以在请求的资源后面加上请求参数， 保证每次都会更新图片。
http：//*?v=new Date().getTime()
