//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketlistTableViewController: UITableViewController {

    static let identifier = "BucketlistTableViewController"
    
    //전달 1.
    var textfieldPlaceholder: String?
    //옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    //placeholder 자체가 옵셔널이라면?
    //하지만 String Interpolation이라면?
    
    // 클래스는 ReferenceType -> 인스턴스 자체를 변경하지 않는 이상 한 번만 될 거다!
    // IBOutlet ViewDidLoad 호출 직전에 nil이 아닌 지 nil인지 알 수 있음!
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("텍스트필드 DidSet")
        }
    }
    
    //list 프로퍼티가 추가, 삭제 등 변경되고 나서 테이블뷰 항상 갱신!
    var list = [
        Todo(title: "범죄도시", done: true),
        Todo(title: "탑건", done: false)
    ] {
        didSet {
            tableView.reloadData()
            print("list가 변경됨 \(list), \(oldValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //전달 3.
        userTextField.placeholder = "\(textfieldPlaceholder ?? "컨텐츠")를 입력해보세요"

        navigationItem.title = "버킷리스트"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        
//        list.append("마녀")
//        list.append("겨울왕국")
    }
                                                           
    @objc
    func closeButtonClicked() {
        self.dismiss(animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    // Cell 편집 적용!!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewCell.identifier, for: indexPath) as! BucketlistTableViewCell
        
        cell.checkboxButton.setTitle("", for: .normal)
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkboxButtonClicked(sender:)), for: .touchUpInside)
        
        list[indexPath.row].done
        ? cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        : cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
        return cell
    }
    
    @objc
    func checkboxButtonClicked(sender: UIButton) {
        print("\(sender.tag)번째 버튼 클릭")
        
        list[sender.tag].done = !list[sender.tag].done
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        //sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    
    
    // 편집 가능 여부
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    //우측 스ㅘ이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            //tableView.reloadData()
            //tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .none)
        }
    }
    
    
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기 버튼, 핀고정
//    }
//
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //차단
//    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) { //띄어스기, 엔터 제거 // 비어있는지, 2~6 글자인지
//            list.append(value)
//            tableView.reloadData()
//        } else {
//            //토스트 메시지 띄우기
//        }
//
        //아래와 동일
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
//            //Alert, Toast를 통해서 알려줌
//            return
//        }
        
        list.append(Todo(title: sender.text!, done: false))
//        tableView.reloadData()
        
        //모든 데이터를 업데이트할 필요가 없을 때
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: <#T##UITableView.RowAnimation#>)
        //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
    }
}
