EC1261自带了Linux拨号程序Mobile Partner，插入设备后发现为光驱并加载，然后命令安装
sudo mkdir /etc/acpi/suspend.d
sudo bash /media/ChinaTelecom/Linux/install
装完后可以启动，但是中文界面有乱码，到网上下载一个微软雅黑字体，把下面的字体替换掉
/usr/local/Mobile_Partner/rt/lib/fonts/LucidaSansRegular.ttf
在“应用程序”－“互联网”－“Mobile_Partner”启动，
“工具”－“设置窗口”－“连接配置管理”里新建一个配置
号码＃777
用户名ctnet@mycdma.cn
密码ctnet.cn
保存，然后拨号成功上网。
