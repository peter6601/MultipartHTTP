//
//  Shots.swift
//  MultipartHTTP
//
//  Created by 丁暐哲 on 2016/6/18.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class Shots {
    var msg: String
    var status: Int
    var  datas:Datas?
    
    
    
    init(data: NSDictionary) {
        self.msg = data["msg"] as? String ?? ""
        self.status = data["status"] as? Int ?? 0
        if let SomeData = data["data"] as? NSDictionary{
            self.datas = Datas(data: SomeData)
        }
    }
}

