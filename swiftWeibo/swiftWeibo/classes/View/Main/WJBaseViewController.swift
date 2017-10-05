//
//  WJBaseViewController.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJBaseViewController: UIViewController {
    
    //登录状态
    var isLogon = false
    //自定义导航条
    lazy var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    //自定义导航条目
    lazy var navItem = UINavigationItem()
    //tableView
    var tableView: UITableView?
    //刷新
    var refreshControl: UIRefreshControl?
    //是否上拉刷新中
    var isPull = false
    //访客视图
    var vistorView: WJVistorView?
    var vistorInfo: [String:String]?
    
    lazy var dataList:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
          
    }
    
    override var title :String? {
        //当将要把新值赋值给属性的时候会调用这个方法
        willSet {
            //里面有个系统默认声明的属性newValue,就是将要被赋值给属性的值,可以不用声明直接用
            //print(newValue)
        }
        //当将已经把新值赋值给属性的时候会调用这个方法
        didSet {
            navItem.title = title
            //里面有个系统默认声明的属性oldValue,就属性被修改以前的旧值,可以不用声明直接用
           // print(oldValue)
        }
    }
  
    func loadData() {
        refreshControl?.endRefreshing() //子类如果没有实现数据,就不会有刷新控件在转
    }
}


// MARK: - UITabBarDelegate,UITableViewDataSource
extension WJBaseViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

// MARK: - 设置UI界面
extension WJBaseViewController {
    
    fileprivate func setUpUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        setUPNav()
        isLogon ? setTableView() : setVistorUI()
    }
    
    //设置访客视图
    private func setVistorUI() {
        vistorView = WJVistorView(frame: view.bounds)
        vistorView?.vistorInfo = vistorInfo
        view.insertSubview(vistorView!, belowSubview: navBar)
        
    }
    //设置tableView 
    private func setTableView() {
        tableView = UITableView.init(frame: view.bounds)
        tableView?.dataSource = self;
        tableView?.delegate = self;
        view.insertSubview(tableView!, belowSubview: navBar)
        tableView?.contentInset = UIEdgeInsets(top: navBar.bounds.height, 
                                              left: 0, 
                                              bottom: tabBarController?.tabBar.bounds.height ?? 49, 
                                              right: 0)
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl? .addTarget(self, action: #selector(loadData), for: .valueChanged)

        
    }
    
    //设置导航条
    private func setUPNav() {
        
        view.addSubview(navBar)
        navBar.items = [navItem]
        //设置渲染颜色
        navBar.barTintColor = UIColor.colorWithHex(value: 0xF6F6F6)
        //设置字体颜色
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }

    
}
