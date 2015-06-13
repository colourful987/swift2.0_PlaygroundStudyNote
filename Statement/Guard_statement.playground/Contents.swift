//: Playground - noun: a place where people can play


//:a guard statement i used to transfer program control out of a scop if one or more conditions are meet.
//: 也就是类似if-else这种可以控制控制程序流程，当不满足一个或多个条件时，就执行else中的statments，此外condition的值必须遵循 BooleanType协议。


/*:
  语法格式：

  guard condition else{
    statements //当条件condition不满足时候就会执行这里
  }
*/

//:切记，在guard语法中 else 是必须的，倘若省略就会报错。
//:statements 中要么必须调用一个@noreturn属性修饰的函数，其他情况你起码要有 return break continue throw 4个中的一个！！！


//接下来是实例，由于官方文档没有给出，只能即兴来几个

//声明了一个车的结构体，车很简单，只有牌子和价格两个属性.
struct Car {
  var name:String
  var price:Double
}

//现在两个人 分别有名字 和 对应的车  其实就是一个字典
var peoples = [
    "machao":Car(name: "BenZ", price: 10000),
    "xingxing":Car(name: "BWM", price: 20000),
  ]



//通过名字来拿车
func GetCarByName(username name:String){
  guard let car = peoples[name] else{
    print("查无此人 无法提车！")
    
    return
    
  }
  print("有车为\(car)")
}

GetCarByName(username: "nihao")   //输出查无此人 无法提车
GetCarByName(username: "machao")  //输出machao的BenZ车

//上述实例理解起来很简单 由于通过键值来取得对应的元素 可能会不存在，这也是一个条件吧，在不满足情况下执行else里面内容 然后返回




