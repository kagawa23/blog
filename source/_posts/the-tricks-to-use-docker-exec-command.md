---
title: 使用 Dockerfile CMD 命令行重定向stderr输出
date: 2017-05-20 07:49:35
tags: docker
---

项目需要，在docker image build阶段需要运行一个脚本，重定向bash脚本运行的输出，stderr重定向到stdout

shell命令行里很简单

```
bash script.sh 2>&1
```
在Dockerfile中直接定义

```
CMD ["bash","script.sh","2>&1"]
```

这样是没有办法工作的。

<!--more-->

这个Dockerfile在执行的过程中是不会触发命令行环境的，e.g. `CMD ["echo","$HOME"]`是没有办法替换环境变量`$HOME`的。

上面的命令会将“2>&1”作为命令行参数传到myscript.sh 里面

需要这样

```
CMD ["/bin/sh", "-c", "bash myscript.sh 2>&1"]
```

[参考链接](http://http://stackoverflow.com/questions/34632959/redirecting-command-output-in-docker)
