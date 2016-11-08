//
//  MCategoryModel.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/5.
//  Copyright © 2016年 Mark. All rights reserved.
//

import Foundation
import ObjectMapper


struct MSingleCategoryTitleModel:Mappable {
    var icon_url:String?
    var id:Int?
    var name:String?
    var order:Int?
    var status:Int?
    var subcategories:[MSingleCategoryModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        icon_url <- map["icon_url"]
        id <- map["id"]
        name <- map["name"]
        order <- map["order"]
        status <- map["status"]
        subcategories <- map["subcategories"]
    }
    
}


struct MSingleCategoryModel:Mappable {
    
    var icon_url:String?
    var id:Int?
    var items_count:Int?
    var name:String?
    var order:Int?
    var parent_id:Int?
    var status:Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        icon_url <- map["icon_url"]
        id <- map["id"]
        name <- map["name"]
        order <- map["order"]
        status <- map["status"]
        parent_id <- map["parent_id"]
        items_count <- map["items_count"]
    }
}
