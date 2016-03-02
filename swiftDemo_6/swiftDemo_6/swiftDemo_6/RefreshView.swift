//
//  RefreshView.swift
//  swiftDemo_6
//
//  Created by RY on 16/3/2.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
public enum RefreshState:Int{
    case Refreshnormal = 0  //一般状态
    case Refreshing         //刷新状态
    case RefreshEnded       //刷新完毕
}

class RefreshView: UIView{

    var titleLabel:UILabel?
    var imageView:UIImageView?
    var activity:UIActivityIndicatorView?
    var state:RefreshState = .Refreshnormal
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        //指示器
        activity = UIActivityIndicatorView(frame: CGRect(x: 10, y: (frame.size.height-20)*0.5, width: 20, height: 20))
        activity?.color = UIColor.grayColor()
        self.addSubview(activity!)
        
        //箭头
        imageView = UIImageView(frame: CGRect(x: activity!.frame.maxX+10, y: 10, width: 20, height: 30))
        imageView?.backgroundColor = UIColor.redColor()
        self.addSubview(imageView!)
        
        //Label
        titleLabel = UILabel(frame: CGRect(x: imageView!.frame.maxX+10, y: (frame.height-20)/2, width: 100, height: 20))
        titleLabel?.text = "上拉刷新..."
        self.addSubview(titleLabel!)
        
    }

//    MARK:- PublicFunctions
    
    /**
    一般状态
    */
    func normalState(){
        state = RefreshState.Refreshnormal
        activity?.stopAnimating()
        titleLabel?.text = "上拉刷新..."
        imageView?.hidden = false
//        imageView?.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(0.2) { () -> Void in
//            self.imageView?.transform = CGAffineTransformIdentity
            self.imageView?.transform = CGAffineTransformIdentity

        }
    }
    
    /**
     刷新状态
     */
    func refreshingState(){
        state = RefreshState.Refreshing
        activity?.startAnimating()
        titleLabel?.text = "正在加载数据..."
        UIView.animateWithDuration(1) { () -> Void in
            self.imageView?.transform = CGAffineTransformRotate(self.imageView!.transform, CGFloat(M_PI))
        }
//        imageView?.hidden = true
    }
    
    func refreshEnded(){
        state = RefreshState.RefreshEnded
        activity?.stopAnimating()
        titleLabel?.text = "上拉刷新"
        imageView?.hidden = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
