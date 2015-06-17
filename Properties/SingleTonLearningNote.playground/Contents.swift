//: 单例模式学习笔记

//:测试环境Xcode7.0 + Swift2.0 以及一定的Swift基础

//从swift1.1的单例模式开始讲起
import UIKit

//首先定义一个类
class SingletonSwift11{
  static var storeTypeProperty = "store type" //这是类属性(type property)当中的 存储型类属性
  
  static var computedTypeProperty:Int{        //这是类属性(type property)当中的 计算型类属性
    return 1
  }
  class var overrideableComputedTypeProperty:Int{//可被继承的计算型类属性 class 关键字修饰
    return 107
  }
  //以上为类属性中的内容 你会发现变量仅仅只是值类型 如String Int 等 那么class呢？ 
  
  //swift1.1时候无法用static 来修饰class引用类型 所以那时候这么干
  class var sharedInstance:SingletonSwift11{
    //定义一个结构体 也是用struct + static 类属性来搞 包含两个属性
    //并且用了dispatch_once 来控制多线程环境值调用一次创建实例的代码
    struct Single{
      static var instance:SingletonSwift11?       //一个是SingletonSwift11 变量
      static var onceToken:dispatch_once_t = 0    //一个是产生的次数统计
    }
    //如此保证只执行一次 记住类属性就是值copy Type.parameter来调用 共享同一个东东
    dispatch_once(&Single.onceToken){
      Single.instance  = SingletonSwift11()       //初始化一次
    }
    
    return Single.instance!                       //将值返回即可
  }
}

//swift1.2中是这么干的

class SingletonSwift12{
  static let sharedInstance:SingletonSwift12 = SingletonSwift12()   //这样就可以了
  
  //那么有时候我们会用类方法来得到 写法如下
  class func generateSharedInstance()->SingletonSwift12{
    return sharedInstance   //直接把我们上面东西返回即可
  }
  var parameter:Int = 20
}

//主意 上面的均为类属性 所以调用时候必须用 Type.name 形式来获取类属性  
//如

var single =  SingletonSwift12.sharedInstance //就OK了
var single2 = SingletonSwift12.generateSharedInstance()

//两个都是SingletonSwift12实例 但是他们是指向一个的！不信 你可以打印

print(single.parameter)
single.parameter = 100      //来修改single 的parameter值
print(single2.parameter)    //你回发现single2也改变了 所以指向同一个实例

//thanks



