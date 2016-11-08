
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
    fileprivate var baseView:UIView?
    fileprivate var BottomLineView:UIView?
    fileprivate var scorllView:UIScrollView?
    fileprivate var typesModel:Array<MSegmentTypeModel>?
    fileprivate var typeBtn:UIButton?
    fileprivate var pushViewState = true
    fileprivate var curSelectIndex:Int = 0
    fileprivate lazy var coverLabel: UILabel = {
    
        let label = UILabel()
        label.backgroundColor = UIColor().M_Hex_LightGray
        label.text = "        切换频道"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor().M_Hex_GrayTextColor
        return label
    }()
    
    fileprivate lazy var pushBaseView: UIView = {
    
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.5
        return view
        
    }()
    
    fileprivate lazy var pushView: MTypePushView = {
    
        let pushView = MTypePushView()
        return pushView
        
    }()
    
    fileprivate lazy var clearView: UIView = {
    
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clear
        let control = UIControl()
        clearView.addSubview(control)
        control.mas_makeConstraints({ (make) in
          make?.edges.equalTo()(clearView)?.insets()(UIEdgeInsets.zero)
        })
        control.addTarget(self, action: #selector(MHomeSigmentView.actionTap), for: .touchUpInside)
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

    func changeCurIndex(_ index: Int)  {
        for view in (self.scorllView?.subviews)! {
            if view.isKind(of: UIButton.self) && view.tag == index {
                self.actionBtn(view as! UIButton)
            }
        }
    }
    
    func reloadData(_ dataArr:Array<MSegmentTypeModel>,fentchFunc:(_ model:MSegmentTypeModel)->String)  {
        var cur_X:CGFloat = 0
        self.typesModel = dataArr
        self.scorllView?.removeAllSubViews()
        self.pushView.typesArr = dataArr
        for index in 0 ..< dataArr.count {
            let model:MSegmentTypeModel = dataArr[index]
            let name = fentchFunc(model)
            let btn:UIButton = UIButton(type: .custom)
            btn.setTitleColor(UIColor().M_Hex_333, for: UIControlState())
            btn.setTitleColor(UIColor().M_Basic_red, for: .selected)
            btn.showsTouchWhenHighlighted = false
            btn.setTitle(name, for: UIControlState())
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            btn.tag = index
            btn.addTarget(self, action: #selector(MHomeSigmentView.actionBtn(_:)), for: .touchUpInside)
            let width = name.stringWidth( UIFont.systemFont(ofSize: 14.0), maxSize: CGSize(width: 100.0, height: 20.0)) + 40.0
            btn.frame = CGRect(x: cur_X, y: 0, width: width, height: self.bounds.height-3)
            cur_X += width
            self.scorllView?.addSubview(btn)
            if index == 0 {
            btn.isSelected = true
            self.BottomLineView = UIView()
            self.BottomLineView?.frame = CGRect(x: 10, y: btn.frame.maxY, width: width-20, height: 3.0)
            self.BottomLineView?.backgroundColor = UIColor().M_Basic_red
            self.scorllView?.addSubview(self.BottomLineView!)
                
            }
        }
        self.scorllView?.contentSize = CGSize(width: cur_X, height: 0);

        self.pushBaseView.isHidden = true
        self.baseView?.addSubview(self.pushBaseView)
        self.pushBaseView.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.baseView)?.insets()(UIEdgeInsetsMake(55, 0, 0, 0))
        }
        
        self.clearView.isHidden = true
        self.baseView?.addSubview(self.clearView)
        self.clearView.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.baseView)?.insets()(UIEdgeInsetsMake(55, 0, 0, 0))
        }

        self.clearView.addSubview(self.pushView)
        self.clearView.bringSubview(toFront: self.pushView)
        self.pushView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.clearView)?.offset()(0)
            make?.height.offset()(0.5)
            make?.leading.trailing().equalTo()(self.clearView)?.offset()(0.0)
        }
        
        self.pushView.selectIndexCourse = {index in
            self.changeCurIndex(index)
        }
        self.clearView.layoutIfNeeded()
    }
}


private extension MHomeSigmentView {

