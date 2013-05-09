大多数实现自动关机的方法都是使用一些第三方软件，这样不仅麻烦，而且为实现这个小功能而专门动用一个软件，显的小题大做了！其实Windows XP(Windows 2000也可以)自身就具备定时关机的功能，下面我们就来看看如何实现Windows XP的自动关机。 
Windows XP的关机是由Shutdown.exe程序来控制的，位于Windows＼System32文件夹中 
。如果想让Windows 2000也实现同样的效果，可以把Shutdown.exe复制到系统目录下。 
比如你的电脑要在22:00关机，可以选择“开始→运行”，输入“at 22:00 Shutdown -s”，这样，到了22点电脑就会出现“系统关机”对话框，默认有30秒钟的倒计时并提示你保存工作。如果你想以倒计时的方式关机，可以输入“Shutdown.exe -s -t 3600”，这里表示60分钟后自动关机，“3600”代表60分钟。 
设置好自动关机后，如果想取消的话，可以在运行中输入“shutdown -a”。另外输入“shutdown -i”，则可以打开设置自动关机对话框，对自动关机进行设置。 
Shutdown.exe的参数，每个都具有特定的用途，执行每一个都会产生不同的效果，比如“-s”就表示关闭本地计算机，“-a”表示取消关机操作，下面列出了更多参数，大家可以在Shutdown.exe中按需使用。 
-f：强行关闭应用程序 
-m ＼＼计算机名：控制远程计算机 
-i：显示图形用户界面，但必须是Shutdown的第一个选项 
-l：注销当前用户 
-r：关机并重启 
-t时间：设置关机倒计时 
-c "消息内容"：输入关机对话框中的消息内容(不能超127个字符) 
