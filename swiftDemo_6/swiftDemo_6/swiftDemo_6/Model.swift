//
//  Model.swift
//  swiftDemo_6
//
//  Created by RY on 16/3/2.
//  Copyright © 2016年 ouda. All rights reserved.
//

import Foundation

struct Model{
    var title:String?
    init(title:String){
        self.title = title
    }
    
   static func getData()->[String]{
        return [
                "🐶🐶🐶🐶🐶🐶🐶",
                "🐱🐱🐱🐱🐱🐱🐱",
                "🐵🐵🐵🐵🐵🐵🐵",
                "🐰🐰🐰🐰🐰🐰🐰",
                "🐅🐅🐅🐅🐅🐅🐅",
                "🐶🐶🐶🐶🐶🐶🐶",
                "🐱🐱🐱🐱🐱🐱🐱",
                "🐵🐵🐵🐵🐵🐵🐵",
                "🐰🐰🐰🐰🐰🐰🐰",
                "🐅🐅🐅🐅🐅🐅🐅",
                "🐶🐶🐶🐶🐶🐶🐶",
                "🐱🐱🐱🐱🐱🐱🐱",
                "🐵🐵🐵🐵🐵🐵🐵",
                "🐰🐰🐰🐰🐰🐰🐰",
                "🐅🐅🐅🐅🐅🐅🐅",
                "🐶🐶🐶🐶🐶🐶🐶",
                "🐱🐱🐱🐱🐱🐱🐱",
                "🐵🐵🐵🐵🐵🐵🐵",
                "🐰🐰🐰🐰🐰🐰🐰",
                "🐅🐅🐅🐅🐅🐅🐅"
            
        ]
    }
    
    static func getMoreData()->[String]{
        return [
            "🐻",
            "🐍",
            "🐲",
            "🐷"
        ]
    }
}