1
下载驱动包： [url]http://wireless.kernel.org/download/compat-wireless-2.6/[/url]
解压编译安装：
make
sudo make install

2
到 [url]http://linuxwireless.org/download/htc_fw/[/url]
下载文件：htc_9271.fw，htc_7010.fw
放到 /lib/firmware 中

3
禁用驱动再启用
sudo modprobe -r ath9k_htc
sudo modprobe ath9k_htc

通常系统自带驱动，应该执行2-3步即可。