//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 属性
    1> 存储型属性 --> 要开辟空间,以存储数据
    2> 计算型属性 --> 执行函数返回其他内存地址. 只实现get方法的属性成为计算型属性.
                    等同于OC的readOnly属性,get方法以外不可以给计算型属性赋值
                    计算型属性本身不占用内存空间. 
    *OC*
    OC中如果方法有返回值没有参数,就可以直接用 . 调用, 这个跟swift中的计算型属性类似.
    这种就是调用的时候方便阅读. 类似 字符串.copy  这个方法
 */


//MARK:- 重写get set方法
class person: NSObject {

    var name: String? {
        //set里新赋值的值默认会声明称newValue
        set {
              let new = newValue as? NSString
              guard let n  = new else {
                name = nil
                return
            }
             name = "Miss" + (n as String)
            }
        
        get {

            return "大家好" + (name ?? "xx")
        }
    }
    
    
    /*
     如果只重写了get方法 那么这个属性就是只读属性. 以下是get的简写方式
     又称为计算型属性,它本身不保存内容,不会分配空间存储值.都是通过计算获得结果,类似于一个没有参数但有返回值的函数.
     */
    
    var title: String? {
    
        return "Mr" + (name ?? "")
    }
    /*
     懒加载和计算型属性写法很相似,
     懒加载会在第一次访问的时候执行,闭包结束后会把结果保存在属性中.懒加载的属性会分配空间存储值
     */
    lazy var title2: String? = {
        
        return "lazy" + (self.name ?? "")
    }()

}

let p = person()
p.name = "哈哈"
print(p.title ?? "meiyou") //打印的是   Mr大家好哈哈
print(p.title2 ?? "mei") //打印的是    lazy大家好哈哈

p.name = "嘻嘻"
//计算型属性每次都会重新走一遍get代码.所以值会随着name更新
print(p.title ?? "meiyou") //打印的是   Mr大家好嘻嘻

//懒加载代码只走一次. 所以不会跟着改变
print(p.title2 ?? "mei") //打印的是    lazy大家好哈哈


//MARK: -didSet方法

/*
   视图的模型属性里经常用这个方法,这样就是在模型属性有值以后,给视图控制器设置属性
   类似OC里重写模型属性的setter方法
   区别是:不需要像oc那样考虑 _成员变量 = 值
         并且oc中如果是copy属性,应该是  _成员变量 = 值.copy
 
 */
class Model: NSObject {
    var title: String?
    var count: Int?
}

class Label: UILabel {
    
    var dataModel: Model? {
        
        didSet {
            text = dataModel?.title
        }
    }
    
    var str: String? {
        
        //将要用新值替换旧值的时候调用
        willSet {
            
            //默认会声明一个newValue ,就是新值的值
        }
        
        //新值已经替换旧值的时候调用
        didSet {
            //默认会声明oldValue,就是旧值
        }
        
    }
    
}




