---
layout:		post
title:		Mount
subtitle:	挂载远程服务器，及权限总结
date:		2019-07-06
author:		Ripper-S
header-img:	img/post-bg-2015.jpg
catalog:	true
tags:
    - LINUX
---


#	前言
今天学习了mount相关操作，记录一下自己的学习历程。

#	正文
sudo mount -t cifs //172.16.1.106/bu2pd2-Data/share /home/chenshu/swap-jenkins/ -o username=bu2pd2,password=bu2pd2,vers=1.0,dir_mode=077,file_mode=077,uid=1000,gid=1000<br>
dir_mode,file_mode=077意味着主用户和组用户都是rwx权限

uid是用户id号，gid是组id号；用 id xxx 查看。<br>
如果uid和gid没有设置，或者设置错了，导致nogroup，则一开始设置的文件权限mode都将白费功夫。

已经挂载了之后，如果我们还想修改文件的权限呢？如下：
chmod 777 xxx.file

还有一个小命令可以查看我们文件的默认权限：umask
