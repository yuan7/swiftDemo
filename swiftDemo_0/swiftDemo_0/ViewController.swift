//
//  ViewController.swift
//  swiftDemo_0
//
//  Created by RY on 16/2/25.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer:NSTimer?      //Timer
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func timerAction(){
        timeLabel.text = "\(Int(timeLabel.text!)!+1)"
    }

    /**
     重置
     */
    @IBAction func resert() {
        timer?.invalidate()
        timeLabel.text = "0"
    }

    /**
     开始
     */
    @IBAction func start() {
        timer = NSTimer(timeInterval: 1, target: self, selector: Selector("timerAction"), userInfo: self, repeats: true)
        //加入到主RunLoop中
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }

    /**
     暂停
     */
    @IBAction func pasue() {
        timer?.invalidate()
    }
}

