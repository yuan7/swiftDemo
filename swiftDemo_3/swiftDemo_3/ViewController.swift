//
//  ViewController.swift
//  swiftDemo_3
//
//  Created by RY on 16/2/29.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var leftVC:LeftController?
    var midVC:MidController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftVC = LeftController()
        self.addChildViewController(leftVC!)
        view.addSubview(leftVC!.view)
        
        
        midVC = MidController()
        self.addChildViewController(midVC!)
        view.addSubview(midVC!.view)
        
        
        leftVC!.view.frame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        midVC!.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.leftVC?.view.transform = CGAffineTransformMakeTranslation(250, 0)
            self.midVC?.view.transform = CGAffineTransformMakeTranslation(300, 0)
        }
    }

}

