//
//  MCategoryViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MCategoryViewController: MViewController {

    var titleView:MCategorySegmentView?
    var singelVc:MSingelGoodsVc?
    var moreVc:MMoreGoodsVc?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
        self.addTitleView()
        self.initViewcontrollers()
        // Do any additional setup after loading the view.
    }

    func addTitleView() {
    
        titleView = NSBundle.mainBundle().loadNibNamed("MCategorySegmentView", owner: nil, options: nil).first as? MCategorySegmentView
        titleView?.frame = CGRectMake(0, 0, 80, 44)
        titleView?.backgroundColor=UIColor.clearColor()
        self.navigationItem.titleView = titleView
        
        
        weak var weakSelf = self
        titleView?.actionTap = {[weak titleView] (index:Int) in
        
        
            UIView.animateWithDuration(0.4, animations: {
                
                titleView?.centerContans.constant = index == 0 ? -20 : 20
                }, completion: { (state) in
                    
            })
            
            var fromVc:UIViewController?
            var toVc:UIViewController?
            
            if index == 0 {
                fromVc = weakSelf!.singelVc
                toVc = weakSelf!.moreVc
            } else {
                
                fromVc = weakSelf!.moreVc
                toVc = weakSelf!.singelVc
            }
            
            weakSelf?.transitionFromViewController(fromVc!, toViewController:toVc! , duration: 0.25, options: .TransitionNone, animations: { 
                
                }, completion: { (state) in
                    
            })
            
            toVc!.view.mas_makeConstraints { (make) in
                make.edges.equalTo()(weakSelf!.view).insets()(UIEdgeInsetsZero);
            }
        }
       
        
            
        
    }
    
    func initViewcontrollers() {
    
         singelVc  = MSingelGoodsVc()
         moreVc = MMoreGoodsVc()
        
        
        self.addChildViewController(moreVc!)
        self.addChildViewController(singelVc!)
        
        self.view.addSubview(moreVc!.view)
        moreVc!.view.mas_makeConstraints { (make) in
            make.edges.equalTo()(self.view).insets()(UIEdgeInsetsZero);
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
