//
//  MTabBarController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/25.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit


class MTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.translucent = true
        for curItem in self.tabBar.items! {
        
        curItem.selectedImage = curItem.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
        curItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor(red: 66/255, green: 86 / 255, blue: 97 / 255, alpha: 1)], forState: UIControlState.Normal)
        curItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor(red: 225/255, green: 59 / 255, blue: 42 / 255, alpha: 1)], forState: UIControlState.Selected)
        }
        
        // Do any additional setup after loading the view.
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
