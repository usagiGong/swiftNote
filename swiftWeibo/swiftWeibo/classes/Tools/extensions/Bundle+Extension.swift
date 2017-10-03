//
//  Bundle+Extension.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import Foundation

extension Bundle {
    
    var nameSpace:String {
        
        guard let nameSpace = infoDictionary?["CFBundleName"] as? String else {
            
            return ""
        }
        
        return  nameSpace
    }
}
