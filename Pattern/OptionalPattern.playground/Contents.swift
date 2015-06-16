//: Pattern 新增 Optional Pattern 这一章节




//这是一个整数可选类型
let someOptional:Int? = 42   //你可以改成nil试试 会发现没有输出了

//以前的解包方式
if let x = someOptional{
  print("someOptional value is \(x)")
}

//新增使用enumeration匹配 也就是枚举匹配方式
if case .Some(let x) = someOptional{
  print("someOptional value is \(x)") //如果为nil 情况 可不会输出东西 因为匹配的是Some!
}

//新增使用可选模式匹配

if case let x? = someOptional{
  print("someOptional value is \(x)") //不需要对x进行解包之类的东东
}

/*
*     对第一个比较熟悉，对之后两个新增语法例子比较陌生 我不得不把Optional深挖一下


    enum Optional<T> : Reflectable, NilLiteralConvertible {
      case None
      case Some(T)

      /// Construct a `nil` instance.
      init()

      /// Construct a non-`nil` instance that stores `some`.
      init(_ some: T)

      /// If `self == nil`, returns `nil`.  Otherwise, returns `f(self!)`.
      func map<U>(@noescape f: (T) -> U) -> U?

      /// Returns `nil` if `self` is nil, `f(self!)` otherwise.
      func flatMap<U>(@noescape f: (T) -> U?) -> U?

      /// Returns a mirror that reflects `self`.
      func getMirror() -> MirrorType

      /// Create an instance initialized with `nil`.
      init(nilLiteral: ())
    }

正如上面所给出 这就是Optional的声明 至于<T>中的T表示匹配任何类型,可以是基础类型如Int、String 也可以是Struct、Class. None 就是我们所说的nil Some(T)就表示有值 被包裹起来
*/
//有时候我还可以这么声明一个可选类型  简写一般是Type + 问号  -> type?
let anotherOptional : Optional<Int> = 42

//如此 antherOptional = Optional(42)
//现在看看上面的例子，首先都是 case 关键字开头 .Some 就是枚举的写法  .Some(let x) 就是把包裹中的数据赋值给x ps 当然假如可选类型有值的话
//至于第二种 依旧 case 打头 用let x? 替换掉前面的.Some(let x) .因为两者是匹配的

//讲完这些 来看看实际用途 文档给了一个小例子如下

let arrayOptionalInts:[Int?] = [nil,1,2,3,nil,5]    //数组的类型是Int? 可选类型喽

//遍历是用for-in  
//swift 1.2写法

for x in arrayOptionalInts{
  if let y = x{
    print("Found a \(y)")//把非 nil 值输出来
  }
}

//swift 2.0写法
//把解包行为提前到for 语句中了
for case let number? in arrayOptionalInts{
  print("Found a \(number)")
}



