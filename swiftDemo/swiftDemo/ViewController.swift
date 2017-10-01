//
//  ViewController.swift
//  swiftDemo
//
//  Created by on 17/9/28.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testSwitch()
    }

    func testSwitch() {
        
        //let str = "lala"
       // print(str[1])
        
        let arr:[Any] = [1,2,3,0.5,"你好","好吧","just for fun",UIButton(),(20.0,0.0),{(str:String) ->String in str}]
        
        for obj in arr {
            
            switch obj {
            case 1 as Int:
                print("这是1啊")
            case let (x,0) as (Double,Double):
                print("这是一个点 ", (x));
            case let st as (String) -> String:
                let a = st("haha")
                print(a)
            case let b as UIButton:
                print("按钮",(b))
            default:
                print("default")
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"testCell", for: indexPath)
    
        return cell
    }
    

   
}

/*
extension String { 
    
    subscript(strIndex: Int) -> Character {
        
        
        
        return "h"
    }
        
        
    
    
}*/

