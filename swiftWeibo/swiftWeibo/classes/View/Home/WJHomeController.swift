//
//  WJHomeController.swift
//  swiftWeibo
//
//  Created by on 17/10/2.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

fileprivate let cellID = "homeCellID"

class WJHomeController: WJBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavDetails()
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        loadData()
    }
    
    @objc fileprivate func friendBtnClick() {
        navigationController?.pushViewController(WJTestViewController(), animated: true)
    }
    
    override func loadData() {
        
        if isPull {
            
            for i in 0...10 {
                dataList.append("这是第\(i)" + "上拉刷新")
            } 
            isPull = false
            
        } else {
            
            for i in 0...10 {
                dataList.insert("这是第\(i)下拉刷新", at: 0)
            } 

        }
        
        refreshControl?.endRefreshing()
        tableView?.reloadData()
    }

}


// MARK: - tabelView dataSouce delegate
extension WJHomeController {
    //在cell是最后一行时,再拖动才是要上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //判断是否为最后一行的cell
        let secsionCount = tableView.numberOfSections
        let rowCount = tableView.numberOfRows(inSection: secsionCount - 1)
        if indexPath.section == secsionCount - 1 && indexPath.row == rowCount - 1  && !isPull{
            isPull = true
            loadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell 
    }

}

extension WJHomeController {
    
    fileprivate func setNavDetails() {
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(friendBtnClick))
        
    }
}
