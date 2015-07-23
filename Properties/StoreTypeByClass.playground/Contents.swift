//: Playground - noun: a place where people can play

import UIKit

class MyClass{
  //这和书中 For classes, you can define computed type properties only 相悖！
  //早在swift1.2改动中就加入了class type properties的stored properties
  //因此书中是未修改的。
  static var storedClassProp = "Hey It's My class"
  //这个是可以重载的 要用class 关键字修饰
  class var computedTypeProp : Int {
    return 1
  }
  //用class 关键字可以重写 用static 表示只属于这个类的 不能被重写
  class func sayHello(){
    print("hello")
  }
}
class SubMyClass:MyClass{
  //static var storedClassProp = "lalalala"//报错为Cannot override with stored property ''
  override class var computedTypeProp : Int {
    return 2    //重写了不会报错
  }
  
  override class func sayHello(){
    print("hello maoxian")
  }
}

MyClass.storedClassProp

MyClass.computedTypeProp

SubMyClass.computedTypeProp

SubMyClass.storedClassProp
