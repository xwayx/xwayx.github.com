[img]/upload/7474221286b5.jpeg[/img]
[quote]Sublime Text 2 是一个文本编辑器，代码编辑器。漂亮的用户界面和非凡的功能，例如迷你地图，多选择，Python的插件，代码段，等等。完全可自定义键绑定，菜单和工具栏。Sublime Text的主要功能包括：拼写检查，书签，完整的 Python API ， Goto 功能，即时项目切换，多选择，多窗口等等。

已经对Linux、Windows、OSX 提供了版本支持。界面美观大方，用户习惯良好。Sublime Text 2是收费软件，但目前可以无限期试用。其实它的未注册版本就可以无限期免费使用全部功能，但是标题栏上的Unregisited 不好看，另外还会偶尔弹出来注册提示，因此对其改造和破解就要开始了。[/quote]
下载 Linux 下的Sublime Text 2 版本：2.0.1 Build 2217。
Linux版本不用安装直接可以运行
[url]http://www.sublimetext.com/[/url]

解包后，用十六进制编辑器打开 sublime_text 编辑：
[quote]查找其中的……4333 3342 3032……

修改成……4333 3242 3032……后保存[/quote]
运行软件然后用通过程序算出来的Licence进行注册。
[quote]—–BEGIN LICENSE—–
China
Unlimited User License
EA7E-2861
BE67D2175D3569FDAB9EB5340FAD2822
E7B56B3397A76AA9FBE8AC3D3C65918B
DFC28F2EA158140D9E07853D594818EB
3A237B2E8E98ED257C269548F50EDA34
EF0C7F72D8917DB538A0245E46BFD6B1
85F4EDE331F253530ED67A5C19E92399
04C5F4A1AF4AF3DB5EC49C1FEE17CA76
7E369F8AAE4AC6C6E756B5882E1608B9
—–END LICENSE—–[/quote]
安装包控制(Package Control)

打开 Sublime Text 2，按下 Control + ` 调出 Console
将以下代码粘贴进命令行中并回车：
[quote]import urllib2,os;pf='Package Control.sublime-package';ipp=sublime.installed_packages_path();os.makedirs(ipp) if not os.path.exists(ipp) else None;open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read())[/quote]
重启 Sublime Text 2，如果在 Preferences -> Package Settings中见到Package Control这一项，就说明安装成功了。