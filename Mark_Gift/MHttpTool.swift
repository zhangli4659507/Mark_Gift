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
    required init?(map: Map) {
        
    }
     func mapping(map: Map) {
       code <- map["code"]
       data <- map["data"]
       message <- map["message"]
    }
}

class MHttpTool: NSObject {
 typealias successCourse = (_ response:MHttpResponse?)->Void
 typealias errorCourse = (_ error:NSError?)->Void
    
    static let netWork:Networking = {

     return Networking(baseURL: "http://api.liwushuo.com/")
    
    }()
    
    static func getRequestWithParameters(_ urlString:String,parameters:[String:AnyObject?], success:@escaping successCourse,failtrueCourse:@escaping errorCourse) {
    
        var parStr:String = String()
        for (key,value) in parameters {
            parStr.append(String(validatingUTF8: key)!)
            parStr.append("=")
            parStr.append(String(describing: value as AnyObject))
            parStr.append("&")

        }
        if  parStr.hasSuffix("&") {
           let startIndex = parStr.characters.index(parStr.startIndex, offsetBy: 0)
            let endIndex = parStr.characters.index(parStr.endIndex, offsetBy: -1)
         parStr =  parStr.substring(with: Range(startIndex..<endIndex))
        }
        var finalUrl:String = String(urlString)
        if !finalUrl.hasSuffix("?") {
           finalUrl = finalUrl + "?"
        }
        finalUrl.append(parStr)
       self.getRequestData(finalUrl, success: success, failtrueCourse: failtrueCourse)
        
    }
    
    static func getRequestData(_ urlString:String ,success:@escaping successCourse,failtrueCourse:@escaping errorCourse) {
            netWork.GET(urlString) { (JSON, error) in
           
            if error != nil {
                failtrueCourse(error)
            } else {
                let model = Mapper<MHttpResponse>().map(JSONObject: JSON)
                success(model)
            }
        }
        
        
    }
    
    
}
