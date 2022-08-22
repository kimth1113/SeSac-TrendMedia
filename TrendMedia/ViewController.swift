//
//  ViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/18.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    //identity inspector에서 module까지 체크되어있는지 잘 확인하기
    //(빌드 후 종료되는 이슈가 있을 수 있음)
    @IBOutlet weak var datePicker: UIDatePicker!
    //언제 아웃렛컬렉션을 사용하는 것이 좋을까?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    //Constraint도 Outlet 변수로 연결 가능
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    
    //변수의 스코프
    let format = DateFormatter()
    //datePicker의 액션함수 안에서가 아닌 전역에서 사용해야 더 광범위로 사용할 수 있음
    
    //전역에서 멤버 변경 안됨
    //format.dateFormat = "yyyy/MM/dd"
    //dateLabel.text = "aaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        format.dateFormat = "yyyy/MM/dd"
        
        //초기화 메서드에서는 .init이 생략되어 있음
        //UIAlertController.init(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        //DateFormatter.init()
        
        //yellowViewLeadingConstraint.constant = 120
        
        print("My World")
    }
    
    func configureLabelDesign() {
        //1. OutletCollection (디자인적인 요소)
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
            //요소 순서 확인하는 방법
            print(i)
        }
        
        //단점: 추후 디자인 변경이나 요소 가독성에 미약할 수 있음
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"
        
        //2. UILabel
        let labelArray = [dateLabel, date2Label]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        
        dateLabel.text = "첫번째 텍스트"
        date2Label.text = "두번째 텍스트"
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        dateLabel.text = format.string(from: sender.date)
    }
    

}

//Add New Constraints에서 드롭다운 클릭 시 기준요소 선택 가능
//UIView 하나 제약 설정, UIView 두 개 선택 후 여백 주기 (Alignment Constraints)
