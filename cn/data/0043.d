把下面内容复制保存为（设置Excel宏安全性.reg），双击导入
设置Excel的宏安全性级别为高，防止宏病毒的入侵
------------------------------[代码]------------------------------
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\11.0\Excel\Security]
"Level"=dword:00000003
------------------------------[代码]------------------------------
