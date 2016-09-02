//
//  MHotCollectionViewCell.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/1.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MHotCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblGoodsTitle: UILabel!
    @IBOutlet weak var lblGoodsFavNum: UILabel!
    @IBOutlet weak var lblGoodPrice: UILabel!
    @IBOutlet weak var imavGoods: UIImageView!
    
    func configCellWithModel(model:MHotListData) {
        self.lblGoodsFavNum.text = String(model.favorites_count!)
        self.lblGoodPrice.text = "¥" + model.price!
        self.lblGoodsTitle.text = model.name
        self.imavGoods.sd_setImageWithURL(NSURL(string: model.cover_image_url!), placeholderImage: UIImage(named: "me_avatar_boy"))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.whiteColor()
        self.roundViewAndLine(4, borderWidth: 0.5, lineColor: UIColor(rgba: "#dbdbdb"))
        // Initialization code
    }

}
