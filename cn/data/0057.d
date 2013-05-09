关掉所有窗口，按住shift键， 
右键点任务栏的“Windows资源管理器”或“Windows Explorer”， 
选择“属性”,在“快捷方式”的“目标”里， 

Windows 7： 
explorer.exe后面加一个空格，再加一个半角逗号，像这样： 
%SystemRoot%\explorer.exe , 
或者 
%windir%\explorer.exe , 

Windows 8： 
不能再用win7的方法，在“快捷方式”的“目标”里，改写成以下内容： 
explorer shell:MyComputerFolder 

然后确定即可。 