//
//  MHttpTool.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import Networking
class MHttpResponse: NSObject {
    var code:String?
    var data:AnyObject?
    var message:String?
}

class MHttpTool: NSObject {
 typealias successCourse = (response:MHttpResponse?)->Void
 typealias errorCourse = (error:NSError?)->Void
    
    static var netWork:Networking = {

     return Networking(baseURL: "http://api.liwushuo.com/")
    
    }()
    
    static func getRequestData(urlString:String ,success:successCourse,failtrueCourse:errorCourse) {
    
        netWork.GET(urlString) { (JSON, error) in
           
            if error != nil {
                failtrueCourse(error:error)
            } else {
               let model = MHttpResponse.mj_objectWithKeyValues(JSON)
                success(response: model)
            }
        }
        
        
    }
    
    
}
