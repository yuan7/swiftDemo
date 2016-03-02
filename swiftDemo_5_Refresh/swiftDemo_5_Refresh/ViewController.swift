//
//  ViewController.swift
//  swiftDemo_5_Refresh
//
//  Created by RY on 16/3/2.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let tableViewController = UITableViewController(style: .Plain)
    var refresh = UIRefreshControl()
    var data = Model.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshController()
        setupTableView()
        
    }
    func setupRefreshController(){
        refresh = UIRefreshControl()
        refresh.backgroundColor = UIColor.whiteColor()
        refresh.tintColor = UIColor.grayColor()
        refresh.addTarget(self, action: Selector("refreshAction"), forControlEvents: .ValueChanged)
        let attributeStr = NSAttributedString(string: "Last Refresh Date\(NSDate())")
        refresh.attributedTitle = attributeStr
    }
    
    
    func setupTableView(){
        let tableview = self.tableViewController.tableView
        tableview.delegate = self
        tableview.dataSource = self
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        tableview.tableFooterView = UIView(frame: CGRectZero)
        tableview.separatorStyle = .None    //分割线样式
        view.addSubview(tableview)
        
        self.tableViewController.refreshControl = refresh
    }

    
    /**
     刷新数据
     */
    func refreshAction(){
        debugPrint("刷新")
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 2))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.refresh.endRefreshing()
            self.data.appendContentsOf(Model.getMoreData())
            self.tableViewController.tableView.reloadData()
        }
    }
    
//    MARK:- UITableViewDelegate && UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }

}

