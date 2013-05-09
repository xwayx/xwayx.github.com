Swap分区被格式化，调整大小或者安装时木有swap后来新加的，均适用此法。
[quote]# 找出swap分区的UUID
sudo blkid

# 更改fstab中swap分区的UUID
sudo gedit /etc/fstab

# 更改休眠恢复分区UUID
sudo gedit /etc/initramfs-tools/conf.d/resume

# 更新initrd
sudo update-initramfs -u[/quote]