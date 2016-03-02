//
//  PhotoModel.swift
//  AlamofireDemo
//
//  Created by RY on 16/2/26.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit


class PhotoModel: NSObject {
    var id:Int?
    var url:String

    init(id:Int, url:String) {
        self.id = id
        self.url = url
        super.init()
    }
    
}
