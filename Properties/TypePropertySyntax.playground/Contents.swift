//: Type Property Syntax


//类型属性(type properties) 结构体、枚举中使用static关键字来定义一个类型属性 
//值得要说的 在class中为了允许子类能够继承重写父类的类型属性 只需要加上关键字class


//下面是文档中的实例，较之老版本有些许改动
struct SomeStruct{
  static var storedTypeProperty = "Some value."  //这是存储型 类型属性
  static var computedTypeProperty:Int{
    return 1
  }
}

enum SomeEnumeration{
  static var storedTypeProperty = "Some value."//这是存储型 类型属性
  static var computedTypeProperty:Int{
    return 6
  }
}

class SomeClass {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty:Int{
    return 27
  }
  class var overrideableComputedTypeProperty:Int {
    return 107
  }
}


var struct1:SomeStruct = SomeStruct()

var struct2:SomeStruct = SomeStruct()

print("struct1:\(SomeStruct.storedTypeProperty)")//引用时候可是用类型来调用类型属性哦


//总结 实例属性 我们都是通过初始化函数得到一个实例 每个实例具有自己的一套属性 是独立存在的。
//而类型属性呢？恰恰相反 他们公用一套属性，copy形式罢了.
//另外存储型 你会发现必须是有初始值的！毕竟不能使用init方法来赋值 那玩样只有实例才能用
//我发现return 就好比 get 只读，而storeTypeProperty 能读能写 这里还不清楚


