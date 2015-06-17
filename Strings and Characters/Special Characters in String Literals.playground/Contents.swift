//: Special Characters in String Literals


/*:
  Swift String 一些特殊的转义字符(escaped special characters)
  * \0 null character
  * \\ backslash 
  * \t horizontal tab
  * \n line feed
  * \r carriage return 
  * \“ double quote
  * \‘ single quote
*/

//实例如下：

//\" 转义成双引号
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

//美元符号 \u 就是unicode Scalars U+xxxx
let dollarSign = "\u{24}"

//黑桃
let blackHeart = "\u{2665}"

//红色的心形图标
let sparklingHeart = "\u{1F496}"