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
    
        titleView = Bundle.main.loadNibNamed("MCategorySegmentView", owner: nil, options: nil)?.first as? MCategorySegmentView
        titleView?.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        titleView?.backgroundColor=UIColor.clear
        self.navigationItem.titleView = titleView
        
        
        weak var weakSelf = self
        titleView?.actionTap = {[weak titleView] (index:Int) in
        
        
            UIView.animate(withDuration: 0.4, animations: {
                
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
            
            weakSelf?.transition(from: fromVc!, to:toVc! , duration: 0.25, options: UIViewAnimationOptions(), animations: { 
                
                }, completion: { (state) in
                    
            })
            
            toVc!.view.mas_makeConstraints { (make) in
                make?.edges.equalTo()(weakSelf!.view)?.insets()(UIEdgeInsets.zero);
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
            make?.edges.equalTo()(self.view)?.insets()(UIEdgeInsets.zero);
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
