//
//  UIViewController+Extension.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor () {
        view.backgroundColor = .orange
    }
    
    func showAlert (alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


