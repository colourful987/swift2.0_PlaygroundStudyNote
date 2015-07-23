//: Playground - noun: a place where people can play

import UIKit

//: 该例从swift 出道就一直存在，应该不陌生，此次官方对该章节进行了少许改动
//: 特别强调了如何利用闭包获取上下文 常量和变量。

//: 定义函数makeIncrementer 从函数名字可知该函数的主要作用为累加器 但是可以明确一次应该加多少(amount)

func makeIncrementer(forIncrement amount:Int) -> Void -> Int {
  /*
    @para:尽管有forIncrement amount两个变量，但实际只有一个传入参数，
          前者为外部变量，后者为内部变量。说白了引用该函数时是对外的，用
          到forIncrement,内部使用amount，这不难理解。
    @return:->Void->Int,写成->(Void->Int)可能更好理解，要知道(Void->Int)
          是一个闭包，该闭包无须传入参数 所以声明为Void,返回Int类型结果值。
  */
  //============================================================
  
  //** 函数主体声明 **
  var runningTotal = 0    //声明一个变量用作存储计算结果值
  
  //函数内部内嵌一个函数
  /*
    Q1: 为什么不在makeIncrementer外声明该函数
    A1: 在外部声明就无法捕获上面的runningTotal变量,这和变量的作用域有关，
        想要了解的朋友可以自行搜索。
    
    Q2: 这里的作用域简单介绍下
    A2: makeIncrementer()内部看做作用域A incrementer()看做作用域B
        B处于作用域A中，因此A中的变量runningTotal变量对于incrementer来说
        就是"全局变量"，所以可以捕获。反过来，作用域B是"私人的",makeIncrementer函数
        没有资格去获取incrementer作用域B中的变量！
  */
  func incrementer(_: Void)->Int{

    runningTotal += amount
    return runningTotal
  }
  /*
    incrementer 作为一个函数,传入参数为空 我这里用 _:Void 是为了更好的表示(实际上可以什么都不填)
    内嵌函数返回Int值。
    另一方面 闭包 = 函数，incrementer内嵌函数实际是满足闭包(Void->Int)类型的。
    所以最后我们返回incrementer理所当然。更多可以查看官方文档Function Type as Return Types
  */
  return incrementer
}

//: 讨论: makeIncrementer返回的闭包 可以说是对内嵌函数incrementer()函数引用，
//: 此外incrementer又对runningTotal直接关联，如此三者之间形成了一张网，你不妨自己动手在纸上梳理下关系。

//: 使用上面定义的函数 实战

//这个累加器是以10为单位累加的，一次+10. 
//此外这个可是一个闭包(函数)，假如要调用该闭包直接再后面添加括号‘()’即可！
let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()  //执行函数 返回10 这时候runningtotal = 10
incrementByTen()  //执行函数 返回20 这时候runningtotal = 20
incrementByTen()  //执行函数 返回30 这时候runningtotal = 30

//再声明另外一个累加器 但是步长为7
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()  //执行函数 返回7
incrementByTen()    //执行前一个累加器 返回40


//可见两个累加器 是独立的！


//: >原文的note:If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles. For more information, see Strong Reference Cycles for Closures.

//: 设想: 类A中有一个属性变量closure，它的类型是闭包，该闭包引用了类A中的其他属性，可能用作计算，可能用于组合。
//: 现在实例化类A,生成一个实例a.现在我们分配一个闭包给a中的闭包属性closure,这时候闭包和实例时间就产生一个强引用。
//: 具体请看Strong Reference Cycles for Closures








