//
//  DetailItemViewController.swift
//  TrendMedia
//
//  Created by κΉνν on 2022/08/25.
//

import UIKit

class DetailItemViewController: UIViewController {

    let mainView = DetailView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
    }

}
