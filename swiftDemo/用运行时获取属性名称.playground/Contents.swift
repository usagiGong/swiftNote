//: Playground - noun: a place where people can play

import UIKit
import CoreFoundation

var str = "Hello, playground"

//用runtime获取属性名称
class Person : NSObject {
    
    var name: String?
    var age: Int = 0
    //基本数据类型在OC中没有可选,如果定义成可选运行时就获取不到这个属性,使用kvc初始化就会崩溃
    //var weight: Int?
    //private修饰的属性,使用运行时也获取不到属性(可以获取到ivar),同样会让用kvc初始化崩溃
    //private var name: String?
    
    class func getPropertList() -> [String] {
        
        var count: UInt32  = 0//
//class_copyPropertyList(<#T##cls: AnyClass!##AnyClass!#>, <#T##outCount: UnsafeMutablePointer<UInt32>!##UnsafeMutablePointer<UInt32>!#>)
                        //第一个参数是类 第二个参数是Uint32类型的指针
        var arr = [String]()
        
        let list = class_copyPropertyList(self, &count) //list是个可选项
        
        for i in 0...Int(count) {
            
            guard let pty = list?[i],
                let cName = property_getName(pty), 
                let name = String(utf8String: cName)
            
                else {
                    //继续遍历下一个
                continue
            }
            
            arr.append(name)
        }
        print(arr)
        return arr
    }
    
}

    let arr = Person.getPropertList()


//发起网络请求 
    let u = URL(string:"http://www.baidu.com")

URLSession.shared.dataTask(with: u!) { (data, respons, error) in 
    
    guard let data = data else {
        
        print(error!)
        return
    }
    
    print(data)
}.resume()
    
