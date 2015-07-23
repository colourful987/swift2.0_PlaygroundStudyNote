//: Playground - noun: a place where people can play

import UIKit

//: Swift2.0 Xcode7 我的测试版本 beta4


//枚举的递归要用indirect关键字修饰


//你也可以将indirect关键字放到下面两个case前面 每边一个
//此外还要注意 用indirect修饰词必须修饰那些带有输入参数的enum值
indirect enum ArithmeticExpression{
  case Number(Int)
  /* indirect 放这里修饰也是可以的*/case Addition(ArithmeticExpression,ArithmeticExpression)
  case Multiplication(ArithmeticExpression,ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
  switch expression {
  case .Number(let value):
    return value
  case .Addition(let left, let right):
    return evaluate(left) + evaluate(right)
  case .Multiplication(let left, let right):
    return evaluate(left) * evaluate(right)
  }
}
// evaluate (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
// prints "18"


//: ###Enumerations with Cases of Any Type
enum Tree<T> {
  case Empty
  indirect case Node(value: T, left: Tree, right: Tree)
}


//:Implicitly Assigned Raw Values

//: #这里必须先注意枚举是怎么声明的 怎么一个格式
/*
enum (枚举名称): (rawValue 类型 比如Int String),(要遵循申明协议){
case 枚举情况1 = 原始值1(rawvalue 要和上面匹配)
case 枚举情况2 = 原始值2
}
*/
//: ###先看Int类型

//首先看下整型的一个枚举 如何定义和取到原始值
//依次是1 2 3 4 ...
enum Planet:Int{
  case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//取原始值 恩 还是很好理解的
let earthsOrder = Planet.Earth.rawValue
// earthsOrder is 3

//: ###Int类型另外一种情况
enum ExampleEnum:Int{
  case A,B,C = 5,D
}

var a = ExampleEnum.A.rawValue    //隐形地推断为0 B=1,C=2,而C=5是明确的 D=6是根据C推断的


//: ###String类型是怎么隐形推断的呢？

//定义了四个方位 东西南北 假如你是xcode7 beta4版本以下会报错 需要一个rawValue
enum CompassPoint: String {
  case North, South, East, West
}

//尝试用rawValue来获得枚举的原始值 隐形规定就是返回自身变量名称
let sunsetDirection = CompassPoint.West.rawValue
// sunsetDirection is "West"






