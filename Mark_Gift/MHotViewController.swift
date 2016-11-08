//
//  MHotViewController.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import ObjectMapper
class MHotViewController: MViewController {

    var flowLayOut: UICollectionViewFlowLayout?
    
    var collectionView: UICollectionView?
    var dataList:[MHotList]?
//    MHttpTool
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
        
        self.initCollectionView()
        self.requestData()
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

private extension MHotViewController {
    func initCollectionView()  {
        
        self.flowLayOut = UICollectionViewFlowLayout()
        let itemWid = (KScreenWidth-24)/2.0
        let h = itemWid*798/580
        self.flowLayOut?.itemSize = CGSize(width: itemWid, height: h)
        self.flowLayOut?.minimumLineSpacing = 8
        self.flowLayOut?.minimumInteritemSpacing = 8
        self.flowLayOut?.sectionInset  = UIEdgeInsetsMake(10, 8, 10, 8)
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.flowLayOut!)
        self.collectionView?.backgroundColor = UIColor(rgba: "#f5f5f5")
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.mas_makeConstraints({ (make) in
            make?.edges.equalTo()(self.view)?.insets()(UIEdgeInsets.zero)
        })
        
        
        self.collectionView?.register(UINib(nibName: "MHotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MHotCollectionViewCell")
        
    }
    
    func requestData () {
    
        MHttpTool.getRequestWithParameters("v2/items", parameters: ["gender":1 as Optional<AnyObject>,"limit":20 as Optional<AnyObject>,"offset":0 as Optional<AnyObject>,"generation":0 as Optional<AnyObject>], success: { (response) in
            self.dataList = Mapper<MHotList>().mapArray(JSONObject: response?.data?["items"])
//            self.dataList = Mapper<MHotList>().mapArray(response?.data!["items"])
            self.collectionView?.reloadData()
            }) { (error) in
                
        }
        
    }
    
}


extension MHotViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        
        if let value = self.dataList {
        
            return value.count
        } else {
        
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MHotCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MHotCollectionViewCell", for: indexPath) as! MHotCollectionViewCell
        
        let model:MHotList = self.dataList![indexPath.item] 
        cell.configCellWithModel(model.data!)
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//    
//        let itemWid = (KScreenWidth-30)/2.0
//        let h = itemWid*798/580
//        
//        return CGSizeMake(itemWid, h)
//    }
    
}

