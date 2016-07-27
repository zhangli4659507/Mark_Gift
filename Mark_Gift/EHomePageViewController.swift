//
//  EHomePageViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/27.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class EHomePageViewController: MViewController {

    
    var curIndex = 0 {
    
        didSet{
            
           
        }
    }
    
    var  model:MSegmentTypeModel? = nil {
    
        didSet{
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: self.view.bounds)
        label.backgroundColor = UIColor.yellowColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(20)
        label.text = String(curIndex)
        self.view.addSubview(label)
//        self.view.backgroundColor = UIColor.redColor()
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
