//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 76
        
        designSearchButton()
        designItemTextField()
    }


    func designSearchButton() {
        searchButton.setTitle("추가", for: .normal)
        searchButton.backgroundColor = .systemGray5
        searchButton.layer.cornerRadius = 8
        searchButton.tintColor = .black
    }
    
    func designItemTextField() {
        itemTextField.backgroundColor = .systemGray6
        itemTextField.borderStyle = .none
        itemTextField.layer.cornerRadius = 10
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: itemTextField.frame.height))
        itemTextField.leftView = paddingView
        itemTextField.leftViewMode = .always
    }
    
    
    @IBAction func tapSearchButton(_ sender: UIButton) {
        shoppingList.append(itemTextField.text!)
        
        print(shoppingList)
        
        tableView.reloadData()
    }
    
    @IBAction func returnedItemTextField(_ sender: UITextField) {
        shoppingList.append(sender.text!)
        
        print(shoppingList)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        
        cell.shoppingItemLabel.text = shoppingList[indexPath.row]
        
        cell.checkListImg.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        cell.checkListImg.tintColor = .black
        cell.checkListImg.setTitle("", for: .normal)
                
        cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        cell.starButton.tintColor = .black
        cell.starButton.setTitle("", for: .normal)
        
        
        return cell
    }
}
