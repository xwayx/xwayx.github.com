从Ubuntu 10.04开始，Upstart就被引入管理系统启动的进程与服务。所以，如果要添加或禁止某些服务进程自动启动，以前的方式（比如用update-rc.d命令）就不管用了。如果你运行这个命令来停止mysql，你会得到如下信息：
[quote]$>sudo /etc/init.d/mysql stop
Rather than invoking init scripts through /etc/init.d, use the service(8)
utility, e.g. service mysql restart
 
Since the script you are attempting to invoke has been converted to an
Upstart job, you may also use the restart(8) utility, e.g. restart mysql[/quote]
那么Upstart又怎么用呢？
首先，我们知道旧的系统管理被称作SysV，它通过在代表各个run level的目录里建立脚本来控制服务的自动启动。比如，/etc/rc0.d目录里以S开头的脚本会被运行在runlevel 0。在这种方式下，如果要屏蔽一个服务，需要把S开头的那个更名为以K开头。而所以在rc*.d下的脚本都链接到/etc/init.d目录里。而Upstart采用了完全不同的方式。它要求所有的启动脚本，其实是配置文件，建立在/etc/init目录下，每个服务一个文件，里面定义脚本启动与关闭的运行级别、条件、事件，等。可以看得出，Upstart要比SysV高明得多，因为SysV启动是线性、顺序的，一个S20的服务必须要等待S19启动完成才能启动，如果一个启动要花很多时间，那么后面的服务就算完全无关，也必须要等。而在Upstart下，服务的启动基于事件，而且是并行的，只要事件发生，服务可以并发启动。这种方式无疑要优越得多，因为它可以充分利用现在计算机多核的特点，大大减少启动所需的时间。
下面介绍一下它的配置文件，以及如何管理服务/自动进程的启动、停止。
进入/etc/init目录，就可以看到所有的配置文件。打开其中一个，它的结构大概都类似这样：
[quote]# name - description
#
# more details of the service
#
 
description     "description of the service"
 
start on (local-filesystems
	  and net-device-up
	  and runlevel [45]
stop on runlevel [06]
 
expect daemon
task
 
emits event-1
emits event-2
...
 
pre-start script
	...
 
exec /usr/sbin/...
 
post-start script
	...[/quote]
内容非常容易理解。start on和stop on定义了启动与停止的事件、运行级别等。emits是这个服务自己触发的事件，也就是这个服务启动后发出的事件。下面的pre-start script和post-start script是启动前后运行的脚本。是不是很简单？
那么怎样取消一个服务的自动启动？拿MySQL为例，只需要把start on那三行注释掉就好了。但不要删除/etc/init/mysql.conf文件，这样以后仍然可以用start/stop这些命令来控制它的状态。
输入命令start, stop, restart, status，即可启动、停止、查询服务状态，对应以前init.d的方式。另一个很有用的命令是initctl，在命令行输入initctl list即可列出所有服务的运行状态。用man initctl可以获取更多的信息。

转自[url]http://shao-fan.com/blog/ubuntu-upstart.html[/url]