//
//  MSingleTypeCell.swift
//  Mark_Gift
//
//  Created by Mark on 16/9/5.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MSingleTypeCell: UITableViewCell {

    @IBOutlet weak var lblTypeName: UILabel!
    @IBOutlet weak var viewSelected: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
