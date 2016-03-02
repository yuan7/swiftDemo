//
//  ViewController.swift
//  swiftDemo_2
//
//  Created by RY on 16/2/29.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,Demo_2CellDelegate {
let identifier = "DEMO_2CELL"
    var table:UITableView?
    
    let data = [
        Data(image:"videoScreenshot01",title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Data(image:"videoScreenshot02",title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Data(image:"videoScreenshot03",title: "Adventure Time", source: "Youtube - 02:39"),
        Data(image:"videoScreenshot04",title: "Facebook HQ", source: "Facebook - 10:20"),
        Data(image:"videoScreenshot03",title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]   //数据源
    
    var player = AVPlayer()
    var playerControlelr = AVPlayerViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView(){
        table = UITableView(frame: view.bounds, style: .Plain)
        table?.backgroundColor = UIColor.blackColor()
        table?.dataSource = self
        table?.delegate = self
        table?.registerClass(Demo_2Cell.classForCoder(), forCellReuseIdentifier: identifier)
        view.addSubview(table!)
    }

    
//    MARK:- UITableViewDelegate && UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = table?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! Demo_2Cell
        cell.delegate = self
        let source = data[indexPath.row]
        cell.imageV?.image = UIImage(named: source.image)
        cell.titleLael?.text = source.title
        cell.sourceLabel?.text = source.source
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    
//    MARK:- Demo_2CellDelegate
    func didSeletedPlay() {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        player = AVPlayer(URL: url)
        playerControlelr.player = player
        self.presentViewController(playerControlelr, animated: true, completion: nil)
    }

}

