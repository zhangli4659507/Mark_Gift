//
//  EHomePageViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/27.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit



class EHomePageViewController: MViewController,UITableViewDelegate,UITableViewDataSource {

    
    var curIndex = 0 {
    
        didSet{
            
           
        }
    }
    
    var  model:MSegmentTypeModel? = nil {
    
        didSet{
            self.requestData(true, isMore: false)
        }
    }
    
    private lazy var tableView: UITableView = {
    
        let tableView:UITableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .None
        return tableView
    }()
    
    var arrData: NSMutableArray? = NSMutableArray()
    var offset: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        tableView.mas_makeConstraints({ (make) in
            make.edges.equalTo()(self.view).insets()(UIEdgeInsetsZero)
            
        })
        self.tableView.tableViewRegiesterNibName("MChanelListCell")
//        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
    }

    func requestData(isHeader: Bool, isMore:Bool) {
    
        
        if isHeader {
            offset = 0
            arrData?.removeAllObjects()
        }
//        http://api.liwushuo.com/v2/channels/104/items_v2?ad=2&gender=2&generation=2&limit=10&offset=0
        let strUrl: String = "v2/channels/\(Int((model?.id)! as! NSNumber))/items_v2?gender=2&generation=2&limit=20&offset=\(offset)"
         MHttpTool.getRequestData(strUrl, success: { (response) in
            
            let basicModel:MListDataModel = MListDataModel.mj_objectWithKeyValues(response?.data)
            self.arrData?.addObjectsFromArray(basicModel.items!)
            self.tableView.reloadData()
            }) { (error) in
                
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrData?.count)!
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:MChanelListCell = tableView.dequeueReusableCellWithIdentifier("MChanelListCell") as! MChanelListCell
        cell.valueModel = arrData![indexPath.row] as? MGiftListModel
        
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 400
//    }
    
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
