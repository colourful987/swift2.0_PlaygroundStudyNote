
//:本章学习swift2.0中新增的protocol extension 功能

//:运行环境:Xcode7 and Swift2.0


//声明一个协议 要求实现random method
protocol RandomNumberGenerator{
  func random() -> Double
}

//对改协议扩展 产生一个Bool 也算随机吧
extension RandomNumberGenerator{
  func randomBool()->Bool{
    return random() > 0.5
  }
}

//定义一个类
//线性等分产生随机数字类 该类遵循上述协议 必须实现random函数
class LinearCongruentialGenerator:RandomNumberGenerator{
  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 29573.0
  
  //协议实现 不用明白该算法 只要知道会生成一个[0,1)的伪随机数
  func random() -> Double{
    lastRandom = ((lastRandom * a + c) % m)
    return lastRandom / m
  }
}

//:下面为执行部分

let generator = LinearCongruentialGenerator() //实例化一个线性等分产生随机数实例

print("Here's a random number:\(generator.random())")
//prints "here's a random number:0.37464991998171"

print("And here's a random Boolean:\(generator.randomBool())")
//prints "And here's a random Boolean:true"
