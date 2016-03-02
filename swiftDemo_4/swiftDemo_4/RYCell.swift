//
//  RYCell.swift
//  swiftDemo_4
//
//  Created by RY on 16/3/1.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class RYCell: UICollectionViewCell {
    
    var imageV:UIImageView?
    var label:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageV = UIImageView()
        imageV?.layer.cornerRadius = 5
        imageV?.layer.masksToBounds = true
        contentView.addSubview(imageV!)
        
        label = UILabel()
        label?.font = UIFont.systemFontOfSize(13)
        label?.textColor = UIColor.whiteColor()
        contentView.addSubview(label!)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageV?.frame = self.bounds
        label?.frame = CGRect(x: 0, y: imageV!.bounds.height-30, width: imageV!.bounds.width, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
