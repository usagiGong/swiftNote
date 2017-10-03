//
//  WJHomeController.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJHomeController: WJBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavDetails()
        
    }
    
    @objc fileprivate func friendBtnClick() {
        navigationController?.pushViewController(WJTestViewController(), animated: true)
    }
}

extension WJHomeController {
    
    fileprivate func setNavDetails() {
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(friendBtnClick))
        
    }
}
