//
//  Demo_2Cell.swift
//  SDAutoLayout
//
//  Created by RY on 16/2/27.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class Demo_2Cell: UITableViewCell {

    var icon:UIImageView?
    var topView:UIView?
    var titleLabel:UILabel?
    var titleRightView:UIView?
    var bottomView:UIView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        icon = UIImageView()
        icon?.backgroundColor = UIColor.redColor()
        topView = UIView()
        topView?.backgroundColor = UIColor.lightGrayColor()
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.blackColor()
        titleRightView = UIView()
        titleRightView?.backgroundColor = UIColor.blueColor()
        bottomView = UIView()
        bottomView?.backgroundColor = UIColor.orangeColor()
        
        contentView.addSubview(icon!)
        contentView.addSubview(topView!)
        contentView.addSubview(titleLabel!)
        contentView.addSubview(titleRightView!)
        contentView.addSubview(bottomView!)
        
        icon?.sd_layout().leftSpaceToView(contentView,10).topSpaceToView(contentView,10).widthIs(50).heightIs(50)
        topView?.sd_layout().leftSpaceToView(icon,10).topEqualToView(icon).rightSpaceToView(contentView,10).heightIs(20)
        //自适应高度
        titleLabel?.sd_layout().leftEqualToView(topView).topSpaceToView(topView,10).rightSpaceToView(contentView,60).autoHeightRatio(0)
        titleRightView?.sd_layout().leftSpaceToView(titleLabel,10).topEqualToView(titleLabel).rightSpaceToView(contentView,10)
        bottomView?.sd_layout().leftEqualToView(topView).rightSpaceToView(contentView,10).topSpaceToView(titleLabel,10).heightIs(30)
        
//        **********************  这是对cell的高度的自适应  ****************************
        self.setupAutoHeightWithBottomView(bottomView, bottomMargin: 10)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    MARK:- 公共方法
    /**
    给cell的titleLabel赋值
    */
    func setDataWithModel(title:String){
        titleLabel?.text = title
    }
    

}
