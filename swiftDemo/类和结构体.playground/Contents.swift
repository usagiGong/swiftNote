//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 
 Swift中的类可以不继承自任何类(可以没有父类,直接建一个swift file即可).
 什么时候要父类什么时候不要
   1>如果类需要使用KVC或者字典转模型框架设置对象值,类就需要继承自己NSObject,因为KVC是NSObject里实现的(如model类就要继承).
   2>如果类只是包装了一下代码逻辑(只写一些函数),可以不用父类(如viewModel). 这样的好处是:更加轻量级(因为NSObject里封装了很多东西,相对比较占内存)
 
  如果是在OC里,model和viewModel都要继承NSObject
 
 */