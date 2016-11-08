//
//  MGiftListModel.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/28.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import ObjectMapper


class AuthorInfoModel: Mappable {

    var avatar_url: String?
    var avatar_webp_url: String?
    var created_at: Int?
    var id: Int?
    var nickname: String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
       avatar_url <- map["avatar_url"]
       avatar_webp_url <- map["avatar_webp_url"]
       created_at <- map["created_at"]
       id <- map["id"]
       nickname <- map["nickname"]
        
    }
    
}

class ColumnModel: Mappable {
    
    var banner_image_url: String?
    var category: String?
    var cover_image_url: String?
    var created_at: Int?
    var column_description: String?
    var id: Int?
    var order: Int?
    var post_published_at: Int?
    var status: Int?
    var subtitle: String?
    var title: String?
    var updated_at: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        banner_image_url <- map["banner_image_url"]
        category <- map["category"]
        cover_image_url <- map["cover_image_url"]
        cover_image_url <- map["cover_image_url"]
        created_at <- map["created_at"]
        id <- map["id"]
        column_description <- map["description"]
        order <- map["order"]
        post_published_at <- map["post_published_at"]
        status <- map["status"]
        subtitle <- map["subtitle"]
        title <- map["title"]
        updated_at <- map["updated_at"]
    }
    
}

class MGiftListModel: Mappable {

    var author: AuthorInfoModel?
    var column: ColumnModel?
    var content_type: Int?
    var content_url: String?
    var cover_image_url: String?
    var cover_webp_url: String?
    var created_at: Int?
    var editor_id: Int?
    var hidden_cover_image: Bool?
    var liked: Bool?
    var likes_count: Int?
    var published_at: Int?
    var share_msg: String?
    var short_title: String?
    var status: Int?
    var template: String?
    var title: String?
    var type: String?
    var pdated_at: Int?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        column <- map["column"]
        content_type <- map["content_type"]
        content_url <- map["content_url"]
        cover_image_url <- map["cover_image_url"]
        cover_webp_url <- map["cover_webp_url"]
        created_at <- map["created_at"]
        editor_id <- map["editor_id"]
        hidden_cover_image <- map["hidden_cover_image"]
        liked <- map["liked"]
        likes_count <- map["likes_count"]
        published_at <- map["published_at"]
        share_msg <- map["share_msg"]
        short_title <- map["short_title"]
        status <- map["status"]
        template <- map["template"]
        title <- map["title"]
        type <- map["type"]
        pdated_at <- map["pdated_at"]
        url <- map["url"]
    }
    
}

class MListDataModel: Mappable {
    
    var items: [MGiftListModel]?
    var paging: [String:String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        paging <- map["paging"]
    }
}
