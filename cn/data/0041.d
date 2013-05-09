把下面内容复制保存为（局域网共享.bat），双击运行
此文件用于WinXP设置局域网共享，方便快捷，设置后重启生效
------------------------------[代码]------------------------------
@echo off
cls
echo.
echo.
echo 1. 开启匿名访问 2.启用验证访问(需要输入用户名密码) 3.关闭共享 4.返回
echo.
echo.
set choice=
set /p choice= ● 请选择‖
if /i "%choice%"=="1" goto share1
if /i "%choice%"=="2" goto share2
if /i "%choice%"=="3" goto share3
if /i "%choice%"=="4" goto end
goto share
:share1
cls
net user Guest /active:yes
echo Windows Registry Editor Version 5.00 >share.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>share.reg
echo "restrictanonymous"=dword:00000000 >>share.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>share.reg
echo "restrictanonymous"=dword:00000000 >>share.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>share.reg
echo "limitblankpassworduse"=dword:00000000 >>share.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>share.reg
echo "limitblankpassworduse"=dword:00000000 >>share.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>share.reg
echo "forceguest"=dword:00000001 >>share.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{75048700-EF1F-11D0-9888-006097DEACF9}\Count] >>share.reg
echo "HRZR_EHAPCY"=hex:0C,00,00,00,26,00,00,00,F0,FB,E5,52,64,95,C6,01 >>share.reg
echo "HRZR_EHAPCY:"P:\JVAQBJF\flfgrz32\sverjnyy.pcy",Jvaqbjf 防火墙"=hex:0C,00,00,00,08,00,00,00,F0,FB,E5,52,64,95,C6,01 >>share.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>share.reg
echo "445:TCP"="445:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22005" >>share.reg
echo "137:UDP"="137:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22001" >>share.reg
echo "138:UDP"="138:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22002" >>share.reg
echo "139:TCP"="139:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22004" >>share.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Epoch] >>share.reg
echo "Epoch"=dword:000001ED >>share.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Providers] >>share.reg
echo "LogonTime"=hex:E8,31,8E,4F,64,95,C6,01 >>share.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>share.reg
echo "445:TCP"="445:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22005" >>share.reg
echo "137:UDP"="137:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22001" >>share.reg
echo "138:UDP"="138:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22002" >>share.reg
echo "139:TCP"="139:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22004" >>share.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Epoch] >>share.reg
echo "Epoch"=dword:000001ED >>share.reg
regedit /s share.reg
del share.reg
echo.
echo.
echo √. 局域网匿名访问已开启ゞ
echo 注意：本机要重启后才会生效。
echo ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo.
pause & goto logon
:end
goto logon
:share2
cls
net user Guest /active:no
echo Windows Registry Editor Version 5.00 >usershare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>usershare.reg
echo "restrictanonymous"=dword:00000000 >>usershare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>usershare.reg
echo "restrictanonymous"=dword:00000000 >>usershare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>usershare.reg
echo "limitblankpassworduse"=dword:00000000 >>usershare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>usershare.reg
echo "limitblankpassworduse"=dword:00000000 >>usershare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>usershare.reg
echo "forceguest"=dword:00000000 >>usershare.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{75048700-EF1F-11D0-9888-006097DEACF9}\Count] >>usershare.reg
echo "HRZR_EHAPCY"=hex:0C,00,00,00,26,00,00,00,F0,FB,E5,52,64,95,C6,01 >>usershare.reg
echo "HRZR_EHAPCY:"P:\JVAQBJF\flfgrz32\sverjnyy.pcy",Jvaqbjf 防火墙"=hex:0C,00,00,00,08,00,00,00,F0,FB,E5,52,64,95,C6,01 >>usershare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>usershare.reg
echo "445:TCP"="445:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22005" >>usershare.reg
echo "137:UDP"="137:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22001" >>usershare.reg
echo "138:UDP"="138:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22002" >>usershare.reg
echo "139:TCP"="139:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22004" >>usershare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Epoch] >>usershare.reg
echo "Epoch"=dword:000001ED >>usershare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Providers] >>usershare.reg
echo "LogonTime"=hex:E8,31,8E,4F,64,95,C6,01 >>usershare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>usershare.reg
echo "445:TCP"="445:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22005" >>usershare.reg
echo "137:UDP"="137:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22001" >>usershare.reg
echo "138:UDP"="138:UDP:LocalSubNet:Enabled:@xpsp2res.dll,-22002" >>usershare.reg
echo "139:TCP"="139:TCP:LocalSubNet:Enabled:@xpsp2res.dll,-22004" >>usershare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Epoch] >>usershare.reg
echo "Epoch"=dword:000001ED >>usershare.reg
regedit /s usershare.reg
del usershare.reg
echo.
echo.
echo √. 局域网验证访问已开启ゞ
echo 友情提示：无需重启，其它机现在就可以访问本机了。
echo ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo.
pause & goto logon
:end
goto logon
:share3
cls
net user Guest /active:no
echo Windows Registry Editor Version 5.00 >offshare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>offshare.reg
echo "restrictanonymous"=dword:00000001 >>offshare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>offshare.reg
echo "restrictanonymous"=dword:00000001 >>offshare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>offshare.reg
echo "limitblankpassworduse"=dword:00000001 >>offshare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>offshare.reg
echo "limitblankpassworduse"=dword:00000001 >>offshare.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>offshare.reg
echo "forceguest"=dword:00000001 >>offshare.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{75048700-EF1F-11D0-9888-006097DEACF9}\Count] >>offshare.reg
echo "HRZR_EHAPCY"=hex:0C,00,00,00,2A,00,00,00,90,AF,A4,87,A4,95,C6,01 >>offshare.reg
echo "HRZR_EHAPCY:"P:\JVAQBJF\flfgrz32\sverjnyy.pcy",Jvaqbjf 防火墙"=hex:0C,00,00,00,13,00,00,00,90,AF,A4,87,A4,95,C6,01 >>offshare.reg echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\RNG] >>offshare.reg
echo "Seed"=hex:AC,6F,9A,2B,11,64,44,68,EC,90,1B,76,72,A7,0A,14,4C,79,37,BB,FD,BD,70,B2,B2,58,D5,B5,89,5C,B6,4E,3B,18,A5,26,46,BC,3E,6A,30,A4,7D,A0,56,E6,6A,B5,57,3A,BF,A1,CD,CA,B6,64,4C,F9,0E,D2,64,ED,86,1F,61,F6,D1,01,0B,7C,8D,BD,73,10,C8,4E,57,93,4E,90 >>offshare.regecho [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>offshare.reg
echo "445:TCP"="445:TCP:LocalSubNet:Disabled:@xpsp2res.dll,-22005" >>offshare.reg
echo "137:UDP"="137:UDP:LocalSubNet:Disabled:@xpsp2res.dll,-22001" >>offshare.reg
echo "138:UDP"="138:UDP:LocalSubNet:Disabled:@xpsp2res.dll,-22002" >>offshare.reg
echo "139:TCP"="139:TCP:LocalSubNet:Disabled:@xpsp2res.dll,-22004" >>offshare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Epoch] >>offshare.reg
echo "Epoch"=dword:000001FC >>offshare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List] >>offshare.reg
echo "445:TCP"="445:TCP:LocalSubNet:Disabled:@xpsp2res.dll,-22005" >>offshare.reg
echo "137:UDP"="137:UDP:LocalSubNet:Disabled:@xpsp2res.dll,-22001" >>offshare.reg
echo "138:UDP"="138:UDP:LocalSubNet:Disabled:@xpsp2res.dll,-22002" >>offshare.reg
echo "139:TCP"="139:TCP:LocalSubNet:Disabled:@xpsp2res.dll,-22004" >>offshare.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Epoch] >>offshare.reg
echo "Epoch"=dword:000001FC >>offshare.reg
regedit /s offshare.reg
del offshare.reg
echo.
echo.
echo √. 已关闭局域网共享ゞ
echo 友情提示：不必重启，设置已生效。
echo ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
echo.
pause & goto logon
------------------------------[代码]------------------------------
