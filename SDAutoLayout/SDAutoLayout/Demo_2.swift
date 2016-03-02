//
//  Demo_2.swift
//  SDAutoLayout
//
//  Created by RY on 16/2/27.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class Demo_2: UIViewController,UITableViewDelegate,UITableViewDataSource {
let identifier = "Demo_2Cell"
    var tabelView:UITableView?
    
    let dataSource = ["当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
        "然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
        "当你的 app 没有提供 3x 的 LaunchImage 时",
        "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
        "屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }
    
    func setupTableView(){
        tabelView = UITableView(frame: view.bounds, style: .Plain)
        self.tabelView?.dataSource = self
        self.tabelView?.delegate = self
        self.tabelView?.registerClass(Demo_2Cell.classForCoder(), forCellReuseIdentifier: identifier)
        self.view.addSubview(self.tabelView!)
        
    }
    
//    MARK:- UITableViewDataSource && UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! Demo_2Cell
        cell.setDataWithModel(dataSource[indexPath.row])
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        ***********************  注意只需要一步就可以自动适应tableview的高度 ****************************
        return self.cellHeightForIndexPath(indexPath, cellContentViewWidth: view.bounds.width, tableView: self.tabelView)
    }
    

}
