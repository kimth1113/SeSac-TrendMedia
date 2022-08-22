//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit
import RealmSwift

class ShoppingTableViewController: UITableViewController {
    
    let localRealm = try! Realm()
    var tasks: Results<ShoppingItem>!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 76
        
        designSearchButton()
        designItemTextField()
        
        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: "objectId", ascending: true)
        print("-----======-=-=-=-", tasks)
        tableView.reloadData()
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
        
        if let itemTitle = itemTextField.text {
            
            try! localRealm.write {
                let newItem = ShoppingItem(shoppingItemTitle: itemTitle)
                localRealm.add(newItem)
            }
        } else {
            return
        }
        
        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: "objectId", ascending: true)
        view.endEditing(true)
        itemTextField.text = ""
        tableView.reloadData()
    }
    
    @IBAction func returnedItemTextField(_ sender: UITextField) {
        
        if let itemTitle = itemTextField.text {
            
            try! localRealm.write {
                let newItem = ShoppingItem(shoppingItemTitle: itemTitle)
                localRealm.add(newItem)
            }
        } else {
            return
        }
        
        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: "objectId", ascending: true)
        view.endEditing(true)
        itemTextField.text = ""
        tableView.reloadData()
    }
    
    
}


extension ShoppingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        
        cell.checkButton.tintColor = .black
        cell.checkButton.setTitle("", for: .normal)
        
        cell.starButton.tintColor = .black
        cell.starButton.setTitle("", for: .normal)
        
//        cell.idx = indexPath.row
        
        cell.shoppingItemLabel.text = tasks[indexPath.row].shoppingItemTitle
        
        tasks[indexPath.row].shoppingCheck ?
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        : cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
        tasks[indexPath.row].shoppingFavorite ?
        cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        : cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    func checkButtonClicked(_ button: UIButton) {

        let task = localRealm.objects(ShoppingItem.self)[button.tag]

        try! localRealm.write {

            task.shoppingCheck = !task.shoppingCheck
        }

        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: "objectId", ascending: true)
        tableView.reloadData()
    }
    
    @objc
    func starButtonClicked(_ button: UIButton) {
        
        let task = localRealm.objects(ShoppingItem.self)[button.tag]

        try! localRealm.write {

            task.shoppingFavorite = !task.shoppingFavorite
        }

        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: "objectId", ascending: true)
        tableView.reloadData()
    }
    
}
