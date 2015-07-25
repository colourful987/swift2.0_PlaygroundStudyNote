//: Playground - noun: a place where people can play

import UIKit

var letters:[Character] = ["c","a","f","e"]
var string:String = String(letters)

print(letters.count)  //4
print(string) //cafe
print(string.characters.count)  //4

//定义一个字符 unicode 不懂请自定查询官方文档
let acuteAccent: Character = "\u{0301}"

string.append(acuteAccent)
print(string.characters.count)//4 还是4 没有变化
print(string.characters.last!)//é
print(string)//可以看到是café 在'e'上加了个声调

//检验字符串中是否含有é 由于前面改变之后 导致没有了e 而是é
string.characters.contains("e") // false
string.characters.contains("´") // false
string.characters.contains("é") // true

//官方博客中比喻如上情况为:你把红颜料、绿颜料倒进去，结果混合之后变成了黄颜色；而不是我们期待的这个容器只是把红、绿颜色包含进来，独立存在。