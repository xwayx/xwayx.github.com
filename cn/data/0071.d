在ubuntu apt-get upgrade的时候，遇到：
[quote]E: Could not get lock /var/cache/

apt/archives/lock - open (11 Resource temporarily unavailable)
E: Unable to lock the download directory[/quote]
解决办法如下：
[quote]sudo rm -rf /var/cache/apt/archives/lock
sudo apt-get update[/quote]
然后apt-get就恢复正常了。