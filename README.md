#NetKeeper for Ubuntu 16.10
##简述
###本程序根据 miao1007 运行在 OpenWrt 上的 NetKepper 修改

[原项目地址](http://www.right.com.cn/forum/thread-141979-1-1.html)

###在 ubuntu 上拨号原理
1. 利用 main.c 获取真实的 pppoe 拨号帐号
( 在windows的客户端上是在真实帐号前加前缀,密码不变,利用加前缀的用户名和密码进行 pppoe 拨号, 具体加前缀方式请看原项目 )
2. 修改系统 pppoe 配置文件,填入实际拨号帐号和密码
3. 进行 pppoe 拨号

###支持地区
1. 武汉E信
2. 重庆
3. 杭州
4. 南昌(V18~V32)
5. 海南
6. 青海/新疆
7. 河北
8. 山东移动

本程序在仅河北联通测试通过

##如何使用


####1. 河北同学

1.1. 克隆代码

```
https://github.com/Ljqiii/Netkepper-Ubuntu.git
```		

1.2. 修改用户名和密码

在 main.c 第147行修改用户名, 在 connectSh 第3行修改密码

1.3. 编译

```
make
```

1.4 配置系统 pppoe (需要联网)
**帐号密码随意输入,其他一路回车**
```
sudo pppconfig
```

1.5运行

```
sudo connect.sh
```


###2. 其他地区的用户

2.1. 克隆代码

```
https://github.com/Ljqiii/Netkepper-Ubuntu.git
```		


2.2. 修改用户名和密码和配置文件

在 main.c 第147行修改用户名, 在 connectSh 第3行修改密码
在 main.c 第15行修改 RADIUS 值

地区 | RADIUS
------|-------
重庆 | xianxinli1radius
重庆0904 | xianxinli1radius
浙江 | singlenet01
新疆 | xinjiang@0724
青海 |shd@xiaoyuan0002
山东mobile | shandongmobile13
山西易讯 | sh_xi@xiaoyuan01
甘肃 telecom | xiaoyuanyixun001
浙江企业 | zjxinlisx02
浙江校园 | singlenet01

**以上配置文件来自 miao1007 的 makefile文件,wjunwei进行测试**
2.3. 编译

```
make
```
2.4. 配置系统 pppoe (需要联网)
**帐号密码随意输入,其他一路回车**
```
sudo pppconfig
```

2.45运行

```
sudo connect.sh
```

##感谢
* [NETKEEPER ON WINDOWS](http://www.purpleroc.com/html/507231.html)
* [CQUPT NETKEEPER](http://bbs.cqupt.edu.cn/nForum/#!article/Unix_Linux/13624)
* [miao007](https://github.com/miao1007/)


##License

1. GPL
2. 请勿作任何商业用途
