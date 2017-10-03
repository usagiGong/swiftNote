//
//  WJMainController.swift
//  swiftWeibo
//
//  Created by  on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC()
    }

    private func addChildVC () {
        
        let arr = [
            ["name":"WJHomeController","title":"首页","image":"bottombar_home_"],
            ["name":"WJMessageController","title":"消息","image":"bottombar_circle_"],
            ["name":"WJDiscoverController","title":"发现","image":"bottombar_heart_"],
            ["name":"WJProfileController","title":"我的","image":"bottomber_original_"],
        ]
        
        var arrTemp = [UIViewController]()
        for dict in arr {
            arrTemp.append(controller(dict: dict))
        }
        viewControllers = arrTemp
    }
    
    private func controller(dict: [String : String]) -> UIViewController {
         //根控制器都要拼接命名空间       
        guard let clsName = dict["name"],let title = dict["title"],
              let image = dict["image"], 
              let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type  else {
        
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title;
        vc.tabBarItem.image = UIImage(named:image + "notclick")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:image + "click")?.withRenderingMode(.alwaysOriginal)
        let nav = WJNavigationController(rootViewController: vc)
        
        //设置选中状态时的颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        //也可以设置字体大小 ,要在nomal状态设置才有效//默认就是12号字体.
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)], for: .normal)
    
         return nav
    }
}

//extension WJMainController {
    
//}
