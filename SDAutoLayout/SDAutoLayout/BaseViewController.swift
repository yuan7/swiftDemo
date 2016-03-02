    //
//  BaseViewController.swift
//  SDAutoLayout
//
//  Created by RY on 16/2/27.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let identifier = "DemoCell"
    
    let dataSource = ["demo_0","demo_1","demo_2"]
    let detailSource = ["SDAutoLayout的基本使用","SDAutoLayout的自适应大小","SDAutoLayout的tableview的高度自适应"]
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    /**
     Demo分类
     */
    func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
    }

    
//    MARK:- UITableViewDelegate && UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        cell?.detailTextLabel?.text = detailSource[indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var demoVC:UIViewController?
        switch indexPath.row{
        case 0:demoVC = Demo_0()
        case 1:demoVC = Demo_1()
        case 2:demoVC = Demo_2()
        default:
            return
        }
        self.navigationController?.pushViewController(demoVC!, animated: true)
        
    }
}
