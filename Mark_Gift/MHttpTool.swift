//
//  MHttpTool.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import Networking

import ObjectMapper

//class MHttpResponse: NSObject {
//    var code:String?
//    var data:AnyObject?
//    var message:String?
//}

class MHttpResponse: Mappable {
    var code:Int?
    var data:AnyObject?
    var message:String?
    required init?(_ map: Map) {
        
    }
     func mapping(map: Map) {
       code <- map["code"]
       data <- map["data"]
       message <- map["message"]
    }
}

class MHttpTool: NSObject {
 typealias successCourse = (response:MHttpResponse?)->Void
 typealias errorCourse = (error:NSError?)->Void
    
    static let netWork:Networking = {

     return Networking(baseURL: "http://api.liwushuo.com/")
    
    }()
    
    static func getRequestWithParameters(urlString:String,parameters:[String:AnyObject!], success:successCourse,failtrueCourse:errorCourse) {
    
        var parStr:String = String()
        for (key,value) in parameters {
            parStr.appendContentsOf(String(UTF8String: key)!)
            parStr.appendContentsOf("=")
            parStr.appendContentsOf(String(value))
            parStr.appendContentsOf("&")

        }
        if  parStr.hasSuffix("&") {
           let startIndex = parStr.startIndex.advancedBy(0)
            let endIndex = parStr.endIndex.advancedBy(-1)
         parStr =  parStr.substringWithRange(Range(startIndex..<endIndex))
        }
        var finalUrl:String = String(urlString)
        if !finalUrl.hasSuffix("?") {
           finalUrl = finalUrl.stringByAppendingString("?")
        }
        finalUrl.appendContentsOf(parStr)
       self.getRequestData(finalUrl, success: success, failtrueCourse: failtrueCourse)
        
    }
    
    static func getRequestData(urlString:String ,success:successCourse,failtrueCourse:errorCourse) {
            netWork.GET(urlString) { (JSON, error) in
           
            if error != nil {
                failtrueCourse(error:error)
            } else {
               let model = Mapper<MHttpResponse>().map(JSON)
                success(response: model)
            }
        }
        
        
    }
    
    
}
