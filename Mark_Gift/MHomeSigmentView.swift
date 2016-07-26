
//
//  MHomeSigmentView.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
class MHomeSigmentView: UIView {

    
    var actionIndexCourse:((Int,MSegmentTypeModel)->Void)?
    private var baseView:UIView?
    private var BottomLineView:UIView?
    private var scorllView:UIScrollView?
    private var typesModel:NSMutableArray?
    private var typeBtn:UIButton?
    init(frame: CGRect,baseView:UIView) {
        super.init(frame: frame)
        self.baseView = baseView
        caretaUI()
        self.actionIndexCourse = {(index:Int,model:MSegmentTypeModel) in
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func caretaUI() {
    
        self.typeBtn = UIButton(type: .Custom)
        self.addSubview(self.typeBtn!)
        self.typeBtn?.adjustsImageWhenDisabled = false
        self.typeBtn?.adjustsImageWhenHighlighted = false
        typeBtn?.addTarget(self, action: <#T##Selector#>, forControlEvents: .TouchUpInside)
        self.typeBtn?.mas_makeConstraints({ (make) in
            make.top.bottom().trailing().equalTo()(self).offset()(0)
            make.width.offset()(55)
            self.typeBtn?.setImage(UIImage(named: "giftcategorydetail_arrow_down_gray"), forState: .Normal)
        })
        
        self.scorllView = UIScrollView(frame: self.bounds)
        self.addSubview(self.scorllView!)
        self.scorllView?.showsHorizontalScrollIndicator = false
        self.scorllView?.mas_makeConstraints({ (make) in
            make.top.leading().bottom().equalTo()(self).offset()(0)
            make.trailing.equalTo()(self.typeBtn?.mas_leading).offset()(0)
        })
    }
    
    func reloadData(dataArr:NSMutableArray,fentchFunc:(model:MSegmentTypeModel)->String)  {
        var cur_X:CGFloat = 0
        self.typesModel = dataArr
        for index in 0...dataArr.count-1 {
          
            let model:MSegmentTypeModel = dataArr[index] as! MSegmentTypeModel
            let name = fentchFunc(model: model)
            let btn:UIButton = UIButton(type: .Custom)
            btn.setTitleColor(UIColor().M_Hex_333, forState: .Normal)
            btn.setTitleColor(UIColor().M_Basic_red, forState: .Selected)
            btn.showsTouchWhenHighlighted = false
            btn.setTitle(name, forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14.0)
            btn.tag = index
            btn.addTarget(self, action: #selector(MHomeSigmentView.actionBtn(_:)), forControlEvents: .TouchUpInside)
            let width = name.stringWidth( UIFont.systemFontOfSize(14.0), maxSize: CGSizeMake(100.0, 20.0)) + 40.0
            btn.frame = CGRectMake(cur_X, 0, width, CGRectGetHeight(self.bounds)-3)
            cur_X += width
            self.scorllView?.addSubview(btn)
            if index == 0 {
            btn.selected = true
            self.BottomLineView = UIView()
            self.BottomLineView?.frame = CGRectMake(10, CGRectGetMaxY(btn.frame), width-20, 3.0)
            self.BottomLineView?.backgroundColor = UIColor().M_Basic_red
            self.scorllView?.addSubview(self.BottomLineView!)
                
            }
        }
        self.scorllView?.contentSize = CGSizeMake(cur_X, 0);
    }
    

    @objc private func actionBtnType(sender: UIButton) {
    
        
    }
    
    @objc private func actionBtn(sender: UIButton) {
        
        for value in (self.scorllView?.subviews)! {
            if value.isKindOfClass(UIButton.classForCoder()) {
                let btn:UIButton = value as! UIButton
                btn.selected = false
            }
        }
        let centerX:CGFloat = sender.center.x;
        let distanceLeft:CGFloat = centerX - self.scorllView!.width/2
        let distanceRight:CGFloat = centerX + self.scorllView!.width/2;
        var point:CGPoint?
        if (distanceLeft > 0 && distanceRight < self.scorllView!.contentSize.width) {
            point = CGPointMake(distanceLeft, 0)
        }else if(distanceLeft < 0){
            point = CGPointZero
            
        }else if (distanceRight > self.scorllView!.contentSize.width){
            point = CGPointMake(self.scorllView!.contentSize.width-self.scorllView!.width, 0)
        }
        sender.selected = true
        UIView.animateWithDuration(0.25) {
            self.scorllView?.setContentOffset(point!, animated: false)
            self.BottomLineView?.frame = CGRectMake(sender.frame.origin.x+10, CGRectGetMaxY(sender.frame), CGRectGetWidth(sender.frame)-20, 3)
        }
        
        actionIndexCourse!(sender.tag,self.typesModel![sender.tag] as! MSegmentTypeModel)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
