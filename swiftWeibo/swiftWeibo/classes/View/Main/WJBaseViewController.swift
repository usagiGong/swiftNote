//
//  WJBaseViewController.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJBaseViewController: UIViewController {
    
    //自定义导航条
    lazy var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    //自定义导航条目
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        setUPNav()
        
    }
    
    override var title :String? {
        //当将要把新值赋值给属性的时候会调用这个方法
        willSet {
            //里面有个系统默认声明的属性newValue,就是将要被赋值给属性的值,可以不用声明直接用
            //print(newValue)
        }
        //当将已经把新值赋值给属性的时候会调用这个方法
        didSet {
            navItem.title = title
            //里面有个系统默认声明的属性oldValue,就属性被修改以前的旧值,可以不用声明直接用
           // print(oldValue)
        }
    }
  
    
    
    private func setUPNav() {
        
        view.addSubview(navBar)
        navBar.items = [navItem]
        //设置渲染颜色
        navBar.barTintColor = UIColor.colorWithHex(value: 0xF6F6F6)
        //设置字体颜色
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}
