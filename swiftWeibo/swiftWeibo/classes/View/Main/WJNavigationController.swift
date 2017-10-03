//
//  WJNavigationController.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        if childViewControllers.count > 0 {
            //如果当前nav的子控制器个数>0 说明现在是push到其他控制器,那就可以隐藏底部tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            //如果不是rootVC 就把返回按钮文字设置为返回
            if let vc = viewController as? WJBaseViewController {
                var title = "返回"
                
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title: title, target: self, action: #selector(popToParent))
            }
       }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func popToParent() {
        popViewController(animated: true)
    }
}
