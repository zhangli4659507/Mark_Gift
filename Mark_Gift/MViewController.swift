//
//  MViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/25.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift


class MViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.automaticallyAdjustsScrollViewInsets = false;
        self.edgesForExtendedLayout = UIRectEdge.None
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
       
    let backIma = UIImage(named: "btnBack")?.imageWithRenderingMode(.AlwaysOriginal)
     return   UIBarButtonItem(image: backIma, style: .Done, target: self, action: #selector(MViewController.backAction(_:)))
    }
    
    @objc private func backAction (button:UIButton) {
    
        
        if backPop != nil {
            backPop!()
        }
        if self.navigationController?.viewControllers.count > 1 {
            self.navigationController?.popViewControllerAnimated(true)
        } else if self.navigationController != nil {
          self.navigationController?.dismissViewControllerAnimated(true, completion: { 
            
          })
        } else {
            self.dismissViewControllerAnimated(true, completion: { 
                
            })
        }
        
    }
    deinit {
    
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
