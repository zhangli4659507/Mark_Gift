//
//  MSingelGoodsVc.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/2.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MSingelGoodsVc: MViewController {

    var tableView:UITableView?
    var collectionView:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()

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

extension MSingelGoodsVc:UITableViewDelegate,UITableViewDataSource {

    
    func createTableVlew() {
    
        
        tableView = UITableView(frame: self.view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(tableView!)
        
        tableView?.mas_makeConstraints({ (make) in
            
           make.top.bottom().left().equalTo()(self.view).offset()(0)
           make.width.offset()(KScreenWidth/4)
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


extension MSingelGoodsVc:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func createCollectionView() {
    
    
        let flowLayOut:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        flowLayOut.itemSize = CGSizeZero
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayOut)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        
        collectionView?.mas_makeConstraints({ (make) in
            make.top.bottom().right().equalTo()(self.view).offset()(0)
            make.left.equalTo()(self.tableView!.mas_right).offset()(0)
        })
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}






