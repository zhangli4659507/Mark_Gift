
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
    private var pushViewState = true
    private var curSelectIndex:Int = 0
//        {
//        didSet {
//        self.pushView.curSelectIndex = self.curSelectIndex
//            
//            for view in (self.scorllView?.subviews)! {
//                if view.isKindOfClass(UIButton) {
//                    if view.tag == self.curSelectIndex {
//                        self.actionBtn(view as! UIButton)
//                    }
//                }
//            }
//        }
//    }
    
    private lazy var coverLabel: UILabel = {
    
        let label = UILabel()
        label.backgroundColor = UIColor().M_Hex_LightGray
        label.text = "        切换频道"
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor().M_Hex_GrayTextColor
        return label
    }()
    
    private lazy var pushBaseView: UIView = {
    
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.5
        return view
        
    }()
    
    private lazy var pushView: MTypePushView = {
    
        let pushView = MTypePushView()
        
        return pushView
        
    }()
    
    private lazy var clearView: UIView = {
    
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clearColor()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(MHomeSigmentView.actionTap))
        clearView.addGestureRecognizer(tap)
        
        return clearView
        
    }()
    
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
        typeBtn?.addTarget(self, action: #selector(MHomeSigmentView.actionBtnType(_:)), forControlEvents: .TouchUpInside)
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
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor().M_Line_color
        self.addSubview(lineView)
        lineView.mas_makeConstraints { (make) in
            make.leading.bottom().trailing().equalTo()(self).offset()(0.0)
            make.height.offset()(-0.5)
        }
        
        self.addSubview(self.coverLabel)
        self.coverLabel.hidden = true
        self.coverLabel.mas_makeConstraints { (make) in
            make.bottom.equalTo()(self).offset()(0.5)
            make.leading.top().bottom().equalTo()(self).offset()(0)
            make.trailing.equalTo()(self.typeBtn?.mas_leading).offset()(0)
        }
        
    }
    
    func reloadData(dataArr:NSMutableArray,fentchFunc:(model:MSegmentTypeModel)->String)  {
        var cur_X:CGFloat = 0
        self.typesModel = dataArr
        self.scorllView?.removeAllSubViews()
        self.pushView.typesArr = dataArr
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

        
        self.pushBaseView.hidden = true
        self.clearView.hidden = true
        self.baseView?.addSubview(self.pushBaseView)
        self.baseView?.addSubview(self.clearView)
        self.pushBaseView.mas_makeConstraints { (make) in
            make.edges.equalTo()(self.baseView).insets()(UIEdgeInsetsMake(55, 0, 0, 0))
        }
        self.clearView.mas_makeConstraints { (make) in
            make.edges.equalTo()(self.baseView).insets()(UIEdgeInsetsMake(55, 0, 0, 0))
        }
        
        self.clearView.addSubview(self.pushView)
        self.pushView.mas_makeConstraints { (make) in
            make.top.equalTo()(self.clearView).offset()(0)
            make.height.offset()(0.5)
            make.leading.trailing().equalTo()(self.clearView).offset()(0.0)
        }
        
        self.pushView.selectIndexCourse = {index in
            for view in (self.scorllView?.subviews)! {
                if view.isKindOfClass(UIButton) && view.tag == index {
                    self.actionBtn(view as! UIButton)
                }
            }
            
        }
        self.clearView.layoutIfNeeded()
    }
    
    @objc private func actionTap(){
    
       self.actionBtnType(self.typeBtn!)
    }
    
    @objc private func actionBtnType(sender: UIButton) {
        let height = ceil(CGFloat(typesModel!.count)/4.0) * MTypePushView.sizeHeight
        pushViewState = !pushViewState
        self.coverLabel.hidden = pushViewState
        if pushViewState {
            sender.backgroundColor = UIColor.whiteColor()
            
            UIView.animateWithDuration(0.25, delay: 0, options: UIViewAnimationOptions.LayoutSubviews, animations: {
                self.pushView.mas_updateConstraints({ (make) in
                    make.height.offset()(0.5)
                })
                self.pushView.layoutIfNeeded()
                }, completion: { (state) in
                    self.pushBaseView.hidden = self.pushViewState
                    self.clearView.hidden = self.pushViewState
            })
        } else {
         sender.backgroundColor = UIColor().M_Hex_LightGray
          self.pushBaseView.hidden = self.pushViewState
          self.clearView.hidden = self.pushViewState
            UIView.animateWithDuration(0.25, delay: 0, options: UIViewAnimationOptions.LayoutSubviews, animations: {
                self.pushView.mas_updateConstraints({ (make) in
                    make.height.offset()(height)
                })
                self.pushView.layoutIfNeeded()
                }, completion: { (state) in
                    
            })
        }
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
        }
        UIView.animateWithDuration(0.45) {
            
            self.BottomLineView?.frame = CGRectMake(sender.frame.origin.x+10, CGRectGetMaxY(sender.frame), CGRectGetWidth(sender.frame)-20, 3)
        }
        self.curSelectIndex  = sender.tag
        self.pushView.curSelectIndex = sender.tag
        self.clearView.layoutIfNeeded()
        if !pushViewState {
            self.actionBtnType(self.typeBtn!)
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