    func caretaUI() {
        
        self.typeBtn = UIButton(type: .custom)
        self.addSubview(self.typeBtn!)
        self.typeBtn?.adjustsImageWhenDisabled = false
        self.typeBtn?.adjustsImageWhenHighlighted = false
        typeBtn?.addTarget(self, action: #selector(MHomeSigmentView.actionBtnType(_:)), for: .touchUpInside)
        self.typeBtn?.mas_makeConstraints({ (make) in
            make?.top.bottom().trailing().equalTo()(self)?.offset()(0)
            make?.width.offset()(55)
            self.typeBtn?.setImage(UIImage(named: "giftcategorydetail_arrow_down_gray"), for: UIControlState())
        })
        
        self.scorllView = UIScrollView(frame: self.bounds)
        self.addSubview(self.scorllView!)
        self.scorllView?.showsHorizontalScrollIndicator = false
        self.scorllView?.mas_makeConstraints({ (make) in
            make?.top.leading().bottom().equalTo()(self)?.offset()(0)
            make?.trailing.equalTo()(self.typeBtn?.mas_leading)?.offset()(0)
        })
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor().M_Line_color
        self.addSubview(lineView)
        lineView.mas_makeConstraints { (make) in
            
            make?.leading.bottom().trailing().equalTo()(self)?.offset()(0.0)
            make?.height.offset()(0.5)
        }
        
        self.addSubview(self.coverLabel)
        self.coverLabel.isHidden = true
        self.coverLabel.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(self)?.offset()(-0.5)
            make?.leading.top().equalTo()(self)?.offset()(0)
            make?.trailing.equalTo()(self.typeBtn?.mas_leading)?.offset()(0)
        }
        
    }
    
//    MARK:ActionFUNC
    @objc func actionTap() {
        
        self.actionBtnType(self.typeBtn!)
    }
    
    @objc func actionBtnType(_ sender: UIButton) {
        let height = ceil(CGFloat(typesModel!.count)/4.0) * MTypePushView.sizeHeight
        pushViewState = !pushViewState
        self.coverLabel.isHidden = pushViewState
        if pushViewState {
            sender.backgroundColor = UIColor.white
            
            UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.layoutSubviews, animations: {
                self.pushView.mas_updateConstraints({ (make) in
                    make?.height.offset()(0.5)
                })
                self.pushView.layoutIfNeeded()
                }, completion: { (state) in
                    self.pushBaseView.isHidden = self.pushViewState
                    self.clearView.isHidden = self.pushViewState
            })
        } else {
            sender.backgroundColor = UIColor().M_Hex_LightGray
            self.pushBaseView.isHidden = self.pushViewState
            self.clearView.isHidden = self.pushViewState
            UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.layoutSubviews, animations: {
                self.pushView.mas_updateConstraints({ (make) in
                    make?.height.offset()(height)
                })
                self.pushView.layoutIfNeeded()
                }, completion: { (state) in
                    
            })
        }
    }
    
    @objc func actionBtn(_ sender: UIButton) {
        
        for value in (self.scorllView?.subviews)! {
            if value.isKind(of: UIButton.classForCoder()) {
                let btn:UIButton = value as! UIButton
                btn.isSelected = false
            }
        }
        let centerX:CGFloat = sender.center.x;
        let distanceLeft:CGFloat = centerX - self.scorllView!.width/2
        let distanceRight:CGFloat = centerX + self.scorllView!.width/2;
        var point:CGPoint?
        if (distanceLeft > 0 && distanceRight < self.scorllView!.contentSize.width) {
            point = CGPoint(x: distanceLeft, y: 0)
        }else if(distanceLeft < 0){
            point = CGPoint.zero
            
        }else if (distanceRight > self.scorllView!.contentSize.width){
            point = CGPoint(x: self.scorllView!.contentSize.width-self.scorllView!.width, y: 0)
        }
        sender.isSelected = true
        UIView.animate(withDuration: 0.25, animations: {
            self.scorllView?.setContentOffset(point!, animated: false)
        }) 
        UIView.animate(withDuration: 0.45, animations: {
            
            self.BottomLineView?.frame = CGRect(x: sender.frame.origin.x+10, y: sender.frame.maxY, width: sender.frame.width-20, height: 3)
        }) 
        self.curSelectIndex  = sender.tag
        self.pushView.curSelectIndex = sender.tag
        self.clearView.layoutIfNeeded()
        if !pushViewState {
            self.actionBtnType(self.typeBtn!)
        }
        
        actionIndexCourse!(sender.tag,self.typesModel![sender.tag] )
    }
  
}



