//
//  WJContactListController.swift
//  swiftDemo
//
//  Created by  on 17/9/30.
//  Copyright © 2017 l. All rights reserved.
//

import UIKit

class WJContactListController: UITableViewController {
    
    var dataArr = [ContactorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
        //获取数据,刷新表格
        getContactorData { (list) in
            
            self.dataArr += list
            self.tableView.reloadData()
        }
       
    }

    
    //MARK: - getData
    private func getContactorData(completion:@escaping (_ list: [ContactorModel]) -> ()) -> () {
        
        var arrayM = [ContactorModel]()
        //模拟网络延时
        Thread.sleep(forTimeInterval: 2)
        //异步下载数据
        DispatchQueue.global().async {
            
            for i in 0...20 {
                
                let person = ContactorModel()
                person.name = "swifter ------ \(i) "   
                person.telNum = "183" + String(format: "%06d", arc4random_uniform(100000))
                person.title = "xxxxxxx"
                
                arrayM.append(person)
            }
           
            //回调给主线程
        DispatchQueue.main.async(execute: { 
            
            completion(arrayM)
        })
            
        }
        
    }
    
    @IBAction func addNewContactor(_ sender: Any) {
        
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         类型转换 as
         Switf中String之外,大部分使用as 需要 ?/! 具体用哪一个,就根据前面的返回值是可选还是非可选决定
         前面是可选的,就用as?  前面是肯定有值的,就用as!
         但是 if let / guard 里的是一定用as?   因为本来就是用来判空的,可能是nil
         */
        let vc = segue.destination as! WJContactorDetailsController
        if let indexPath = sender as? IndexPath {
            vc.contactor = dataArr[indexPath.row]
            vc.completion = { 
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } 
        } else {   //sender不是index的时候就是新增
            
            //completion是vc的属性,会强引用闭包,在闭包里调用vc,闭包会强引用vc. 循环引用
            
            /*
             vc.completion = {
                guard let data = vc.contactor else {
                    return
                }
             }
            */
            //[weak vc]把vc在闭包中变成了弱引用,弱引用是可选的,所以使用的时候要加?
            vc.completion = { [weak vc] in
                    guard let data = vc?.contactor else {
                        return
                    } 
                    //数据插入第一条
                    self.dataArr.insert(data, at: 0)
                    self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消灰色
         tableView .deselectRow(at: indexPath, animated: true)
        //界面跳转传值
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
         
        let cell = tableView.dequeueReusableCell(withIdentifier:"cellID", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row].name
        cell.detailTextLabel?.text = dataArr[indexPath.row].telNum
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
