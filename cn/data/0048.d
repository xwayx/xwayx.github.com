由于不常用无线网卡，所以设置开机时禁用它，而不必每次手动去关掉。
将下面这条禁用无线网络的命令添加到“启动应用程序“中，这样开机时无线网络就会被自动禁用。
------------------------------[代码]------------------------------
dbus-send --system --type=method_call --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.DBus.Properties.Set string:org.freedesktop.NetworkManager string:WirelessEnabled variant:boolean:false
------------------------------[代码]------------------------------
