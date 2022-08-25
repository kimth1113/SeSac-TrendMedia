//
//  BackupView.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/08/26.
//

import UIKit
import SnapKit

class BackupView: BaseView {

    let backupButton: UIButton = {
        let view = UIButton()
        view.setTitle("백업버튼", for: .normal)
        view.backgroundColor = .blue
        return view
    }()
    
    let restoreButton: UIButton = {
        let view = UIButton()
        view.setTitle("복구버튼", for: .normal)
        view.backgroundColor = .green
        return view
    }()
    
    
    override func configureUI() {
        [backupButton, restoreButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setContraints() {
        
        backupButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(restoreButton.snp.leading).offset(-20)
            make.width.equalTo(restoreButton.snp.width)
            make.height.equalTo(backupButton.snp.width).multipliedBy(1)
        }
        
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(backupButton.snp.width).multipliedBy(1)
        }
    }

}
