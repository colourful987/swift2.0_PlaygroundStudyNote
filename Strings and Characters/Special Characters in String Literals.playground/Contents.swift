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

//以下是4.8号的String.Index更新 稍作补充
let greeting = "Guten Tag"

//:要知道眼前C 或者其他语言 对于String类型字符串，你可能把它当做数组
//:想要获取一个字符串中的某个字符,比如,"Hello",str[1]取到'e'
//:但是要知道Unicode编码(想想中文),存储在内存中的位置可不同，因此swift搞了一个Index
//:用于索引字符串中字符的位置
//注意startIndex=0 是表示G 但是endIndex = 9 可不是'g'而是指这个字符串尾部
print(greeting.startIndex)
print(greeting.endIndex)

greeting[greeting.startIndex.successor()]//startIndex 是指向了字符串第0号位置,而successor是追踪下一个，即指向下一个
greeting[greeting.endIndex.predecessor()]//endIndex 是指向字符串结尾，而predecessor是追踪前一个，即指向前一个
//advance自定义位置 通过定义头 移动x个位置来指向目标地址
var index = advance(greeting.startIndex, 4)
greeting[index]

//: > 这里会报错 都已经结尾了 不可能是指向尾部的尾部吧
//greeting.endIndex.successor()

//: ### 遍历字符串
//注意indices方法来创建一个Range 用以前swift1.2是indices(xxx)
for index in greeting.characters.indices {
  print(" \(greeting[index]) ")
}
//print("\n")

//字符插入
var welcome = "hello"
welcome.endIndex
welcome.insert("!", atIndex: welcome.endIndex)
//字符串拼接
//这里有问题 可能是因为string不在遵循CollectionType引起的
//welcome.splice("there",atIndex: welcome.endIndex.predecessor())


