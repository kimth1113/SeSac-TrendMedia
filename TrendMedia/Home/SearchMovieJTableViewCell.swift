//
//  SearchMovieJTableViewCell.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit

class SearchMovieJTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    /// 셀에 데이터를 넣어주는 역할
    /// - Parameter data: 영화 정보
    func configureCell(data: Movie2) {
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.text = data.title
        releaseLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        overviewLabel.text = data.overView
        
    }
}
