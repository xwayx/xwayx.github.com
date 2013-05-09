安装包
代码:
sudo apt-get install hwinfo


查看显卡支持的分辨率：
代码:
sudo hwinfo --framebuffer


显示如下
代码:
02: None 00.0: 11001 VESA Framebuffer                           
  [Created at bios.464]
  Unique ID: rdCR.uJDzR010pyF
  Hardware Class: framebuffer
  Model: "(C) 1988-2005, ATI Technologies Inc.  PARK"
  Vendor: "(C) 1988-2005, ATI Technologies Inc. "
  Device: "PARK"
  SubVendor: "ATI ATOMBIOS"
  SubDevice: 
  Revision: "01.00"
  Memory Size: 16 MB
  Memory Range: 0x80000000-0x80ffffff (rw)
  ......
  Mode 0x03ee: 1366x768 (+1408), 8 bits
  Mode 0x03ef: 1366x768 (+2752), 16 bits
  Mode 0x03f0: 1366x768 (+5504), 24 bits
  Config Status: cfg=new, avail=yes, need=no, active=unknown


要的就是Mode 0x03f0: 1366x768 (+5504), 24 bits中的0x03f0
修改到menu.lst，加入“ vga=0x03f0”，结果如下：

代码:
title      Ubuntu 10.04.2 LTS, kernel 2.6.32-33-generic
uuid      2fd94eef-27df-46ca-8a04-091b75b4ae3b ro
kernel      /boot/vmlinuz-2.6.32-33-generic root=UUID=2fd94eef-27df-46ca-8a04-091b75b4ae3b ro quiet splash vga=0x03f0
initrd      /boot/initrd.img-2.6.32-33-generic


开机画面好看很多。。。
