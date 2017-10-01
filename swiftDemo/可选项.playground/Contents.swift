//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 可选项
    目的: 解决有值或者没有值的问题
    定义: 定义的时候只能用 ? 表示变量可以为nil,或者有值. 
          var label:UILabel? 只是定义,并没有初始化或者赋值
 
 解包:
    1)强行解包 ! : 目的是要取出值参与计算.但是存在风险.最好先判断是否为nil
                 用if let 或者guard let
    2)可选解包 ? : 不能参与计算
                 主要用于调用方法. 如果对象存在就调用方法,对象为nil就不调用
 
     例子1 
     !强制解包 :将子控件添加到视图调用addSubView时,因为是往数组subviews里插入数据,数组中不允许有nil, 所以如果控件是可选的, 就要!强制解包 
     ?可选解包: 可选解包是调用方法.如果为nil,则不调用方法,但是不参与计算


 
 类型转换
    使用场景: 
      1.将父类转为子类,子类方法和属性比父类多 . oc中是用 (子类名)对象名 来做强制转换
        Swift中用as. 转换有风险,如果没有对应的属性和方法会崩溃
 
    转换方式
      1. as? : 前面的值是可选的,则用as?. 所以guard let /if let中用as?,因为可能没值
      2. as! : 前面的结果一定是有值的
      3. as  : NSString -> String ,NSArrar -> [], NSDictiory -> [:]
             Swift在底层做了结构体和OC对象的桥接,所以可以直接用as做类型转换
 
    
 
    
 */
class testA: UIViewController {
    
    var label: UILabel?
    override func loadView() {
        super.loadView()
        
        label = UILabel()
        //因为是添加到数组里,所以是强制解包
        view.addSubview(label!)
    }
    
}