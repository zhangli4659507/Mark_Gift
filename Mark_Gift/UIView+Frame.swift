//
//  UIView+Frame.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//



import UIKit

extension UIView {

    var x:CGFloat {
    
        set {
        
            frame = CGRectMake(newValue, frame.origin.y, frame.size.width, frame.size.height)
        }
        get {
        
            return frame.origin.x
        }
    }
    
    var y:CGFloat {
        
        set {
            
            frame = CGRectMake(frame.origin.x, newValue, frame.size.width, frame.size.height)
        }
        get {
            
            return frame.origin.y
        }
    }
    
    var width:CGFloat {
        
        set {
            
            frame = CGRectMake(frame.origin.x, frame.origin.y, newValue, frame.size.height)
        }
        get {
            
            return frame.size.width
        }
    }
    
    var height:CGFloat {
        
        set {
            
            frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, newValue)
        }
        get {
            
            return frame.size.height
        }

    }
    
}
