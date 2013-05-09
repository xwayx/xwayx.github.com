缺省配置下，用 Ubuntu 的文本编辑器（gedit）打开 GB18030/GBK/GB2312 等类型的中文编码文本文件时，将会出现乱码。

出现这种情况的原因是，gedit 使用一个编码匹配列表，只有在这个列表中的编码才会进行匹配，不在这个列表中的编码将显示为乱码。您要做的就是将 GB18030 加入这个匹配列表。

命令行方式，适用于所有 Ubuntu 用户。
复制以下命令到终端中，然后回车即可：

gconftool-2 --set --type=list --list-type=string /apps/gedit-2/preferences/encodings/auto_detected "[UTF-8,CURRENT,GB18030,BIG5-HKSCS,UTF-16]"

图形化方式，适用于 Ubuntu 用户，而不适用于 KUbuntu/XUbuntu 用户。
您可以遵循以下步骤，使您的 gedit 正确显示中文编码文件。

按下 Alt-F2，打开“运行应用程序”对话框。
在文本框中键入“gconf-editor”，并按下回车键，打开“配置编辑器”。
展开左边的树节点，找到 /apps/gedit-2/preferences/encodings 节点并单击它。
双击右边的 auto_detected 键，打开“编辑键”对话框。
单击列表右边的“添加”按钮，输入“GB18030”，单击确定按钮。
列表的最底部新增加了一个“GB18030”。单击选中它，并单击右边的 “向上” 按钮直到 “GB18030” 位于列表的顶部为止。
单击确定按钮，关闭配置编辑器。
现在，您的 gedit 应该能够顺利打开 GB18030 编码的文本文件了。
