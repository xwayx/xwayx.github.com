你的Windows所需的文件已经被替换成无法识别的版本 修复方法有以下几种 

1>Windows文件保护并非时时刻刻都对那些受保护的文件进行扫描，如果你使用的是公用计算机，那么还是安全为好，在“开始→运行”对话框中键入“gpedit.msc”，打开“本地计算机策略→计算机配置→管理模板→系统”窗口，找到“Windows文件保护”组，在右侧窗格中双击“设置Windows文件保护扫描”项 你可以去选择启动还是关闭 

2>可以在“运行”中输入“regedit”，打开“注册表编辑器”，找到[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]右侧窗格中的SFCDisable值，其默认设置是0，即重新启动后不扫描受保护的文件 
