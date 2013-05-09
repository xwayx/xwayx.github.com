PHP默认安装后不显示错误信息display_errors=Off，为方便测试代码，设置一下。

修改php.ini，将display_errors设置为On。
sudo gedit /etc/php5/apache2/php.ini

重新启动apache服务。
sudo apache2ctl restart
