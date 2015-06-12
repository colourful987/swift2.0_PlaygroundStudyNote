>Throw 以及 Defer 实例请参照Error Handling一章 本文只为简单介绍



###Throw Statement

Q1:使用`throw`应用地方: 

* **函数(function)**
* **方法(method)**
* **闭包(closure)**

它们共同点是都必须标记有`throws`关键字,ps:可以去Error Handling一章看如何声明一个具有抛出错误的函数.形如`func canThrowError() throws->String{}`。

Q2:如何使用`throw`：

````swift
throw expression 
````
值得注意的是**expression**中必须有一个类型是遵循**ErrorType**协议的，具体例子请看Error Handling.

###Defer Statement

**defer**使用比较简单，但要注意几点：

1. 作用域 
2. 执行顺序


````swift
function SomeFunction(){
	defer{
		//一些处理
		print("我的作用域是整个函数")
	}
	if condition{
		defer{
			//一些处理
			print("我的作用域是if语句")
		}
	}
}
````

执行顺序如下，当**其作用域结束**就开始回调，自下而上。接下来看看官方文档给出的例子

````swift
func f(){
	defer{ print("第一")}	//值得注意是现在没有println 而是把print和println合并成一个了
	defer{ print("第二")}
	defer{ print("第三")}
}
f()
//输出 第一
//输出 第二
//输出 第三
````

###do statement 

详见另外一个文件，是playground文件，从实例中你能更好的学习do-statement语法