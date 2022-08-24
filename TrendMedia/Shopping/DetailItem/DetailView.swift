//
//  DetailView.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/08/25.
//

import UIKit
import SnapKit

class DetailView: BaseView {

    let checkView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    let starView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    let randomImageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    override func configureUI() {
        [checkView, titleLabel, starView, randomImageView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setContraints() {
        
        checkView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(checkView.snp.top)
            make.bottom.equalTo(checkView.snp.bottom)
            make.leading.equalTo(checkView.snp.trailing).offset(12)
            make.width.equalTo(200)
        }
        
        starView.snp.makeConstraints { make in
            make.top.equalTo(checkView.snp.top)
            make.bottom.equalTo(checkView.snp.bottom)
            make.leading.equalTo(titleLabel.snp.trailing).offset(12)
            make.width.equalTo(50)
        }
        
        randomImageView.snp.makeConstraints { make in
            make.leading.equalTo(checkView.snp.leading)
            make.trailing.equalTo(starView.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.height.equalTo(self.snp.width).multipliedBy(1)
        }
    }
    
}
