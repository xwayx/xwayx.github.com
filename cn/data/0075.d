挂起（suspend）和休眠（hibernate）是两个易混淆的词。

因为要解释他俩的区别，还是要用到 suspend 这个词。

通常，挂起指 suspend to ram（s2r），而休眠指 suspend to disk（s2d）。

suspend 是挂起到内存，停止大部分设备的供电，只保留内存和部分必要设备的供电，使整个系统处于低能耗状态，通常敲下键盘就能唤醒了，在 windows 下中文叫待机。

hibernate 是挂起到硬盘，即把内存中的内容写入到硬盘，然后关机，下次开机直接从硬盘恢复之前使用中的状态，在 windows 下中文叫睡眠。