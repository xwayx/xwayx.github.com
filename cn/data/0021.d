如果其他方法无效的话，解决方法如下：(xxxx代表出错的软件包)
1..先備份status
sudo cp /var/lib/dpkg/status /var/lib/dpkg/status.back
2..用gedit打開搜尋Package: xxxx，刪除这个部分的描述，刪到下個Package:XXX前就好，請小心使用。
sudo gedit /var/lib/dpkg/status
3.存檔後更新套件庫在安裝應該就可以了。
sudo apt-get update
4.把原来软件包残留的文件删掉，然后重新安装。
