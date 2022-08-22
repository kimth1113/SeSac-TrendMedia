//
//  UITextField+Extension.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/19.
//

import UIKit

extension UITextField {
    
    func borderColor () {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.borderStyle = .none
    }
    
}
