//: Playground - noun: a place where people can play

import UIKit

class MyClass{
  //这和书中 For classes, you can define computed type properties only 相悖！
  //谁知道请告诉我
  static var storedClassProp = "Hey It's My class"
  //这个是可以重载的 要用class 关键字修饰
  class var computedTypeProp : Int {
    return 1
  }
}
class SubMyClass:MyClass{
  //static var storedClassProp = "lalalala"//报错为Cannot override with stored property ''
  override class var computedTypeProp : Int {
    return 2    //重写了不会报错
  }
  
}

MyClass.storedClassProp

MyClass.computedTypeProp

SubMyClass.computedTypeProp

SubMyClass.storedClassProp