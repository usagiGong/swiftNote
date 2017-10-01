
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 
 命名空间 
   在Swift中有命名空间
     1.在同一个命名空间下,全局共享.
     2.第三方款姐使用Swift的话,如果直接拖拽到项目中,从属同一个命名空间,可能会冲突
       所以尽量用cocoapod集成
     
 
 反射机制
     1.对于任意一个类,都能知道这个类的所有属性和方法
     2.对于任意一个对象,都能调用它的任意一个方法和属性
     这种动态获取信息以及动态调用对象的方法的功能成为java语言的反射机制.
     反射机制最重要的目的就是为了解耦
 
    (反射机制与工厂方法,可以看一下)
 
 在OC中如何利用反射机制
     1.利用 NSClassFromString 方法来使用字符串获取类 --> 返回值类型是 AnyClass? 
     2.利用 isMemberOfClass: 判断是否是某一个类
     3.利用 isKindOfClass: 判断是否是一个类的子类
     4.利用 conformsToProtocol 判断对象是否遵循某一个协议
     5.利用 respondsToSelector 判断是否实现了某天方法
     6.利用 performSelector: 或者 objc_msgSend 间接调用方法
 
 
 //设置window的根控制器时,要添加命名空间,否则会崩溃. 命名空间默认就是项目名称.项目名称最好不要有特殊字符数字,最好也不是中文.  这就是利用反射机制
 
 
    let clsName = "项目名称.控制器类名"
      //NSClassFromString 方法返回值类型是 AnyClass? 所以要转换类型.否则没法初始化
    let cls = NSSClassFromString(clsName) as? 控制器类名  
    let vc = cls?.init()
    window?.rootViewController = vc
    
 
 */