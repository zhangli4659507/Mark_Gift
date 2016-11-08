//
//  MViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/25.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}



class MViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.automaticallyAdjustsScrollViewInsets = false;
        self.edgesForExtendedLayout = UIRectEdge()
        self.extendedLayoutIncludesOpaqueBars = false;
        self.modalPresentationCapturesStatusBarAppearance = false;
        navigationItem.leftBarButtonItem = createBackBarItem()
        
        // Do any additional setup after loading the view.
    }

    var backPop:(()->Void)?
    /**
     创建返回按钮
     
     - returns: 返回按钮
     */
    func createBackBarItem() -> UIBarButtonItem {
       
    let backIma = UIImage(named: "btnBack")?.withRenderingMode(.alwaysOriginal)
     return   UIBarButtonItem(image: backIma, style: .done, target: self, action: #selector(MViewController.backAction(_:)))
    }
    
    @objc fileprivate func backAction (_ button:UIButton) {
    
        
        if backPop != nil {
            backPop!()
        }
        if self.navigationController?.viewControllers.count > 1 {
            self.navigationController?.popViewController(animated: true)
        } else if self.navigationController != nil {
          self.navigationController?.dismiss(animated: true, completion: { 
            
          })
        } else {
            self.dismiss(animated: true, completion: { 
                
            })
        }
        
    }
    deinit {
    
        NotificationCenter.default.removeObserver(self)
        print("\(NSStringFromClass(self.classForCoder)) deInit")
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
