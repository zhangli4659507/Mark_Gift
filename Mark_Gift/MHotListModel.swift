//
//  MHotListModel.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/1.
//  Copyright © 2016年 Mark. All rights reserved.
//

import Foundation
import ObjectMapper
struct MHotList:Mappable {
    
    
    var data:MHotListData?
    var type:String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
       data <- map["data"]
       type <- map["type"]
    }
    
}

struct MHotListData:Mappable {
    var ad_monitors:[AnyObject]?
    var brand_id:String?
    var brand_order:String?
    var category_id:Int?
    var cover_image_url:String?
    var cover_webp_url:String?
    var created_at:Int?
    var description:String?
    var editor_id:Int?
    var favorites_count:Int?
    var id:Int?
    var image_urls:[String]?
    var is_favorite:Bool?
    var keywords:String?
    var name:String?
    var post_ids:[String]?
    var price:String?
    var purchase_id:String?
    var purchase_shop_id:String?
    var purchase_status:Int?
    var purchase_type:Int?
    var purchase_url:String?
    var short_description:String?
    var subcategory_id:Int?
    var updated_at:Int?
    var url:String?
    var webp_urls:[String]?
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
      ad_monitors <- map["ad_monitors"]
      brand_id <- map["brand_id"]
      brand_order <- map["brand_order"]
      category_id <- map["category_id"]
      cover_image_url <- map["cover_image_url"]
      cover_webp_url <- map["cover_webp_url"]
      created_at <- map["created_at"]
      description <- map["description"]
      editor_id <- map["editor_id"]
      favorites_count <- map["favorites_count"]
      id <- map["id"]
      image_urls <- map["image_urls"]
      keywords <- map["keywords"]
      is_favorite <- map["is_favorite"]
      name <- map["name"]
      post_ids <- map["post_ids"]
      price <- map["price"]
      purchase_id <- map["purchase_id"]
      purchase_shop_id <- map["purchase_shop_id"]
      purchase_status <- map["purchase_status"]
      purchase_type <- map["purchase_type"]
      purchase_url <- map["purchase_url"]
      short_description <- map["short_description"]
      subcategory_id <- map["subcategory_id"]
      updated_at <- map["updated_at"]
      url <- map["url"]
      webp_urls <- map["webp_urls"]
    }
}





