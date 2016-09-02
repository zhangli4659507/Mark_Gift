//
//  MCategorySegmentView.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/2.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MCategorySegmentView: UIView {

    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var centerContans: NSLayoutConstraint!
    var actionTap:((Int)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let  tapLeft:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MCategorySegmentView.actionTapLeft))
        self.lblLeft.addGestureRecognizer(tapLeft)
        self.lblLeft.userInteractionEnabled = true
        
        let  tapRight:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MCategorySegmentView.actionTapRight))
        self.lblRight.addGestureRecognizer(tapRight)
        self.lblRight.userInteractionEnabled = true
        
        
    }
    
    @objc func actionTapLeft() {
        if let action = self.actionTap {
            action(0)
        }
    }
    
    @objc func actionTapRight() {
        if let action = self.actionTap {
            action(1)
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
