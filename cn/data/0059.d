修改：/etc/hosts文件：
sudo gedit /etc/hosts

添加
127.0.0.1 www.test.com

修改apache配置
sudo gedit /etc/apache2/sites-available/default

添加
[quote]<VirtualHost *:80>
DocumentRoot /var/www/test/
ServerName  www.test.com
</VirtualHost>[/quote]
重启apache
sudo apache2ctl restart

注：
[quote]域名随意取，hosts与apache配置要一致。
目录可改，方便本机设置多个域名测试网站。[/quote]
