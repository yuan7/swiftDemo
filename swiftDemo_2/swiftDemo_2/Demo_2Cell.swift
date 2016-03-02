//
//  Demo_2Cell.swift
//  swiftDemo_2
//
//  Created by RY on 16/2/29.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
protocol Demo_2CellDelegate:class{
    func didSeletedPlay();
}


struct Data{
    let image:String
    let title:String
    let source:String
    
}

class Demo_2Cell: UITableViewCell {

    var imageV:UIImageView?
    var titleLael:UILabel?
    var sourceLabel:UILabel?
    var playBtn:UIButton?
    
    weak var delegate:Demo_2CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageV = UIImageView()
        imageV?.userInteractionEnabled = true
        contentView.addSubview(imageV!)
        
        titleLael = UILabel()
        titleLael?.textAlignment = .Center
        titleLael?.textColor = UIColor.whiteColor()
        titleLael?.font = UIFont.systemFontOfSize(15)
        imageV!.addSubview(titleLael!)
        
        sourceLabel = UILabel()
        sourceLabel?.textAlignment = .Center
        sourceLabel?.textColor = UIColor.lightGrayColor()
        sourceLabel?.font = UIFont.systemFontOfSize(10)
        imageV!.addSubview(sourceLabel!)
        
        playBtn = UIButton()
        playBtn?.setImage(UIImage(named: "playBtn"), forState: .Normal)
        playBtn?.addTarget(self, action: Selector("playAction"), forControlEvents: .TouchUpInside)
        imageV?.addSubview(playBtn!)
        
        imageV?.sd_layout().leftSpaceToView(contentView,0).rightSpaceToView(contentView,0).topSpaceToView(contentView,0).bottomSpaceToView(contentView,0)
        
        titleLael?.sd_layout().leftSpaceToView(imageV,0).rightSpaceToView(imageV,0).bottomSpaceToView(imageV,40).heightIs(20)
        
        sourceLabel?.sd_layout().leftEqualToView(titleLael).rightEqualToView(titleLael).bottomSpaceToView(imageV,10).heightIs(20)
        
        playBtn?.sd_layout().centerXEqualToView(imageV).centerYEqualToView(imageV).heightIs(70).widthEqualToHeight()
        
    }

    /**
     按钮的点击事件
     */
    func playAction(){
        delegate?.didSeletedPlay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
