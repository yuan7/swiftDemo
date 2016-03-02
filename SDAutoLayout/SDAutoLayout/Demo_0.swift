//
//  Demo_0.swift
//  SDAutoLayout
//
//  Created by RY on 16/2/27.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class Demo_0: UIViewController {

    var view1:UIView?
    var view2:UIView?
    var view3:UIView?
    var view4:UIView?
    var view5:UIView?
    var view6:UIView?
    var widthRedio:CGFloat = 0.3
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        view1 = UIView()
        view1?.backgroundColor = UIColor.redColor()
        view.addSubview(view1!)
        view2 = UIView()
        view2?.backgroundColor = UIColor.orangeColor()
        view.addSubview(view2!)
        
        view1?.sd_layout().leftSpaceToView(self.view,5).topSpaceToView(self.view,74).widthIs(50).heightIs(50)
        view2?.sd_layout().leftSpaceToView(view1,10).topEqualToView(view1).rightSpaceToView(self.view,5).heightIs(150)
        
        view3 = UIView()
        view3?.backgroundColor = UIColor.orangeColor()
        view.addSubview(view3!)
        view4 = UIView()
        view4?.backgroundColor = UIColor.redColor()
        view.addSubview(view4!)
        
        view4?.sd_layout().rightSpaceToView(self.view,5).topSpaceToView(view2,20).widthIs(50).heightIs(50)
        view3?.sd_layout().leftEqualToView(view1).rightSpaceToView(view4,10).heightRatioToView(view2,1).topEqualToView(view4)
        
        
        
        
    }


}
