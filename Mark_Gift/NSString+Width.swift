//
//  NSString+Width.swift
//  Mark_Gift
//
//  Created by Mark on 16/7/26.
//  Copyright © 2016年 Mark. All rights reserved.
//

import UIKit

extension NSString {

    func stringWidth(_ font:UIFont, maxSize:CGSize) -> CGFloat {
        
        let rect:CGRect = self.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
            return rect.size.width
        
        
    }
}
