//
//  MTypePushView.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/27.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MTypePushView: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    var collectionView:UICollectionView? = nil
    var selectIndexCourse:(Int->Void)?
    var typesArr:Array<MSegmentTypeModel>? {
        didSet {
        self.collectionView?.reloadData()
        }
    }
    var curSelectIndex:Int = 0 {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
   static let sizeWidth:CGFloat = {
    
        return KScreenWidth/4
    }()
   static let sizeHeight:CGFloat = {
    
        return (KScreenWidth/4)*(133/312.0)
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        self.selectIndexCourse = {(index) in
        
        }
        self.backgroundColor = UIColor.whiteColor()
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
    
        let flowOut:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowOut.minimumLineSpacing = 0.0
        flowOut.minimumInteritemSpacing = 0.0
        flowOut.itemSize = CGSizeMake(MTypePushView.sizeWidth, MTypePushView.sizeHeight)
        self.collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowOut)
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.registerNib( UINib(nibName: "MTypesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MTypesCollectionViewCell")
        self.addSubview(self.collectionView!)
        
        self.collectionView?.mas_makeConstraints({ (make) in
            make.edges.equalTo()(self).insets()(UIEdgeInsetsZero)
        })
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (typesArr != nil) ? (typesArr?.count)! : 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MTypesCollectionViewCell", forIndexPath: indexPath) as! MTypesCollectionViewCell
        let model = typesArr?[indexPath.row]
        cell.btnType.setTitle(model!.name, forState: .Normal)
        cell.btnType.selected = false
        cell.selectecLineView.hidden = true
        if indexPath.row == curSelectIndex {
            cell.btnType.selected = true
            cell.selectecLineView.hidden = false
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectIndexCourse!(indexPath.row)
    }
    
    
}
