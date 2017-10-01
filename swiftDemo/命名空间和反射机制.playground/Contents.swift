
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 
 反射机制
     1.对于任意一个类,都能知道这个类的所有属性和方法
     2.对于任意一个对象,都能调用它的任意一个方法和属性
     这种动态获取信息以及动态调用对象的方法的功能成为java语言的反射机制
 
 在OC中如何利用反射机制
     1.利用 NSClassFromString 方法来使用字符串获取类
     2.利用 isMemberOfClass: 判断是否是某一个类
     3.利用 isKindOfClass: 判断是否是一个类的子类
     4.利用 conformsToProtocol 判断对象是否遵循某一个协议
     5.利用 respondsToSelector 判断是否实现了某天方法
     6.利用 performSelector: 或者 objc_msgSend 间接调用方法
 
 */