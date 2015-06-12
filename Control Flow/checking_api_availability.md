###Checking API Availability


> 实例

````swift
if #available(iOS9,OSX 10.10,*){
	//使用iOS 9中的 API接口 以及使用 OS X10.10下的API接口
}else{
	//使用老版本接口
}
````

其中 `"*"`是必须的并且指代其他平台，例如`Watch OS`。

一般我们会明确平台名称以及版本，正如实例所展示。

>总结，检查API可用语法格式如下：


````swift
if #abailable(platform name version,...,*){
	//执行对应APIS
}else{
	//执行之前老版本APIS
}
````