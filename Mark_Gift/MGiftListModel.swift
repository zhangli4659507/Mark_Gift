//
//  MGiftListModel.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/28.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit


class AuthorInfoModel: NSObject {

    var avatar_url: String?
    var avatar_webp_url: String?
    var created_at: AnyObject?
    var id: AnyObject?
    var nickname: String?
}

class ColumnModel: NSObject {
    
    override static func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["column_description":"description"]
    }
    
    var banner_image_url: String?
    var category: String?
    var cover_image_url: String?
    var created_at: AnyObject?
    var column_description: String?
    var id: AnyObject?
    var order: AnyObject?
    var post_published_at: AnyObject?
    var status: AnyObject?
    var subtitle: String?
    var title: String?
    var updated_at: AnyObject?
}

class MGiftListModel: NSObject {

    
    
    var author: AuthorInfoModel?
    var column: ColumnModel?
    var content_type: AnyObject?
    var content_url: String?
    var cover_image_url: String?
    var cover_webp_url: String?
    var created_at: AnyObject?
    var editor_id: AnyObject?
    var hidden_cover_image: AnyObject?
    var liked: AnyObject?
    var likes_count: String?
    var published_at: AnyObject?
    var share_msg: String?
    var short_title: String?
    var status: AnyObject?
    var template: String?
    var title: String?
    var type: String?
    var pdated_at: AnyObject?
    var url: String?
}

class MListDataModel: NSObject {
    override static func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["items":MGiftListModel.classForCoder()]
    }
    var items: [MGiftListModel]?
    var paging: [String:String]?
}
