var Text;var Txtsp;var maxl;var maxls;var total;var Cate;var Desc;var Patal;var Parem;var Patals;var Parems;
var Loop;var Sloop;var nPage;var sTmp = '';var Divr;var Cats;var cIndex = new Array();var yInd;var yAb;var Abou;var Lks;

var dir = 'cn/';var Lan = 'English';var al = '全部';var lmode = '目录模式';var pmode = '预览模式';var tlm = '切换至目录模式';
var tpm = '切换至预览模式';var terr = '出现错误!请尝试刷新网页!';var tile = '点击查看完整内容';var tf = '最前页';var tl = '最后页';
var tc = '网站统计';var lK = '链接';var cae = '类别';var itle='猛击看大图';
if(!getcookie('lan')){addCookie('lan', 'cn', 720);};var tlan = getcookie('lan');
if (tlan == 'en') {
dir = 'en/';Lan = '中文';al = 'All';lmode = 'List';pmode = 'Preview';tlm = 'Change to list mode';
tpm = 'Change to preview mode';terr = 'Error! Please reload page!';tile = 'Click here to read the full article';tf = 'First';tl = 'Last';
tc = 'Visitor Counter';lK = 'Links';cae = 'Category';itle='Click to enlarge';nv = env;sK = esK;
}

var _run;
var Http;
function BuildFind() {
    if (Http.readyState == 4) {
        if (Http.status == 200) {
            Text = Http.responseText;
            Text = Text.replace(/\r/ig, '');
            eval(_run);
            return;
        } else {
            alert(terr);
            return;
        }
    }
};
function GetHttp(strUrl) {
    if (window.ActiveXObject) {
        try {
            Http = new ActiveXObject("Microsoft.XMLHTTP");
        } catch(cy) {
            Http = new ActiveXObject("Msxml2.XMLHTTP");
        }
    } else if (window.XMLHttpRequest) {
        Http = new XMLHttpRequest();
    }
    Http.onreadystatechange = BuildFind;
    Http.open('GET', strUrl, true);
    Http.send(null);
    return;
};
function cglan() {
    if (tlan == 'en') {
        addCookie('lan', 'cn', 720);
    } else {
        addCookie('lan', 'en', 720);
    }
    delCookie('Type');
    delCookie('pno');
    delCookie('PNOs');
    delCookie('cat');
    scrollTo(0, 0);
    window.location.reload();
}
function $(e) {
    return document.getElementById(e);
}
function enHTML(source) {
    source = source.replace(/&/g,'&amp;');
    source = source.replace(/ /g,'&nbsp;');
    source = source.replace(/</g,'&lt;');
    source = source.replace(/>/g,'&gt;');
    source = source.replace(/"/g,'&quot;');
    source = source.replace(/'/g,'&#39;');
    return source;
};
function bbc(Str){
    Str = Str.replace(/\r\n/ig, '<br />');
    Str = Str.replace(/\n/ig, '<br />');
    Str = Str.replace(/\[quote\](.*?)\[\/quote\]/ig, '<span class="quote">$1</span>');
    Str = Str.replace(/\[b\](.*?)\[\/b\]/ig, '<b>$1</b>');
    Str = Str.replace(/\[i\](.*?)\[\/i\]/ig, '<i>$1</i>');
    Str = Str.replace(/\[u\](.*?)\[\/u\]/ig, '<u>$1</u>');
    Str = Str.replace(/\[url=http:\/\/(.*?)\](.*?)\[\/url\]/ig, '<a href="http://$1" target="_blank">$2</a>');
    Str = Str.replace(/\[url=(.*?)\](.*?)\[\/url\]/ig, '<a href="http://$1" target="_blank">$2</a>');
    Str = Str.replace(/\[url\]https:\/\/(.*?)\[\/url\]/ig, '<a href="https://$1" target="_blank">https://$1</a>');
    Str = Str.replace(/\[url\]http:\/\/(.*?)\[\/url\]/ig, '<a href="http://$1" target="_blank">http://$1</a>');
    Str = Str.replace(/\[url\](.*?)\[\/url\]/ig, '<a href="http://$1" target="_blank">$1</a>');
    Str = Str.replace(/\[img\](.*?)\[\/img\]/ig, '<a href="$1" onclick="return hs.expand(this)"><img src="$1" title="'+itle+'" /></a>');
    Str = Str.replace(/\[size=(.*?)\](.*?)\[\/size\]/ig, '<span style="font-size:$1px;">$2</span>');
    Str = Str.replace(/\[color=(.*?)\](.*?)\[\/color\]/ig, '<span style="color:$1;">$2</span>');
    return Str;
}
function mov(T) {
    if (Divr) {
        if (Divr == T) {
            return;
        }
    }
    T.className = 'mov';
    return;
}
function mou(T) {
    T.className = 'mou';
    return;
}
function up20() {
    var tmp = document.documentElement.scrollTop + document.body.scrollTop - 20;
    if (!window.XMLHttpRequest) {
        tmp -= 30;
    }
    $('read').style.top = tmp + 'px';
    location.href = "#read";
}
function InText() {
    Divr.id = 'view';
    Divr.getElementsByTagName('span')[0].innerHTML = bbc(enHTML(Text));
    Divr.className = 'intext';
    Divr.title = '';
    location.href = "#view";
    up20();
    return;
}
function onc(T, D) {
    if (Divr) {
        if (Divr == D) {
            return;
        }
        Divr.getElementsByTagName('span')[0].innerHTML = sTmp;
        Divr.title = tile;
        Divr.id = '';
    }
    sTmp = D.getElementsByTagName('span')[0].innerHTML;
    D.getElementsByTagName('span')[0].innerHTML = 'Loading...';
    Divr = D;
    _run = 'InText();';
    GetHttp(dir + T);
    return;
}
function Blinks() {
    var Ls = Text.split('\n');
    var Ltp = '';
    for (i = 0; i < Ls.length; i++) {
        Ltp += '<a href="' + Ls[i].split('|')[1] + '" title="' + Ls[i].split('|')[2] + '" target="_blank">' + Ls[i].split('|')[0] + '</a>';
    }
    $('links').innerHTML = '<p class="title">' + lK + '</p>' + Ltp;
    $('styles').innerHTML = sK;
    return;
}
function pLists(Pst, Pen) {
    $('pagenavi').innerHTML = '';
    for (i = Pst; i < Pen + 1; i++) {
        if (nPage == i) {
            $('pagenavi').innerHTML += '<span class="current">' + i + '</span>';
        } else {
            $('pagenavi').innerHTML += '<a href="javascript:Pals(' + i + ');">' + i + '</a>';
        }
    }
    $('pagenavi').innerHTML = '<div class="wp-pagenavi"><a href="javascript:Pals(1);" title="' + tf + '" class="first">«</a>' + $('pagenavi').innerHTML + '<a href="javascript:Pals(' + Patals + ');" title="' + tl + '" class="last">»</a><a href="javascript:change();" title="' + tpm + '" class="mode">' + pmode + '</a></div>';
    return;
}
function Pls() {
    var sT = nPage - 4;
    var sP = nPage + 4;
    if (sT < 1) {
        sT = 1;
    }
    if (sP > Patals) {
        sP = Patals;
    }
    pLists(sT, sP);
    return
}
function Rols(e, max) {
    for (i = e; i < max; i++) {
        if (getcookie('cat') != 'all') {
            sTmp += '<div class="line"></div><div title="' + tile + '" onmouseover="javascript:mov(this);" onmouseout="javascript:mou(this);" onclick="javascript:onc(\'' + cIndex[i].split('|')[0] + '\',this);" class="cont"><p>' + cIndex[i].split('|')[1] + '</p><span></span><div class="pdata"><a href="javascript:Cat(\'' + cIndex[i].split('|')[2] + '\');">' + cIndex[i].split('|')[2] + '</a>/' + cIndex[i].split('|')[3] + '</div></div>';
        } else {
            sTmp += '<div class="line"></div><div title="' + tile + '" onmouseover="javascript:mov(this);" onmouseout="javascript:mou(this);" onclick="javascript:onc(\'' + Txtsp[i].split('|')[0] + '\',this);" class="cont"><p>' + Txtsp[i].split('|')[1] + '</p><span></span><div class="pdata"><a href="javascript:Cat(\'' + Txtsp[i].split('|')[2] + '\');">' + Txtsp[i].split('|')[2] + '</a>/' + Txtsp[i].split('|')[3] + '</div></div>';
        }
    }
    $('main').innerHTML = sTmp;
    sTmp = '';
    if (Lks != 1) {
        _run = 'Blinks();';
        GetHttp(dir + 'links.d');
        Lks = 1;
    }
    return;
}
function Pals(Pno) {
    scrollTo(0, 0);
    sTmp = '';
    $('main').innerHTML = 'Loading...';
    Divr = '';
    Patals = parseInt((total - 1) / maxls);
    Parems = (total - 1) % maxls;
    if (Parems != 0) {
        Patals += 1;
    }
    Loop = (Pno * maxls) + 1;
    Sloop = Loop - maxls;
    if (Pno == Patals) {
        if (Parems != 0) {
            Loop = Sloop + Parems;
        }
    }
    Rols(Sloop, Loop);
    nPage = Pno;
    Pls();
    addCookie('PNOs', Pno, 1);
    addCookie('Type', '0', 24);
    return;
}
function pList(Pst, Pen) {
    $('pagenavi').innerHTML = '';
    for (i = Pst; i < Pen + 1; i++) {
        if (nPage == i) {
            $('pagenavi').innerHTML += '<span class="current">' + i + '</span>';
        } else {
            $('pagenavi').innerHTML += '<a href="javascript:Page(' + i + ');">' + i + '</a>';
        }
    }
    $('pagenavi').innerHTML = '<div class="wp-pagenavi"><a href="javascript:Page(1);" title="' + tf + '" class="first">«</a>' + $('pagenavi').innerHTML + '<a href="javascript:Page(' + Patal + ');" title="' + tl + '" class="last">»</a><a href="javascript:change();" title="' + tlm + '" class="mode">' + lmode + '</a></div>';
    return;
}
function Pl() {
    var sT = nPage - 4;
    var sP = nPage + 4;
    if (sT < 1) {
        sT = 1;
    }
    if (sP > Patal) {
        sP = Patal;
    }
    pList(sT, sP);
    return;
}
function Page(Pno) {
    scrollTo(0, 0);
    sTmp = '';
    $('main').innerHTML = 'Loading...';
    Divr = '';
    Patal = parseInt((total - 1) / maxl);
    Parem = (total - 1) % maxl;
    if (Parem != 0) {
        Patal += 1;
    }
    Loop = (Pno * maxl) + 1;
    Sloop = Loop - maxl;
    if (Pno == Patal) {
        if (Parem != 0) {
            Loop = Sloop + Parem;
        }
    }
    Rota(Sloop, Loop);
    nPage = Pno;
    Pl();
    addCookie('pno', Pno, 1);
    addCookie('Type', '1', 24);
    return;
}
function Rota(i, max) {
    Sloop = i + 1;
    if (Sloop > max) {
        $('main').innerHTML = bbc(sTmp);
        sTmp = '';
        if (Lks != 1) {
            _run = 'Blinks();';
            GetHttp(dir + 'links.d');
            Lks = 1;
        }
        return;
    }
    _run = 'Deal();';
    if (getcookie('cat') != 'all') {
        GetHttp(dir + cIndex[i].split('|')[0]);
    } else {
        GetHttp(dir + Txtsp[i].split('|')[0]);
    }
    return;
}
function mText(str,leng) {
    str=str.replace(/\[.*?\]/ig, '');
    if (str.length>(leng+50)) {
        return str.substr(0, leng) + ' .....';
    }
    return str;
}
function Deal() {
    if (yInd) {
        //Text = mText(enHTML(Text),250);
        Text = enHTML(Text);
        if (getcookie('cat') != 'all') {
            //sTmp += '<div class="line"></div><div title="' + tile + '" onmouseover="javascript:mov(this);" onmouseout="javascript:mou(this);" onclick="javascript:onc(\'' + cIndex[(Sloop - 1)].split('|')[0] + '\',this);" class="cont"><p>' + cIndex[(Sloop - 1)].split('|')[1] + '</p><span>' + Text + '</span><div class="pdata"><a href="javascript:Cat(\'' + cIndex[(Sloop - 1)].split('|')[2] + '\');">' + cIndex[(Sloop - 1)].split('|')[2] + '</a>/' + cIndex[(Sloop - 1)].split('|')[3] + '</div></div>';
            sTmp += '<div class="line"></div><div title="' + tile + '" class="cont"><p>' + cIndex[(Sloop - 1)].split('|')[1] + '</p><span>' + Text + '</span><div class="pdata"><a href="javascript:Cat(\'' + cIndex[(Sloop - 1)].split('|')[2] + '\');">' + cIndex[(Sloop - 1)].split('|')[2] + '</a>/' + cIndex[(Sloop - 1)].split('|')[3] + '</div></div>';
        } else {
            //sTmp += '<div class="line"></div><div title="' + tile + '" onmouseover="javascript:mov(this);" onmouseout="javascript:mou(this);" onclick="javascript:onc(\'' + Txtsp[(Sloop - 1)].split('|')[0] + '\',this);" class="cont"><p>' + Txtsp[(Sloop - 1)].split('|')[1] + '</p><span>' + Text + '</span><div class="pdata"><a href="javascript:Cat(\'' + Txtsp[(Sloop - 1)].split('|')[2] + '\');">' + Txtsp[(Sloop - 1)].split('|')[2] + '</a>/' + Txtsp[(Sloop - 1)].split('|')[3] + '</div></div>';
            sTmp += '<div class="line"></div><div title="' + tile + '" class="cont"><p>' + Txtsp[(Sloop - 1)].split('|')[1] + '</p><span>' + Text + '</span><div class="pdata"><a href="javascript:Cat(\'' + Txtsp[(Sloop - 1)].split('|')[2] + '\');">' + Txtsp[(Sloop - 1)].split('|')[2] + '</a>/' + Txtsp[(Sloop - 1)].split('|')[3] + '</div></div>';
        }
        Text = '';
        Rota(Sloop, Loop);
        return;
    } else {
        Txtsp = Text.split('\n');
        total = Txtsp.length;
        Cate = Txtsp[0].split('|');
        $('right').innerHTML += '<div id="menu"><p class="title">' + cae + '</p><a href="javascript:noCat(this);" class="cur" >' + al + ' (' + (total - 1) + ')</a></div><div id="links"></div><div id="styles"></div>';
        for (i = 0; i < Cate.length; i++) {
            var e = 0;
            for (s = 1; s < total; s++) {
                if (Txtsp[s].split('|')[2] == Cate[i]) {
                    e += 1;
                }
            }
            $('menu').innerHTML += '<a href="javascript:Cat(\'' + Cate[i] + '\');">' + Cate[i] + ' (' + e + ')</a>';
        }
        yInd = '1';
        addCookie('pno', 1, 24);
        addCookie('PNOs', 1, 24);
        addCookie('cat', 'all', 24);
        if (getcookie('Type') == '1') {
            Page(parseInt(getcookie('pno')));
        } else {
            Pals(parseInt(getcookie('PNOs')));
        }
        return;
    }
}
function info() {
    var ifo = Text.split('\n');
    document.title = ifo[0] + ' - ' + document.title;
    $('logo').innerHTML = '<span class="name">' + ifo[0] + '</span><span class="desc">' + ifo[1] + '</span>';
    $('nav').innerHTML = nv + '<a href="javascript:cglan();" class="lan">' + Lan + '</a>';
    $('right').innerHTML = '<div id="pers"><img src="' + dir + 'profile.jpg"></img>' + ifo[2] + '</div>';
    if (!getcookie('Type')) {
        addCookie('Type', parseFloat(ifo[3]), 24);
    }
    maxl = parseFloat(ifo[4]);
    maxls = parseFloat(ifo[5]);
    _run = 'Deal();';
    GetHttp(dir+'index.d');
}
function Cat(C) {
    if (getcookie('cat') == C) {
        return;
    }
    scrollTo(0, 0);
    cIndex.length = 0;
    total = Txtsp.length;
    Divr = '';
    var e = 1;
    for (i = 1; i < total; i++) {
        if (Txtsp[i].split('|')[2] == C) {
            cIndex[e] = Txtsp[i];
            e += 1;
        }
    }
    total = cIndex.length;
    addCookie('cat', C, 1);
    if (getcookie('Type') == '1') {
        Page(1);
    } else {
        Pals(1);
    }
    var MenuA = $('menu').getElementsByTagName('a');
    for (i = 0; i < MenuA.length; i++) {
        if (MenuA[i].innerHTML.indexOf(C) != -1) {
            MenuA[i].className = 'cur';
        } else {
            MenuA[i].className = '';
        }
    }
    yAb = '';
    return;
}
function noCat(th) {
    if (getcookie('cat') == 'all') {
        return;
    }
    scrollTo(0, 0);
    total = Txtsp.length;
    Divr = '';
    addCookie('cat', 'all', 24);
    if (getcookie('Type') == '1') {
        Page(1);
    } else {
        Pals(1);
    }
    var MenuA = $('menu').getElementsByTagName('a');
    for (i = 1; i < MenuA.length; i++) {
        MenuA[i].className = '';
    }
    MenuA[0].className = 'cur';
    yAb = '';
    return;
}
function change() {
    scrollTo(0, 0);
    Divr = '';
    if (getcookie('cat') != 'all') {
        addCookie('pno', 1, 24);
        addCookie('PNOs', 1, 24);
    }
    if (getcookie('Type') == '1') {
        Pals(parseInt(getcookie('PNOs')));
    } else {
        Page(parseInt(getcookie('pno')));
    }
    return;
}
function home() {
    if (yAb != '1') {
        return;
    }
    scrollTo(0, 0);
    $('left').innerHTML = sTmp;
    sTmp = '';
    yAb = '';
    return;
}
function InAbout() {
    $('left').innerHTML = bbc(Text);
    Abou = $('left').innerHTML;
    Text = '';
}
function about() {
    if (yAb == '1') {
        return;
    }
    scrollTo(0, 0);
    if (Divr) {
        Divr.getElementsByTagName('span')[0].innerHTML = sTmp;
        Divr.title = tile;
        Divr.id = '';
        Divr = '';
    }
    sTmp = $('left').innerHTML;
    $('left').innerHTML = 'Loading...';
    yAb = '1';
    if (Abou) {
        $('left').innerHTML = Abou;
        return;
    }
    _run = 'InAbout();';
    GetHttp(dir + 'about.d');
    return;
}
