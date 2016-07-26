//
//  MNavController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/25.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MNavController: UINavigationController {

    override func viewDidLoad() {
    super.viewDidLoad()
    let color = UIColor(rgba: "#ff2d47")
    UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
    self.navigationBar.barTintColor = color
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont(name:"Helvetica",size:17)!]
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
