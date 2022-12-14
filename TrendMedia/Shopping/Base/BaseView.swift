//
//  BaseView.swift
//  TrendMedia
//
//  Created by κΉνν on 2022/08/25.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    func configureUI() {
        self.backgroundColor = .black
    }
    
    func setContraints() { }
}
