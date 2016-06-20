//
//  Data.swift
//  MultipartHTTP
//
//  Created by 丁暐哲 on 2016/6/18.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class Datas {
    var name: String
    var size: Int
    var type: String
//    var datas = Datas
    
    
    
    init(data: NSDictionary) {
        self.name = data["name"] as? String ??  ""
        self.size = data["size"] as? Int ?? 0
        self.type = data["type"] as? String ?? ""
    }
}


