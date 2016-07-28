//
//  MChanelListCell.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/28.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

class MChanelListCell: UITableViewCell {

    @IBOutlet weak var giftType: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorHead: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var gitftIma: UIImageView!
    
    @IBOutlet weak var giftTitle: UILabel!
    
    @IBOutlet weak var like_count: UILabel!
    var valueModel:MGiftListModel?  {
    
        didSet{
            if valueModel != nil {
                self .setUiValue()
            }
        }
        
    }
    
    func setUiValue()  {
      
        self.authorHead.sd_setImageWithURL(NSURL(string: (valueModel?.author?.avatar_url)!), placeholderImage: UIImage(named: "me_avatar_boy"))
        self.authorName.text = valueModel?.author?.nickname
        self.gitftIma.sd_setImageWithURL(NSURL(string: (valueModel?.cover_image_url)!), placeholderImage: UIImage(named: "logo"))
        self.giftType.text = valueModel?.column?.category
        self.title.text = valueModel?.column?.title
        self.giftTitle.text = valueModel?.title
        self.like_count.text = valueModel?.likes_count
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        self.authorHead.roundView(self.authorHead.width/2)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
