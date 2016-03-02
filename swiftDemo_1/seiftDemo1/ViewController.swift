//
//  ViewController.swift
//  seiftDemo1
//
//  Created by RY on 16/2/25.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AlertControllerDelegate {
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    let text = "Welcome to LittleHH 这些字体特别适合打「奋斗」和「理想」谢谢「造字工房」，本案例不涉及商业使用 使用到造字工房劲黑体，致黑体，童心体 呵呵，再见🤗 See you next Project 微博 @Allen朝辉"
    let fonts = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    //懒加载的使用
    lazy var textLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height/3*2))
        label.numberOfLines = 0
        label.contentMode = .Top
        
        label.backgroundColor = UIColor.lightGrayColor()
        return label
    }()
    var changeBtn:UIButton!         //切换按钮
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        textLabel.text = text
        setupChangeBtn()
        
    }
    
    /**
     初始化切换文字按钮
     */
    func setupChangeBtn(){
        changeBtn = UIButton(frame: CGRect(x: (SCREEN_WIDTH-80)*0.5, y: SCREEN_HEIGHT-100, width: 80, height: 80))
        changeBtn.layer.cornerRadius = 40
        changeBtn.layer.masksToBounds = true
        changeBtn.setTitle("改变字体", forState: .Normal)
        changeBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        changeBtn.backgroundColor = UIColor.orangeColor()
        changeBtn.titleLabel?.font = UIFont(name: "MFTongXin_Noncommercial-Regular", size: 14)
        changeBtn.addTarget(self, action: Selector("changeAction"), forControlEvents: .TouchUpInside)
        view.addSubview(changeBtn)
    }
    

    func changeAction(){
        let alertController = AlertController()
        alertController.delegate = self
        alertController.dataArray = fonts
        self.presentViewController(alertController, animated: false, completion: nil)
    }

    
//    MARK:- AlertControllerDelegate
    func didSelectedItem(type: FontType) {
        switch type{
        case .MFJinHei:
            textLabel.font = UIFont(name: "MFJinHei_Noncommercial-Regular", size: 15)
        case .MFZhiHei:
            textLabel.font = UIFont(name: "MFZhiHei_Noncommercial-Regular", size: 15)
        case .MJTongXin:
            textLabel.font = UIFont(name: "MFTongXin_Noncommercial-Regular", size: 15)

        }
    }
}

