    一、acpi suspend type (系统进入休眠的模式)

    1 s1(pos) 设定acpi省电模式为s1/pos (power on suspend)。(默认值)

    2 s3(str) 设定acpi省电模式为s3/str (suspend to ram)。

    二、power led in s1 state

    1 blinking power led在s1模式下，会以闪烁的方式呈现。(默认值)

    2 dual/off 设定此选项有两种情形：

    a. 如果您使用的是单色的power led，led会关掉。

    b. 如果您使用的是双色的power led，led则会变色。

    三、off by power button (关机方式)

    1 ins tant-off 按一下电源开关键便立即关闭电源。(默认值)

    2 delay 4 sec. 需按住电源开关键4秒后才会关闭电源。

    四、pme event wake up

    此功能要求您所使用的电源供应器供应的+5vsb电流至少需1安培以上。

    1 disabled 关闭电源管理事件唤醒功能。

    2 enabled 激活电源管理事件唤醒功能。(默认值)

    五、modemringon/wakeonlan (调制解调器开机/网络开机状态)

    当您购买的主机板有内建硬件wol插座，您可使用"modemringon/wakeonlan"或pme ev ent wake up"选项，激活/关闭wake on lan功能。当无此插座时，您可使用"pme ev ent wake up"激活/关闭wake on lan功能。

    1 disabled 不激活调制解调器开机/网络开机功能。

    2 enabled 激活调制解调器开机/网络开机功能。(默认值)

    六、resume by alarm (定时开机)

    将此选项设定为enabled并输入日期时间，让系统自动开机。

    1 disabled 不激活此功能。(默认值)

    2 enabled 激活此功能。

    若激活定时开机，则可设定以下时间：

    1 day of month alarm : ev ery day , 1～31

    2 time (hh: mm: ss) alarm : (0～23) : (0～59) : (0～59)

    七、power on by mouse (鼠标开机功能)

    1 disabled 关闭此功能。(默认值)

    2 double click 按两次ps/2鼠标左键开机。

    八、power on by keyboard (键盘开机功能)

    1 disabled 关闭此功能。(默认值)

    2 password 设定1-5个字符为键盘密码来开机。

    3 key board 98 设定windows 98键盘上的电源键来开机。

    九、kb power on password (键盘开机功能)

    当"power on by keyboard"设定在"passowrd"时，需在此选项设定密码。

    enter 自设1-5个字符为键盘开机密码并按enter键完成设定。

    十、ac back function (断电后，电源回复时的系统状态选择)

    1 soft-off 断电后即在关机状态，需按电源键才能重新激活系统。(默认值)

    2 full-on 电源回复时，立刻激活系统。

    3 memory 当电源回复时，恢复至系统断电前的状态。 
