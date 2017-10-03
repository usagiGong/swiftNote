//
//  UIColor+Extensions.swift
//  swiftWeibo
//
//  Created by 龚文娟 on 17/10/3.
//  Copyright © 2017年 l. All rights reserved.
//

import UIKit

extension UIColor {
    
     class var randomColor: UIColor {
        
        let red = Float(arc4random()%256)/255.0
        let green = Float(arc4random()%256)/255.0
        let blue = Float(arc4random()%256)/255.0
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class func colorWithHex(value:UInt32) -> UIColor  {
        
            return UIColorHex_Alpha(value: value, alpha: 1.0);  
    }
    
    /// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)  
    class func UIColorHex_Alpha(value:UInt32, alpha:CGFloat) -> UIColor  
    {  
        let color = UIColor.init(red: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), alpha: alpha)  
        return color  
    }  
}

