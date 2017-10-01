//
//  WJContactorDetailsController.swift
//  swiftDemo
//
//  Created by  on 17/9/30.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJContactorDetailsController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    var contactor: ContactorModel?
    var completion:(() ->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }

    private func setData() {
      
        if let contactor = contactor {
            nameTextField.text = contactor.name
            telTextField.text = contactor.telNum
            titleTextField.text = contactor.title
        }
    }
    
    @IBAction func savaData(_ sender: Any) {
        
        //编辑保存
        if let contactor = contactor {
            contactor.name = nameTextField.text
            contactor.telNum = telTextField.text
            contactor.title = titleTextField.text
        } else { //新建保存
            let model = ContactorModel()
            model.name = nameTextField.text
            model.telNum = telTextField.text
            model.title = titleTextField.text
            contactor = model
        }
        completion?()
        //因为是可选的,所以如果没有给闭包赋值,就什么也不会执行,不会崩
       _ = navigationController?.popViewController(animated: true)
    }
}
