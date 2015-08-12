//: Playground - noun: a place where people can play

import UIKit

//: #环境要求swift2.0 Xcode7 beta5

//: ##改动一:现在所有类型都遵循ErrorType协议了

/*
  注意到ErrorType 协议是一个空协议 声明如下
  protocol ErrorType{
    /// 该协议为空协议 不难理解为什么任何类型都遵循它了
  }
*/
enum VendingMachineError:ErrorType{
  case InvalidSelection
  case InsufficientFunds(centsNeeded:Int)
  case OutOfStock
}



//: ##改动二: 子类能够在不可失败初始化构造器中override父类的可失败初始化构造器 有点拗口

// 定义一个文件夹 父类
class Document{
  var name : String?
  
  /// 空的初始化构造器  name默认值=nil
  init(){}
  
  /// 该初始化构造器是一个可失败构造器
  /// 假如传入空字符串"" 为失败return nil
  init?(name:String){
    self.name = name
    if name.isEmpty{return nil}
  }
}

// 定义一个Document的子类AutomaticallyNamedDocument
// 子类override父类的两个初始化构造器init()和init?(name:)
// 子类实例中的name属性再没有值或值等于空字符串情况下
// 设定为[Untitled] 请看以下代码

class AutomaticallyNamedDocument:Document{
  /// 重写 父类的空初始化函数
  override init(){
    super.init()
    self.name = "[Untitled]"
  }
  
  /// 该初始化构造器非可失败 这个nonfailable initializer
  /// 重写了父类的可失败构造器
  /// 由于我们调用了super.init() 空构造器 因此name = nil
  /// 通过判断name是否为空字符串再进一步的赋值
  override init(name: String) {
    super.init()
    if name.isEmpty{
      self.name = "[Untitled]"
    }else{
      self.name = name
    }
  }
}

//: 当然我们也可以通过重写init()方法 再改方法内重写可失败构造器 但需要强制解包
/* 只有在Xcode7最新版本才能使用
class UntitlesDocument:Document{
  
  override init() {
    /// 可以看到这里绝壁不会失败 因为我们传入了字符串非空
    /// 此外注意这里需要Xcode7 beta5了应该
    super.init(name: "[Untitled]")!
  }
}
*/


//: ##改动三：枚举中cases of Any Type . 枚举中cases 可以存储任何类型的值关联起来

enum Number{
  case Integer(Int) //关联了Int类型
  case Real(Double) //关联了Double
}

// Enumeration cases that store associated values can be used as functions that create instances of the enumeration with the specified associated values.
// 官方文档的意思就是类似这种关联了值的枚举，可以被当做函数function使用 详细请看例子

let f = Number.Integer    //f 可以当成是一个函数(闭包).... 类型是(Int)->Number

let evenInts:[Number] = [0,2,4,6].map(f)  //同样这个也是需要新版本Xcode7才能使用的

//: ##改动四:Explicitly referencing an initializer
class SomeSuperClass{
  //父类的初始化方法
  init(){
  
  }
}

class SomeSubClass:SomeSuperClass{
  override init() {
    //!! 先初始化子类的所有元素
    /*  这里进行子类初始化行为 */
    
    super.init()//再调用父类的
  }
}
//要知道String里有一个init函数 init(value:Int){} 返回一个String类型
let stringInt = String(3)//print "3"
let initializer:Int->String = String.init

//输出["1","2","3"]
let oneTwoThree = [1,2,3].map(initializer)
let joinString = oneTwoThree.reduce("", combine: +)//"123"

//： 如果你想看map filter reduce函数的揭秘 可以看我的最新文章[map](http://blog.csdn.net/colouful987/article/details/47254397) [filter](http://blog.csdn.net/colouful987/article/details/47254403) [reduce](http://blog.csdn.net/colouful987/article/details/47271245)


//: 使用明确的init函数来初始化

class SomeType{
  var data:Int
  init(data:Int){
    self.data = data
  }
}
let s1 = SomeType.init(data: 3) //没问题
let s2 = SomeType(data:1)  //没问题

/*官方例子
let s4 = someValue.dynamicType(data: 5)       // Error
let s3 = someValue.dynamicType.init(data: 7)  // Valid
*/


//: ##改动五：构建配置语句

//: [官方示例请点击这里](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Statements.html#//apple_ref/doc/uid/TP40014097-CH33-ID538)

// 和if语法不通 #if-endif 只是在编译器编译时候运行 是compile time执行 而不是run time

/*:
  Function | Valid arguments
  :------- | :-------------:
  os()     | OSX, iOS, watchOS
  arch()   | i386, x86_64, arm, arm64
*/


//: ##改动六 MetaType Type

class SomeBaseClass{
  //类型属性
  class func printClassName(){
    print("SomeBaseClass")//class 关键字修饰 可以让子类去重写这个类方法
  }
}

class SomeSubNewClass:SomeBaseClass{
  //重写类型method
  override class func printClassName(){
    print("SomeSubClass")
  }
}

let someInstance:SomeBaseClass = SomeSubNewClass()
SomeSubClass.self //等同于SomeSubClass.Type
// someInstance is of type SomeBaseClass at compile time, but
// someInstance is of type SomeSubClass at runtime
someInstance.dynamicType.printClassName()
// prints "SomeSubClass"

// 其中dynamicType 可以获取到runtime时候实例的类型



