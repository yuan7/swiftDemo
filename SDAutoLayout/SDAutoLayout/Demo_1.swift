//
//  Demo_1.swift
//  SDAutoLayout
//
//  Created by RY on 16/2/27.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class Demo_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.sd_layout().leftSpaceToView(view,0).rightSpaceToView(view,0).topSpaceToView(view,0).bottomSpaceToView(view,0)
        scrollView.updateLayout()
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.redColor()
        scrollView.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.orangeColor()
        scrollView.addSubview(view2)
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.greenColor()
        scrollView.addSubview(view3)

        view1.sd_layout().leftSpaceToView(scrollView,20).rightSpaceToView(scrollView,20).topSpaceToView(scrollView,20).heightEqualToWidth()
        view2.sd_layout().leftSpaceToView(scrollView,10).rightSpaceToView(scrollView,10).topSpaceToView(view1,20).heightEqualToWidth()
        view3.sd_layout().leftSpaceToView(scrollView,40).rightSpaceToView(scrollView,40).topSpaceToView(view2,20).heightIs(100)
        
        
        //圆角自适应
//        view1.sd_cornerRadius(10)
//        view1.sd_cornerRadiusFromHeightRatio(0.4)
//        view2.sd_cornerRadiusFromWidthRatio(0.5)
//        view3.sd_cornerRadiusFromWidthRatio(CGFloat(0.3))
        
        
        //scrollViewoffSet自适应
        scrollView.setupAutoContentSizeWithBottomView(view3, bottomMargin: 20)
    }


}
