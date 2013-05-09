var cookiepre = '';
function isUndefined(variable) {
    return typeof variable == 'undefined' ? true: false;
}
var cookiedomain = isUndefined(cookiedomain) ? '': cookiedomain;
var cookiepath = isUndefined(cookiepath) ? '': cookiepath;
function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
    var expires = new Date();
    if (cookieValue == '' || seconds < 0) {
        cookieValue = '';
        seconds = -2592000;
    }
    expires.setTime(expires.getTime() + seconds * 1000);
    domain = !domain ? cookiedomain: domain;
    path = !path ? cookiepath: path;
    document.cookie = escape(cookiepre + cookieName)
		+ '=' + escape(cookieValue)
		+ (expires ? '; expires='
		+ expires.toGMTString() : '')
		+ (path ? '; path=' + path: '/')
		+ (domain ? '; domain=' + domain: '')
		+ (secure ? '; secure': '');
}
function getcookie(name, nounescape) {
    name = cookiepre + name;
    var cookie_start = document.cookie.indexOf(name);
    var cookie_end = document.cookie.indexOf(";", cookie_start);
    if (cookie_start == -1) {
        return '';
    } else {
        var v = document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end: document.cookie.length));
        return ! nounescape ? unescape(v) : v;
    }
}
function addCookie(objName, objValue, objHours) {
    var ms = objHours * 3600;
    setcookie(objName, objValue, ms);
}
function delCookie(objName) {
    setcookie(objName, '', '');
}
function RndNum(n) {
    var rnd = '';
    for (var i = 0; i < n; i++) {
        rnd += Math.floor(Math.random() * 10);
    }
    return rnd;
}
if (!getcookie('style')) {
    addCookie('style', 'default', 720);
}
var Sty = getcookie('style');
document.write('<link rel="stylesheet" type="text/css" href="/style/' + Sty + '/style.css" />');
function cgsty(sTy) {
    addCookie('style', sTy, 720);
    scrollTo(0, 0);
    window.location.reload();
}
var type = '默认+Default+default|2012+2012+2012|宽屏+WideScreen+wide'.split('|');
var nv = '<a href="javascript:home();">首页</a><a href="javascript:about();">关于</a>';
var env = '<a href="javascript:home();">Home</a><a href="javascript:about();">About</a>';
var sK = '<p class="title">风格</p>';
var esK = '<p class="title">Style</p>';
var tcur = '';
for (i = 0; i < type.length; i++) {
    if (Sty == type[i].split('+')[2]) {
        tcur = ' class="cur"';
    }
    sK += '<a href="javascript:cgsty(\'' + type[i].split('+')[2] + '\');"' + tcur + '>' + type[i].split('+')[0] + '</a>';
    esK += '<a href="javascript:cgsty(\'' + type[i].split('+')[2] + '\');"' + tcur + '>' + type[i].split('+')[1] + '</a>';
    tcur = '';
}
