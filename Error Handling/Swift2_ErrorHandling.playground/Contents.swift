import UIKit


//:环境要求：swift2.0 Xcode7
//:作者：PMST 博客地址:[optional Swift](http://blog.csdn.net/colouful987)


/*:
  # 实例一：自动贩卖机
*/

//请求出错情况有三种： 1.无效的选择 2.钱不够(差多少就是required参数) 3.无现货 售罄
enum VendingMachineError:ErrorType{
  case InvalidSelection
  case InsufficientFunds(required:Double)
  case OutOfStock
}

//单个商品
struct Item {
  var price: Double   //价格
  var count:Int       //数量
}


//存货清单 字典类型 [String:Item] 其中Item 为自定义结构体用于描述商品
var inventory = [
    "Candy Bar":Item(price: 1.25, count: 7),
    "Chips":Item(price: 1.00, count: 4),
    "Pretzels":Item(price: 0.75, count: 11)
    ]

//手头的资金
var amountDeposited = 1.00

//--> 函数
/*:
  throws 函数用法，以下函数名字很直观就知道能否抛出错误，至于函数取名 只为形象说明。
  func cannotThrowErrors()-> String   这是正常的函数声明，且这类声明方式绝对不会抛出错误
  func canThrowErrors() throws -> String  这种函数才是能够抛出错误的，声明方式为(->) 之前写一个关键字throws即可
*/

//购物
func vend(itemNamed name:String) throws{
  
  //通过商品名从清单(字典)中获取商品，假如我要的东西不存在贩卖机里 那么就要抛出错误，错误如下
  guard var item = inventory[name] else{
    //抛出错误：无效的选择
    throw VendingMachineError.InvalidSelection
  }
  //判断该商品的数量是否大于0
  guard item.count > 0 else{
    //抛出错误 售罄
    throw VendingMachineError.OutOfStock
  }
  
  //到这里表明选择的商品存在 且还有余货  起码有一件
  //判断我的钱(1块钱....) 是否够买一件商品
  if amountDeposited >= item.price{
    
    //OK 钱够了 买一件
    amountDeposited -= item.price //买了商品就要扣钱
    --item.count                  //贩卖机的商品数量减一
    inventory[name] = item        //更新贩卖机购买商品信息
  }else{
    //很遗憾 钱不够 看看还差多少
    let amountRequired = item.price - amountDeposited
    throw VendingMachineError.InsufficientFunds(required: amountRequired)
  }
}

//:上面定义完毕 可以看到我们 定义了具有抛出错误的函数 func vend(itemNamed name:String) throws{}
//:那么接下来必定是调用，使用关键字 try ，写在函数名前面即可，形如： try funcName()
//:具体实例代码如下

//类型字典 [String:String] -> [人：各自喜欢的食物]
let favoriteSnacks = [
  "Alice":"Chips",
  "Bob":"Licorice",
  "Eve": "Pretzels",
]
/*:
* brief:这同样是一个能够抛出错误的函数 看throws关键字就一目了然
* para: preson->购买点心的人名
* return: none
*/
func bugFavoriteSnack(person:String) throws{
  //一样的道理 通过人名字来获取其喜欢的食物 假如人名不存在 那么默认是Candy Bar 注：??是解包的一种 自行了解
  let snackName = favoriteSnacks[person] ?? "Candy Bar"
  
  //OK 调用能够抛出错误的函数 要用try关键字
  try vend(itemNamed: snackName)
}


//:搞了一大堆 还是只是在定义 不过可以发现是从最底层(贩卖机)写起，直到定义购买的一个动作
//:捕获 和 处理 错误下文给出


/*:
  do{
    try funcition that throws
    statements
  }catch pattern{
    statements
  }
*/
//暂时先不用管上面的写法 直接实例 看完一目了然

do{
  try vend(itemNamed: "Candy Bar")
  print("购买成功 好吃极了")
}catch VendingMachineError.InvalidSelection{
  print("没有这个商品")
}catch VendingMachineError.OutOfStock{
  print("没货了")
}catch VendingMachineError.InsufficientFunds(let amountRequired){
  //这里可能有点迷惑  let amountRequired 参数其实用来捕获到底差多少钱 显然这里会输出还差0.25元
  print("钱不够 还差\(amountRequired)")
}

//: 总结下 我们首先得do打头 然后 try一下函数(该函数一定要是能够抛出错误的，具有throws关键字)，然后catch一下
//: pattern 匹配的有三种错误 这里不一一列举了


//:说下强制try用法 即 try!  显然调用的function亦或是method 仍然必须一定是 throwing 型的
//:有点类似可选类型中的隐式解包，因为有时候我们明确知道某个throwing function or method 不会抛出错误
//:那么何必用catch 来捕获呢？ 你说是不是？因为你明确知道没有错误拉(当然是你主观认为)
//:以下是例子


enum someError:ErrorType{
  case Error1
}
//定义一个throwing function
func willOnlyThrowIfTrue(value:Bool) throws{
  if value{ throw someError.Error1} //你看把错误抛出了 仅当value = true的时候才抛出
}

//这种写法很安全
do{
  try willOnlyThrowIfTrue(false)    //显然这个try 一下 是没有错误的
}catch{
  // 处理错误
}

//我自认为这个函数绝对不会出现错误 那么用try!即可
try! willOnlyThrowIfTrue(false)



//: defer 用法 应该其他语言已经具有了 起码我学go语言的时候就存在了
//给出例子 下面是示意代码 不能运行

/*
  func processFile(filename:String) throws{
    if exists(filename){
      let file = open(filename)
      defer{
        close(file)
      }
      while let line = try file.readline(){
        //具体如何操作文件
      }
      //close(file) 在这里会被调用 当然是在这个作用于喽！
    }
  }
*/

func lookforSomething(name:String) throws{
  
  //这里是作用域1 整个函数作用域
  
  print("1-1")
  if name == ""{
    //这里是作用域2 if的作用域
    print("2-1")
    defer{
      print("2-2")
    }
    print("2-3")
  }
  print("1-2")
  defer{
    print("1-3")
  }
  print("1-4")
  
  if name == "hello"{
    //作用域3
    print("3-1")
    defer{
      print("3-2")
    }
    print("3-3")
    defer{
      print("3-4")
    }
  }
}

//有兴趣的看看依次输出什么

//try! lookforSomething("")
//调出 debug Area 快捷键 shift+ command + y
try! lookforSomething("hello")


























