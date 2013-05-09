官网驱动下载地址:http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=21&PFid=48&Level=5&Conn=4&DownTypeID=3&GetDown=false

借以下方法解决
------------------------------[引用]------------------------------
划了60个G装上了ubuntu9.10，除了无线网卡认不出来以外其他一切正常，只能自己找驱动装了。网卡是11b/g/n Wireless LAN Mini-PCI Express Adapter II，这块网卡还蛮BT的BT3（破解无线密码那个）也在这块卡上用不成，郁闷。

这个得自己编译再安装。解压后在命令行下切到该驱动文件夹下执行make进行编译，一切顺利，执行sudo make install进行安装的时候报错了，
No rule to make target `kernel/bounds.c’, needed by `kernel/bounds.s’. Stop.
晕倒…
还好又找到了另一安装方法：
1.将HAL/rtl8192/r8192se_pci.ko文件复制到/lib/modules/2.6.31-14-generic/kernel/net/wireless
2.复制firmware下的RTL8192SE文件夹到/lib/firmware/下
3.执行命令sudo depmod -a
4.执行命令sudo modprobe r8192se_pci
现在看看，无线指示灯亮了。
------------------------------[引用]------------------------------
