默认的Linux发行版中的内核配置都会开启tmpfs，映射到了/dev下的shm目录。可以通过df 命令查看结果.
/dev/shm 是linux下一个非常有用的目录，因为这个目录不在硬盘上，而是在内存里。因此在linux下，就不需要大费周折去建ramdisk，直接使用/dev/shm 就可达到很好的优化效果。默认系统就会加载/dev/shm ，它就是所谓的tmpfs，有人说跟ramdisk（虚拟磁盘），但不一样。象虚拟磁盘一样，tmpfs 可以使用您的 RAM，但它也可以使用您的交换分区来存储。而且传统的虚拟磁盘是个块设备，并需要一个 mkfs 之类的命令才能真正地使用它，tmpfs 是一个文件系统，而不是块设备；您只是安装它，它就可以使用了。
 
[b]tmpfs有以下优势：[/b]

1。动态文件系统的大小，/dev/shm 需要注意的一个是容量问题，在linux下，它默认最大为内存的一半大小，使用df -h命令可以看到。但它并不会真正的占用这块内存，如果/dev/shm 下没有任何文件，它占用的内存实际上就是0字节；如果它最大为1G，里头放有 100M文件，那剩余的900M仍然可为其它应用程序所使用，但它所占用的100M内存，是绝不会被系统回收重新划分的 

2。tmpfs 的另一个主要的好处是它闪电般的速度。因为典型的 tmpfs 文件系统会完全驻留在 RAM 中，读写几乎可以是瞬间的。 

3。tmpfs 数据在重新启动之后不会保留，因为虚拟内存本质上就是易失的。所以有必要做一些脚本做诸如加载，绑定的操作。 

[b]运用，可以在 fstab 中挂载，也可以在/dev/shm 中建目录挂载过去：[/b]

挂载chromium的缓存目录到内存：(内容可写到 /etc/rc.local)
[quote]mkdir -p /dev/shm/chromium
chmod 1777 /dev/shm/chromium
mount --bind /dev/shm/chromium /home/[i](username)[/i]/.cache/chromium[/quote]
fstab中挂载/tmp /var/tmp /var/log 到tmpfs：(文件在 /etc/fstab)
[quote]#Entry for /tmp :
none	/tmp	tmpfs defaults,noatime,mode=1777	0	0
#Entry for /var/tmp :
none	/var/tmp	tmpfs defaults,noatime,mode=1777	0	0
#Entry for /var/log :
none	/var/log	tmpfs defaults,noatime,mode=1777	0	0[/quote]
检查状态：
[quote]df -h[/quote]