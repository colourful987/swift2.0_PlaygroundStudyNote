//:Do Statement Swift2.0语法改动 代码

//:环境要求：swift2.0 Xcode7.0

import UIKit

//:语法书写格式如下
/*:
  do{
    try expression
    statements
  }catch pattern 1{
    statements
  }catch pattern 2 where condition{
    statements
  }
*/

//:示例代码在Error Handling 一章

enum MachineError:ErrorType{
  case NoTheOne //你要找的车不存在
  case HasNoGas //没汽油
  case Broken   //坏了
}

//定义一辆车
struct Car {
  var gas:Double     //油量
  var state:Bool     //维修状态  true 表示正常 false 表示维修
}

var cars = [
            "pmst":Car(gas: 0, state: false),   //没汽油 而且在维修
            "Jim":Car(gas: 10.0, state: true),  //汽油充足 而且正常
            "Star":Car(gas: 10.0, state: false) //汽油重组 但在维修
            ]


//开车
func DriveMachine(carOwnerd name:String)throws{
  //首先查找是否存在这辆车 即从字典中通过key值查找
  guard let car = cars[name]else{
    throw MachineError.NoTheOne
  }
  
  //找到该车之后 检查车的状态 是否在维修
  guard car.state else{
    throw MachineError.Broken
  }
  //车辆正常使用中  检查油量
  if car.gas == 0.0{
    throw MachineError.HasNoGas
  }else{
    //print("路途愉快")
  }
}
//ok 来学习下do 语法
do{
  try DriveMachine(carOwnerd: "Star")   //会打印车坏了
  print("路途愉快")
}catch MachineError.NoTheOne{
  print("没有该车")
}catch MachineError.Broken{
  print("车坏了")
}catch MachineError.HasNoGas{
  print("没汽油")
}catch _ {
  print("未知错误")
}

// 一些未知错误 用下划线 _ 笼统表示即可

//:总结：do statement 语法

// do-statement  -> do code-block catch-clauses(可选，即可有可无)
// catch-clauses -> catch-clause catch-clauses(可选)
// catch-clause  -> catch pattern(可选) where-clause(可选) code-block




