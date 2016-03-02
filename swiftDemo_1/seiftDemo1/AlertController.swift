//
//  AlertController.swift
//  seiftDemo1
//
//  Created by RY on 16/2/25.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
enum FontType:Int{
    case MFJinHei = 0
    case MJTongXin
    case MFZhiHei
}

protocol AlertControllerDelegate:class{
    func didSelectedItem(type:FontType)
}

class AlertController: UIViewController {

    var dataArray = [String]()  //空的字符串类型的数组
    weak var delegate:AlertControllerDelegate?  //代理
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverFullScreen
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonH:CGFloat = 44
        let buttonW:CGFloat = view.bounds.width
        for i in 0 ..< dataArray.count{
            let button = UIButton(frame: CGRect(x: 0, y: view.bounds.height, width: buttonW, height: buttonH))
            button.setTitle(dataArray[i], forState: .Normal)
            button.backgroundColor = UIColor.blackColor()
            button.titleLabel?.font = UIFont(name: dataArray[i], size: 14)
            button.addTarget(self, action: Selector("buttonAction:"), forControlEvents: .TouchUpInside)
            button.tag = i
            view.addSubview(button)
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        for(var i=view.subviews.count-1; i>=0; i--){
            buttoAnimation(i, button: (view.subviews[i]as?UIButton)!)
        }
    }
    
    
    /**
     按钮的添加动画
     */
    func buttoAnimation(index:Int,button:UIButton){
        UIView.animateWithDuration(0.23+(Double(index)*0.15), delay: 0, options: [.CurveEaseOut], animations: { () -> Void in
                button.transform = CGAffineTransformMakeTranslation(0, -CGFloat(self.dataArray.count-index)*44)
            }, completion: nil)
    }
    
    /**
     按钮消失的动画
     */
    func buttonDisMissAnimation(){
        for i in 0 ..< view.subviews.count{
            let button = view.subviews[dataArray.count-i-1]
            UIView.animateWithDuration(0.23+Double(i)*0.1, delay: Double(i)*0.1, options: [.CurveEaseOut], animations: { () -> Void in
                button.transform = CGAffineTransformIdentity
                }, completion: { (finished) -> Void in
//                    self.dismissViewControllerAnimated(false, completion: nil)
            })
        }
    }
    
    /**
     按钮的点击事件
     */
    func buttonAction(button:UIButton){
        buttonDisMissAnimation()
        let type = FontType.init(rawValue: button.tag)
        delegate?.didSelectedItem(type!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
