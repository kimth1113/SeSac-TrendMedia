//
//  TwoViewController.swift
//  TrendMedia
//
//  Created by κΉνν on 2022/07/21.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "222"
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
