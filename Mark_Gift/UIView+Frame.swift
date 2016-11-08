//
//  UIView+Frame.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//



import UIKit


let KScreenWidth:CGFloat = UIScreen.main.bounds.width
let KScreenHeight:CGFloat = UIScreen.main.bounds.height
extension UIView {


    var x:CGFloat {
    
        set {
        
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
        }
        get {
        
            return frame.origin.x
        }
    }
    
    var y:CGFloat {
        
        set {
            
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height)
        }
        get {
            
            return frame.origin.y
        }
    }
    
    var width:CGFloat {
        
        set {
            
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.size.height)
        }
        get {
            
            return frame.size.width
        }
    }
    
    var height:CGFloat {
        
        set {
            
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: newValue)
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

    public  func roundView(_ round: CGFloat) {
    
        self.layer.masksToBounds = true
        self.layer.cornerRadius = round
    }
    
    public  func roundViewAndLine(_ round: CGFloat,borderWidth:CGFloat,lineColor:UIColor) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = round
        self.layer.borderColor = lineColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
}

extension UITableView {

    func tableViewRegiesterNibName(_ nibName:String)  {
        let nib:UINib = UINib(nibName: nibName, bundle: Bundle.main)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
}
