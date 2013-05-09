自动配置代理脚本，javascript语言，要过滤的网址自行添加
IE在局域网设置中类似file://c:/proxy.pac
[quote]// Proxy Auto-Config file

var Py = "PROXY 127.0.0.1:8087";
var Pn = "DIRECT";
var sIp = "^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$";

var Urls = "localhost|*.cn|*baidu.com|*163.com|*sina.com|*weibo.com";

Urls = Urls.split("|");

function FindProxyForURL(url, host) {
    if (shExpMatch(host, sIp)) { return Pn;}
    for (i = 0; i < Urls.length; i++) {
        if (shExpMatch(host, Urls[i])) { return Pn;}
    }
    return Py;
}[/quote]