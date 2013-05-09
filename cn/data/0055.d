我的无线网卡网络芯片是RTL8187L。

1.到realtek官方网站下载无线网卡RTL8187L驱动源代码包。
[url]http://www.realtek.com/downloads/downloadsView.aspx?Langid=3&PNid=1&PFid=1&Level=6&Conn=5&DownTypeID=3&GetDown=false&Downloads=true#RTL8187L[/url]

2.解压下载到的驱程，在终端进入驱动源代码目录，编译驱动。
sudo make
sudo make install
呵呵，重启后成功。

如果本来就有其他无线网卡的话：
最主要编辑/etc/udev/rules.d/70-persistent-net.rules文件。
更改MAC，把wlan0让出来给8187L。
否则8187L不能分配为wlan1，而显示wlan%d。
因为8187L的驱动就占着wlan0来写的，如果在8187L前wlan0分配给了其他无线网卡，是会起冲突的。