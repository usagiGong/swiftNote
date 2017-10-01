//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 
 1.构造函数 
    构造函数是一种特殊的函数.在OC中的构造函数是initWithXXX,在swift中由于支持函数重载
    所有的构造函数名称都是init
    作用:
      1.主要用来在创建对象时初始化对象,为对象成员变量设置初始值
       -> 1)分配空间 alloc
          2)设置初始值 init
 
    注意:
       OC是基于运行时实现的,swift虽然可以调用运行时,但是底层不是基于运行时的
      具体体现如:
       1.OC中实例化一个对象的时候,要先在初始化方法里调用super init,初始化好从父类继承的东西,
         再初始化当前类的东西
       2.swift的初始化过程刚好相反,是先初始化好自己的,再调用super.init()初始化父类的
   */
 
/*
2.重载(overload)的概念
    1.函数名相同,函数的参数类型和个数不同
    2.一旦重载了构造函数,且自己也没有实现默认的init()构造函数的话,系统就不提供默认的init()构造函数
      原因:在实例化对象时必须通过构造函数为对象属性分配空间和设置初始值,对于存在必选参数的类而言,默认的init()无法完成分配空间和设置初始值的工作
    3.使用场景
      如果希望在创建对象的时候,直接为属性设置需要的值,可以重载构造函数
*/      
 
class A {
    var name: String?
    
}
class B: A {
    var age: Int?
    
    //重载
    init(name: String, age: Int = 0) {
        
        //self.name = name //这是从父类继承的属性,还没调用super.init()之前不能访问
        self.age = age
        super.init()
        self.name = name
    }
}


/*
 3.重写(override)的概念
    1.父类存在相同的方法,子类重新编写父类方法的实现
 */




/* 
 4.KVC构造函数  ===>定义模型的时候,一般用第三方框架,都是基于oc,也是用kvc,所以声明模型属性的时候要根据下面的注意事项
    在swift中定义模型属性的注意事项
     1.对象属性定义为可选项. 这样还没赋值的时候会被自动赋值为nil.(如果不是可选的,初始化的时候要赋值)
     2.基本数据类型属性定义为必选,并且设置初始值.-->基本数据类型在swift中是结构体,OC中没有,OC中只有局部数据类型.
     3.需要使用KVC设置数值的属性,不能用private修饰.-->用private也会导致运行时获取不到属性名称,会奔溃
      --->2.3是因为kvc是基于运行时的.运行时是oc的. 2,3会导致以运行时获取不到这个属性
          的名称,会奔溃..详见用运行时获取属性名称.playground
     4.使用KCV的setValueForKeys方法之前,要先调用super.init()保证对象实例化完成
     5.父类实现了KVC构造函数,子类继承了就可以用.哪怕子类声明了新的属性,也可以直接用从父类继承的kvc构造函数赋,不需要重写
 
 定义模型属性的时候,如果是对象,通常设置为可选的.原因是
    1.在需要的时候创建
    2.避免写构造函数,可以简化代码.如果属性是必选的,就一定要实现一个本类的构造方法.如果是可选的,就可实现可不实现
 */


class Tree: NSObject {
    
    var name:String?  //对象属性设置为可选
    var height = 0.0  //基本数据类型设置为必选且要有初始值
    
    init(dict:[String:Any]) {
        
        //setValuesForKeys(dict) 这样会报错
        super.init() //要先调用super.init()初始化
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
         
    }
    
}

class Pine: Tree {
        
        var color: UIColor?  //如果属性是必选的,就一定会要求要实现本类的构造方法
}
//父类实现了KVC构造函数,子类继承了就可以用.子类声明了新的属性color,也可以直接用从父类继承的kvc构造函数赋值,不需要重写
let littlePine = Pine(dict:["name":"松树","height":1.8,"color":UIColor.green])


 /*便利构造函数
  目的.
    1.条件判断,只有满足条件,才能实例化对象.可以防止早餐不必要的内存开销
    2.简化对象的创建(利用extension 抽取控件的创建方法)
    3.本身不负责属性的创建和初始化工作
 
  特点:
     1.默认情况下,所有的构造方法都是指定构造函数 Designated
     2.用关键字convenience修饰的构造方法就是遍历构造函数
     3.便利构造函数有以下几个特点
        1)可以返回nil
        2)只有便利构造函数中可以调用self.init()
        3)便利构造函数不能被重写或者super
        4)便利构造函数主要用于条件监测或者简化对象创建
 
 
 析构函数  deinit
    deinit {
 
    }
   特点
     1.没有func修饰-->不让手动调用
     2.没有() --> 不让重载,重写
     3.在对象被销毁的时候自动调用
     4.类似于OC的dealloc
   作用:
     1.跟踪对象的销毁,确认是否有循环引用
     2.释放一些必须释放对象,如
        通知,不释放不会崩溃,但是会泄露
        kvo,不释放会奔溃
        NSTimer/CADisplayLink,不释放会循环引用

 */

class Person: NSObject {
    
    var alive = true
    
    
}

class  Chinese: Person {
    
    var name: String?
    var age: Int?
    
    //重写构造函数
    //override init() {
        //虽然这里什么也没写,但是还是继承了alive的默认值
   // }
    
    /*********指定构造函数和便利构造函数,同一时间只能有一个存在,不然就重复了
    //重载指定构造函数    
    init(name: String, age: Int){
        self.name = name
        self.age = age
        super.init()
    }
   */
    
    //便利构造函数...不加conveniencen也不会报错,加了以后就一定要调用self.init().不然会报错
    convenience init?(name: String, age: Int){
        
        if age > 100 {
            return nil
        }
        
        //这个时候属性还没有初始化,不能赋值
        //self.name = name
        //self.age = age
        //调用了self.init()以后属性才初始化完成,实例化了当前对象
        self.init()
        
        self.name = name
        self.age = age
    }
}


let me = Chinese()
print(me.name ?? "lala",me.alive)  //不给默认值会有警告

