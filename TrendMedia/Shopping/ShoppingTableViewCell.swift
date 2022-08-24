//
//  ShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit
import RealmSwift

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    var randomImage: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
