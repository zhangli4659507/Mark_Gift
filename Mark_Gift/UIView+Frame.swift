//
//  UIView+Frame.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//



import UIKit


let KScreenWidth:CGFloat = CGRectGetWidth(UIScreen.mainScreen().bounds)
let KScreenHeight:CGFloat = CGRectGetHeight(UIScreen.mainScreen().bounds)
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
    
    func removeAllSubViews()  {
        while self.subviews.count > 0 {
            let view:UIView = self.subviews.first!
            view.removeFromSuperview()
        }
    }
    
    
}

extension UIView {

    public  func roundView(round: CGFloat) {
    
        self.layer.masksToBounds = true
        self.layer.cornerRadius = round
    }
    
    public  func roundViewAndLine(round: CGFloat,borderWidth:CGFloat,lineColor:UIColor) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = round
        self.layer.borderColor = lineColor.CGColor
        self.layer.borderWidth = borderWidth
    }
    
}

extension UITableView {

    func tableViewRegiesterNibName(nibName:String)  {
        let nib:UINib = UINib(nibName: nibName, bundle: NSBundle.mainBundle())
        self.registerNib(nib, forCellReuseIdentifier: nibName)
    }
}
