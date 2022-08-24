//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit
import RealmSwift
import CoreMIDI

enum sort: String {
    case byId = "objectId"
    case byTodo = "shoppingCheck"
    case byTitle = "shoppingItemTitle"
    case byFavorite = "shoppingFavorite"
}

class ShoppingTableViewController: UITableViewController {
    
    let localRealm = try! Realm()
    var tasks: Results<ShoppingItem>! {
        
        didSet {
            tableView.reloadData()
        }
    }
    
    var sortValue: sort = .byId
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 76
        
        designSearchButton()
        designItemTextField()
        
        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)
        print("-----======-=-=-=-", tasks)
        tableView.reloadData()
        

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(showSortAlert))
    }
    
    
    
    @objc
    func showSortAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let idSort = UIAlertAction(title: "등록순", style: .default) { action in
            self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sort.byId.rawValue, ascending: true)
            self.sortValue = .byId
        }
        let todoSort = UIAlertAction(title: "할일순", style: .default) { action in
            self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sort.byTodo.rawValue, ascending: true)
            self.sortValue = .byTodo
        }
        let titleSort = UIAlertAction(title: "제목순", style: .default) { action in
            self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sort.byTitle.rawValue, ascending: true)
            self.sortValue = .byTitle
        }
        let favoriteSort = UIAlertAction(title: "즐겨찾기순", style: .default) { action in
            self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sort.byFavorite.rawValue, ascending: false)
            self.sortValue = .byFavorite
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(idSort)
        alert.addAction(todoSort)
        alert.addAction(titleSort)
        alert.addAction(favoriteSort)
        alert.addAction(cancel)
        self.present(alert, animated: true)
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
        
        addItem()
    }
    
    @IBAction func returnedItemTextField(_ sender: UITextField) {
        
        addItem()
    }
    
    func addItem() {
        let randomImage: UIImage = UIImage(named: "HarryPotter\(Int.random(in: 1...8))")!
        
        if let itemTitle = itemTextField.text {
            
            try! localRealm.write {
                let newItem = ShoppingItem(shoppingItemTitle: itemTitle)
                localRealm.add(newItem)
                saveImageToDocument(fileName: "\(newItem.objectId)", image: randomImage)
            }
        } else {
            return
        }
        
        tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)
        view.endEditing(true)
        itemTextField.text = ""
    }
    
    func moveToDetail(objectId: ObjectId, checkImage: UIImage, itemTitle: String, starImage: UIImage) {
        let vc = DetailItemViewController()
        
        vc.mainView.checkView.image = checkImage
        vc.mainView.titleLabel.text = itemTitle
        vc.mainView.starView.image = starImage
        
        let randomImage = loadImageFromDocument(fileName: "\(objectId)")
        
        vc.mainView.randomImageView.image = randomImage
        
        let nav = UINavigationController(rootViewController: vc)
        
        self.present(nav, animated: true)
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
        
        print(indexPath.row)
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: nil) { action, view, completionHandler in
            
            let shoppingItem = self.tasks[indexPath.row]
            
            try! self.localRealm.write {
                self.removeImageFromDocument(fileName: "\(shoppingItem.objectId)")
                self.localRealm.delete(shoppingItem)
            }
            if self.sortValue == .byFavorite {
                self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: self.sortValue.rawValue, ascending: false)
            } else {
                self.tasks = self.localRealm.objects(ShoppingItem.self).sorted(byKeyPath: self.sortValue.rawValue, ascending: true)
            }
        }
        delete.image = UIImage(systemName: "trash.fill")
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ShoppingTableViewCell else { return }
        
        let checkImage = cell.checkButton.imageView?.image
        let itemTitle = cell.shoppingItemLabel.text!
        let starImage = cell.starButton.imageView?.image
        
        let objectId = tasks[indexPath.row].objectId
        
        moveToDetail(objectId: objectId, checkImage: checkImage!, itemTitle: itemTitle, starImage: starImage!)
    }
    
    @objc
    func checkButtonClicked(_ button: UIButton) {

        var shoppingItem: ShoppingItem?
        
        if sortValue == .byFavorite {
            shoppingItem = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: false)[button.tag]
        } else {
            shoppingItem = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)[button.tag]
        }
        
        guard let shoppingItem = shoppingItem else {
            return
        }        
        
        print(button.tag)
        
        //let dog = realm.objects(Dog.self).first!
        try! localRealm.write {

            shoppingItem.shoppingCheck = !shoppingItem.shoppingCheck
        }

        
        if sortValue == .byFavorite {
            tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: false)
        } else {
            tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)
        }
        
    }
    
    @objc
    func starButtonClicked(_ button: UIButton) {
        
        var shoppingItem: ShoppingItem?
        
        if sortValue == .byFavorite {
            shoppingItem = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: false)[button.tag]
        } else {
            shoppingItem = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)[button.tag]
        }
        
        guard let shoppingItem = shoppingItem else {
            return
        }

        try! localRealm.write {

            shoppingItem.shoppingFavorite = !shoppingItem.shoppingFavorite
        }

        if sortValue == .byFavorite {
            tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: false)
        } else {
            tasks = localRealm.objects(ShoppingItem.self).sorted(byKeyPath: sortValue.rawValue, ascending: true)
        }
    }
    
}
