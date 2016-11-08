//
//  MSingelGoodsVc.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/2.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit
import ObjectMapper
class MSingelGoodsVc: MViewController {

    var tableView:UITableView?
    var collectionView:UICollectionView?
    var arrData:[MSingleCategoryTitleModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.createTableVlew()
       self.createCollectionView()
       self.requestData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestData() {
    
        MHttpTool.getRequestData("v2/item_categories/tree", success: { (response) in
            self.arrData = Mapper<MSingleCategoryTitleModel>().mapArray(JSONArray: response?.data?["categories"] as! [[String : Any]])
//            self.arrData = Mapper<MSingleCategoryTitleModel>().mapArray(response?.data!["categories"])
            self.tableView?.reloadData()
            self.collectionView?.reloadData()
            }) { (error) in
                
        }
        
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
        tableView?.tableFooterView = UIView(frame: CGRect.zero)
        self.view.addSubview(tableView!)
        
        tableView?.mas_makeConstraints({ (make) in
            
           make?.top.bottom().left().equalTo()(self.view)?.offset()(0)
           make?.width.offset()(KScreenWidth/4)
        })
        
        tableView?.tableViewRegiesterNibName("MSingleTypeCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.arrData != nil) ? (self.arrData?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MSingleTypeCell = tableView.dequeueReusableCell(withIdentifier: "MSingleTypeCell") as! MSingleTypeCell
        let typeModel:MSingleCategoryTitleModel = self.arrData![indexPath.row]
        cell.lblTypeName.text = typeModel.name
        
        return cell
    }
    
    
}


extension MSingelGoodsVc:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func createCollectionView() {
    
    
        let flowLayOut:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        flowLayOut.itemSize = CGSize(width: KScreenWidth/4.0, height: KScreenWidth/4.0)
        flowLayOut.minimumLineSpacing = 0
        flowLayOut.minimumInteritemSpacing = 0
        flowLayOut.headerReferenceSize = CGSize(width: KScreenWidth*3.0/4, height: 20)
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayOut)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView!)
        
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.bottom().right().equalTo()(self.view)?.offset()(0)
            make?.left.equalTo()(self.tableView!.mas_right)?.offset()(0)
        })
        
        collectionView?.register(UINib(nibName: "MSingleGoodsCell", bundle: nil), forCellWithReuseIdentifier: "MSingleGoodsCell")
        
        collectionView?.register(UINib.init(nibName: "MSingleTypeTitleView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MSingleTypeTitleView")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return (self.arrData != nil) ? (self.arrData?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if self.arrData == nil {
        
            return 0
        }
        
        let typeModel:MSingleCategoryTitleModel = self.arrData![section]
        
        return (typeModel.subcategories?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MSingleGoodsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MSingleGoodsCell", for: indexPath) as! MSingleGoodsCell
        let typeModel:MSingleCategoryTitleModel = self.arrData![indexPath.section]
        let model:MSingleCategoryModel = typeModel.subcategories![indexPath.row]
        cell.lblGoodsName.text = model.name
        cell.imavGoods.sd_setImage(with: URL(string: model.icon_url!), placeholderImage: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
//        MSingleTypeTitleView
         let headView:MSingleTypeTitleView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MSingleTypeTitleView", for: indexPath) as! MSingleTypeTitleView
        if kind == UICollectionElementKindSectionHeader && self.arrData != nil {
            let typeModel:MSingleCategoryTitleModel = self.arrData![indexPath.section]
            headView.lblTypeTitle.text = typeModel.name
            return headView
        }
        
        return headView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        
    }
    

}






