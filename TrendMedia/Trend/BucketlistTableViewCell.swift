//
//  BucketlistTableViewCell.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/19.
//

import UIKit

class BucketlistTableViewCell: UITableViewCell {
    
    static let identifier = "BucketlistTableViewCell"

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var bucketlistLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
