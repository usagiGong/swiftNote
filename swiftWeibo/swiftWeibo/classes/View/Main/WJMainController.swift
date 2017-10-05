//
//  WJMainController.swift
//  swiftWeibo
//
//  Created by  on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJMainController: UITabBarController {
    
    lazy fileprivate var centerBtn: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC()
        addCenterBtn()
    }

//FIXME: 按钮点击方法还没写
    @objc fileprivate func centerBtnClick() {
        print("点击了centerBtn")
    }
}

//MARK:设置界面
extension WJMainController {
    
    fileprivate func addCenterBtn() {
        tabBar.addSubview(centerBtn)
        //因为tabBar会有个容错的间隙,所以如果宽度刚好的话,就有可能点到那个小空间,就把那个没用VC给点出来了
        let width = tabBar.bounds.width / CGFloat((childViewControllers.count)) - 1
        centerBtn.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        centerBtn.setImage(UIImage(named:"bottombar_publish_notclick"), for: .normal)
        centerBtn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
        
    }
    
   fileprivate func addChildVC () {
        
    let arr: [[String: Any]] = [
            ["name": "WJHomeController" ,"title": "首页","image": "bottombar_home_",
             "vistorInfo":["imageName": "","labelText": ""]],
            ["name": "WJMessageController","title": "消息","image": "bottombar_circle_",
             "vistorInfo":["imageName": "visitordiscover_image_message","labelText": "想给谁发信息啊 想给谁发信息啊啊啊啊 啊啊"]],
            ["name": "UIViewController"],//加个不用的VC占位,让tabBar5等分
            ["name": "WJDiscoverController","title": "发现","image": "bottombar_heart_",
             "vistorInfo":["imageName": "","labelText": ""]],
            ["name": "WJProfileController","title": "我的","image": "bottomber_original_",
             "vistorInfo":["imageName": "visitordiscover_image_profile","labelText": "快点登录吧 这样就可以跟其他小伙伴一起玩耍啦"]],
            ]
        
        var arrTemp = [UIViewController]()
        for dict in arr {
            arrTemp.append(controller(dict: dict))
        }
        viewControllers = arrTemp
    }
    
    private func controller(dict: [String : Any]) -> UIViewController {
        
        //let visitorInfo = dict["vistorInfo"] as? [[String:String]]
        //根控制器都要拼接命名空间       
        guard let clsName = dict["name"] as? String,let title = dict["title"] as? String ,
            let image = dict["image"] as? String, 
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? WJBaseViewController.Type  else {
                
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title;
        vc.vistorInfo = dict["vistorInfo"] as! [String : String]?
        vc.tabBarItem.image = UIImage(named:image + "notclick")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:image + "click")?.withRenderingMode(.alwaysOriginal)
        let nav = WJNavigationController(rootViewController: vc)
        
        //设置选中状态时的颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        //也可以设置字体大小 ,要在nomal状态设置才有效//默认就是12号字体.
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        return nav
    }

}
