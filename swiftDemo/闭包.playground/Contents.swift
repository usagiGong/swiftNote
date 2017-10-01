//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 闭包类似于OC中的block,但是比OC的block应用面更广
   1.在OC中block是匿名的函数,在swift中函数的特殊的闭包
   2.闭包的应用场景
     1)异步执行完成回调
     2)控制器间的回调
     3)自定义视图回调
   3.回调的特点
     1)以参数回调处理结果
     2)返回值为void
 
 
 
 */


//循环引用场景1 
//completion是vc的属性,会强引用闭包,在闭包里调用vc,闭包会强引用vc. 循环引用
/*
 vc.completion = {
 guard let data = vc.contactor else {
 return
 }
 }
 */

class TestVC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //[weak vc]把vc在闭包中变成了弱引用,弱引用是可选的,所以使用的时候要加?
        let vc = TestVC2()
        vc.completion = { [weak vc] in
            guard let data = vc?.name else {
                return
            } 
            print(data)
        }

    }
}

class TestVC2: UIViewController {
    
    var completion: (() -> ())?
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
