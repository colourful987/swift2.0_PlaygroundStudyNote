##老版本项目->Xcode7+Swift2.0项目改动可能遇到的问题


> 维护者：PMST    
> 最后更新日期:2015.6.26   
> 版本号：V1.0.0   
> Note:倘若你的项目转换到swift2.0语法，或多或少会遇到一些问题，该文档因此诞生。鼓励大家一起参与进来，帮助国内Swift的开发和维护。   
团队博客地址:[Optional Swift](http://optionalswift.cn)    
个人博客地址:[Colourful Code](http://colourfulcode.cn)   


Error Information | How to solve it   | 备注
----------------- | ---------------   
`toInt() is unavailable:Use Int() initializer`  | 字符串转换成整数方法改为`var intNumber = Int("123")`|
 