//
//  WJTestViewController.swift
//  swiftWeibo
//
//  Created by 龚文娟 on 17/10/3.
//  Copyright © 2017年 l. All rights reserved.
//

import UIKit

class WJTestViewController: WJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNextBtn()
        if let count = navigationController?.childViewControllers.count{
            title = "第 \(count)个"
        }
    }
    
    
    @objc fileprivate func nextBtnClick() {
        
        navigationController?.pushViewController(WJTestViewController(), animated: true)
    }
}

extension WJTestViewController {
    
    fileprivate func addNextBtn() {
        
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", target: self, action: #selector(nextBtnClick))
    }
}
