//
//  MViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/25.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit



class MViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = createBackBarItem()
        // Do any additional setup after loading the view.
    }

    var backPop:(()->Void)?
    
    
    func createBackBarItem() -> UIBarButtonItem {
        let bactItem = UIButton(type: .Custom)
        bactItem.setBackgroundImage(UIImage(named: "back"), forState: .Normal)
        bactItem.addTarget(self, action: #selector(MViewController.backAction(_:)), forControlEvents: .TouchUpInside)
         return UIBarButtonItem(customView: bactItem)
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
