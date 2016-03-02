//
//  ViewController.swift
//  swiftDemo_6
//
//  Created by RY on 16/3/2.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let identifier = "cell"
    
    var tableView:UITableView?
    var footView:RefreshView?
    var data = Model.getData(){
        didSet{
           self.valueChanged()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFootView()
    }

    func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
//        tableView?.tableFooterView = UIView(frame: CGRectZero)
        tableView?.separatorStyle = .SingleLineEtched
        tableView?.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView?.backgroundColor = UIColor.lightGrayColor()
        tableView?.registerClass(UITableViewCell .classForCoder(), forCellReuseIdentifier: identifier)
        view.addSubview(tableView!)

    }
    func setupFootView(){
        footView = RefreshView(frame: CGRect(x: 0, y: 0, width: tableView!.bounds.width, height: 60))
        tableView?.tableFooterView = footView
    }
    
//    MARK:-UITableViewDelegate && UITableviewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = self.getColorWithIndex(indexPath.row)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //当ScrollView的ContentOffSet.y >= scrollView.contentSize.Height 时。说明到尾部了
        if(scrollView.contentOffset.y+(scrollView.bounds.height) >= scrollView.contentSize.height+30){
            if (footView?.state == RefreshState.Refreshnormal || footView?.state == RefreshState.RefreshEnded){
                self.refreshing()
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
                //加载更多数据
                self.data.appendContentsOf(Model.getMoreData())
                self.tableView?.reloadData()
            })
        }
        }
    }
    
    
//    MARK:- 私有方法
    func getColorWithIndex(index:NSInteger)->UIColor{
        let green = (CGFloat(index) / CGFloat(20)) * 0.6
        let color = UIColor(red: 1, green: green, blue: 0, alpha: 1)
        return color
    }
    /**
     数据加载中
     */
    func refreshing(){
        footView?.refreshingState()
    }
    
    /**
     数据加载完毕
     */
    func valueChanged(){
        footView?.refreshEnded()
    }
}

