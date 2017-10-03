//
//  UIBarButtonItem+Extensions.swift
//  swiftWeibo
//
//  Created by 龚文娟 on 17/10/3.
//  Copyright © 2017年 l. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience  init(title: String,font: CGFloat = 16,target: AnyObject?,action: Selector?){
        
        let btn = UIButton(type:.custom)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: font)
        
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.setTitleColor(UIColor.black, for: .normal)
        //这个要在最后调用才有效,而且这样就不用设置btnframe,btn也会根据item的size去显示
        btn.sizeToFit()
        
        if let target = target,let action = action {
            btn .addTarget(target, action: action, for: .touchUpInside)
        }

        self.init(customView: btn)
    }
    
}
