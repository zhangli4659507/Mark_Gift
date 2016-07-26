//
//  MHomeViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MHomeViewController: MViewController {
    
    
    var topView:MHomeSigmentView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
       
        createUI()
       
        
        MHttpTool.getRequestData("v2/channels/preset?gender=2&generation=2", success: { (response) in
            
            let arrTypes:NSMutableArray? = MSegmentTypeModel.mj_objectArrayWithKeyValuesArray(response?.data!["channels"])
            self.topView?.reloadData(arrTypes!, fentchFunc: { (model) -> String in
                return model.name!
            })
//            print("\(model.id)+\(model.name)+\(model.editable)")
            
            
            }) { (error) in
          print("error")
        }
        
        // Do any additional setup after loading the view.
    }

    
    func createUI(){
      self.topView = MHomeSigmentView(frame: CGRectZero, baseView: view)
      self.view.addSubview(self.topView!)
      self.topView?.mas_makeConstraints({ (make) in
        make.leading.top().trailing().equalTo()(self.view).offset()(0.0)
        make.height.offset()(55)
      })
        
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
