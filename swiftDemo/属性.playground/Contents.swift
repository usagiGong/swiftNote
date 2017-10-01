//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 重写get set方法
 */
class person: NSObject {

    
    var name: String? {
        set {
              let new = newValue as? NSString
              guard let n  = new else {
                name = nil
                return
            }
             name = "Miss" + (n as String)
            }
        
        get {
            
            return "Miss" + (name ?? "xx")
        }
    }
    
    
    //如果只重写了get方法 那么这个属性就是只读属性. 以下是get的简写方式
    var age: Int? {
        
        return 10
    }
    
    
    
}