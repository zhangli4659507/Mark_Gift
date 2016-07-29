//
//  MHomeViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import ObjectMapper

class MHomeViewController: MViewController {
    
    var topView:MHomeSigmentView?
    var pageVc:UIPageViewController?
    var viewcontrollers:[EHomePageViewController] = Array()
    var types:Array<MSegmentTypeModel>?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
       
        createUI()
       MHttpTool.getRequestWithParameters("v2/channels/preset", parameters: ["gender":2,"generation":2], success: { (response) in
        let arrTypes = Mapper<MSegmentTypeModel>().mapArray(response?.data!["channels"])
        self.types = arrTypes
        self.topView?.reloadData(arrTypes!, fentchFunc: { (model) -> String in
            return model.name!
        })
        self.initViewcontrollers(arrTypes!)
        }) { (error) in
            
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

//MARK: privtaExtension
private extension MHomeViewController {
    
    func createUI(){
        self.topView = MHomeSigmentView(frame: CGRectZero, baseView: view)
        self.view.addSubview(self.topView!)
        self.topView?.actionIndexCourse = {(index,model) in
            
            let vc:EHomePageViewController = self.viewcontrollers[index]
            if vc.model == nil {
                vc.model = model
            }
            self.pageVc?.setViewControllers([vc], direction: .Forward, animated: true, completion: { (state) in
                
            })
        }
        self.topView?.mas_makeConstraints({ (make) in
            make.leading.top().trailing().equalTo()(self.view).offset()(0.0)
            make.height.offset()(55)
        })
        
        self.pageVc = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options:  nil)
        self.addChildViewController(self.pageVc!)
        self.view.addSubview((self.pageVc?.view)!)
        self.pageVc?.delegate = self
        self.pageVc?.dataSource = self
        self.pageVc?.view.mas_makeConstraints({ (make) in
            make.top.equalTo()(self.topView?.mas_bottom).offset()(0)
            make.bottom.leading().trailing().equalTo()(self.view).offset()(0)
        })
    }
    
    func initViewcontrollers(types: Array<MSegmentTypeModel>) {
        
        for index in 0 ..< types.count  {
            let vc:EHomePageViewController = EHomePageViewController()
            vc.curIndex = index
            viewcontrollers.append(vc)
        }
        if types.count > 0 {
            let vc:EHomePageViewController = viewcontrollers[0]
            vc.model = types[0]
            self.pageVc?.setViewControllers([vc], direction: .Forward, animated: true, completion: { (state) in
                
            })
        }
    }
    
}

//MARK:pageviewControllerDelegate
extension MHomeViewController:UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let curVc:EHomePageViewController = viewController as!EHomePageViewController
        self.topView?.changeCurIndex(curVc.curIndex)
        if curVc.model == nil {
            curVc.model = types![curVc.curIndex]
        }
        
        let index:Int = curVc.curIndex + 1
        if index == viewcontrollers.count {
            return nil
        }
        return viewcontrollers[index]
    }
    
    func  pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let curVc:EHomePageViewController = viewController as!EHomePageViewController
        self.topView?.changeCurIndex(curVc.curIndex)
        if curVc.model == nil {
            curVc.model = types![curVc.curIndex]
        }
        let index:Int = curVc.curIndex - 1
        if index < 0 || index == NSNotFound {
            return nil
        }
        return viewcontrollers[index]
    }
    
}

