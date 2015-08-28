##老版本项目->Xcode7+Swift2.0项目改动可能遇到的问题


> 维护者：PMST    
> 最后更新日期:2015.8.19   
> 版本号：V1.0.1   
> Note:倘若你的项目转换到swift2.0语法，或多或少会遇到一些问题，该文档因此诞生。鼓励大家一起参与进来，帮助国内Swift的开发和维护。   
团队博客地址:[Optional Swift](http://optionalswift.cn)    
个人博客地址:[Colourful Code](http://colourfulcode.cn)   



1. toInt() is unavailable:Use Int() initializer   
	* 字符串转换成整数方法改为`var intNumber = Int("123")`     
	

2. Binary operator '|'cannot be applied to two UIViewAutoresizing operands.
	* `[.FlexibleWidth, .FlexibleHeight]` 数组传值
	
3. scrollView 内容自动布局后 在iPhone6 6S上跑布局"失常"。
	* 主要是由于scrollView中的contentSize会根据内容而自适应，那么假如你适配好了，但是width=320，那么之后的contentSize.width 也只有320 这也是为什么最后跑在iPhone6 6S上的会出问题。[stack解决](http://stackoverflow.com/questions/18953617/wrong-trailing-space-constraints-for-children-of-uiscrollview?rq=1)
 