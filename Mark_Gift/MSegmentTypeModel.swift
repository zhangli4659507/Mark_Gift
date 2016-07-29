//
//  MSegmentTypeModel.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import ObjectMapper

class MSegmentTypeModel: Mappable {

    var editable:Bool?
    var id:Int?
    var name:String?
    
    required init?(_ map: Map) {
        
    }
     func mapping(map: Map) {
       editable <- map["editable"]
        id <- map["id"]
        name <- map["name"]
    }
    
    
}
