//
//  MTypesCollectionViewCell.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/27.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MTypesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var selectecLineView: UIView!
    @IBOutlet weak var bottomViewLine: UIView!
    @IBOutlet weak var btnType: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnType.setTitleColor(UIColor().M_Basic_red, for: .selected)
        btnType.isUserInteractionEnabled = false
        // Initialization code
    }

}
