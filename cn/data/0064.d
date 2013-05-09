[quote]<script language="JavaScript">
<script type="text/javascript">
<script>[/quote]
这三个标签的使用有什么区别？
[quote]为了保证脚本程序可以正常执行，除非特意使用仅 IE 支持的 VBScript 和 Script Encoder 机制外，应当将 SCRIPT 标记的 "type" 属性设置为 "javascript"，并且不要设置已经废弃的 "Languange" 属性。[/quote]
各浏览器对于 "type" 和 "language" 属性本身均支持，但是对于其中设置的脚本语言类型识别与支持各异：
[quote]
"type" 和 "language" 同时存在时，所有浏览器均优先识别 "type" 属性内的脚本类型；

其中 IE 浏览器实际支持 JScript 和 VBScript 脚本语言标示以及 Script Encoder 加密；

Firefox Chrome Safari Opera 对 "type" 属性值的具体识别宽容度不一致，相对 Chrome Safari 对属性值正确性校验更加宽松，Firefox 的校验最为严格；

在 "Language" 属性值识别宽容度比较中，各浏览器中 Chrome Safari 依然最为宽松，IE 最为严格，Firefox 与 Opera 持平；

Language Encode 比较中，只有 IE 支持 JScript.Encoder 以及 VBScript.Encoder 类型设置，Firefox Chrome Safari均不支持，Opera 中则是该属性值被修复为默认的 Javascript 脚本语言后才有输出值。[/quote]