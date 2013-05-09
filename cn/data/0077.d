把 CDlinux 镜像解压到C盘根目录。

XP 下用 Grldr 引导，必需文件:ntldr, boot.ini, grldr, menu.lst, 以及 CDlinux 文件夹：

在 boot.ini 中添加
[quote]c:\grldr="CDlinux"[/quote]
在 menu.lst 中写作：
[quote]title		CDlinux
root		(hd0,0)
kernel		/CDlinux/bzImage quiet CDL_LANG=zh_CN.UTF-8
initrd		/CDlinux/initrd[/quote]
[img]/upload/b9aa3f586191.jpg[/img]