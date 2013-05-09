安装编译相关工具：
sudo apt-get install build-essential kernel-package libncurses5-dev fakeroot

安装内核配置xconfig依赖包：
sudo apt-get install libqt3-headers libqt3-mt-dev libqt3-compat-headers libqt3-mt

下载内核源代码：
到http://www.kernel.org/ 下载[Full Source](完整版)，解压缩linux内核。

给内核打BFS补丁：
到http://ck.kolivas.org/patches/bfs/ 下载相应版本BFS补丁
运行终端，cd进入解压缩后的linux源码目录，运行patch -Np1 < xxxx.patch(此处注意patch路径)

清理以前编译留下的临时文件：
make mrproper

开始量身定做config
自动保留当前系统中加载了的模块，精简无用模块
所以首先折腾一下系统，插个优盘，开开摄像头，用下光驱之类， 以便让内核加载上平时使用时候所需要的模块；
make localmodconfig

配置内核：
make xconfig
去除在kerntl hacking中的compile the kernel with debug info，这是调试信息，勾选的话内核体积相当大。
打BFS补丁，这几个是必须注意的
* Processor type and features -> Tickless System (Dynamic Ticks) 留空
* Processor type and features -> Preemption Model (Preemptible Kernel(Low-Latency Desktop)) -> 选 Preemptible Kernel (Low-Latency Desktop)
* Processor type and features -> Timer frequency -> 选1000Hz
其他详细配置请查阅其他资料，设置完成后保存设置并退出。

清除配置时留下的无用文件：
sudo make-kpkg clean

开始编译内核：
sudo CONCURRENCY_LEVEL=2 make-kpkg --initrd --append-to-version=-lb0528 kernel_image kernel-headers
CONCURRENCY_LEVEL=2 指的是用几个线程来编译，version=-lb0528 版本后缀
编译完成后会在上一级目录生成两个文件，linux-headers-…-_i386.deb和linux-image-…-i386.deb。
编译过程如果出现错误，查明原因，重新来过。

安装内核：
cd ..(返回上一级目录)
sudo dpkg -i linux-image-（按tab键自动补全目录）
安装内核只安装linux-image…文件即可，另一个linux-headers…可以不用安装。

查看和对比内核大小：
ls -l /boot/

重启后进入使用新内核：
如果新内核无法启动系统，在GRUB界面时选择原来的内核进系统，重新编译内核。
