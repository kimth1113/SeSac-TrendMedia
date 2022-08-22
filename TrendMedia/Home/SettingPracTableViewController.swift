//
//  SettingPracTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/19.
//

import UIKit

//CaseIterable: 프로토콜, 배열처럼 열겨형을 활용할 수 있는 특성
enum SettingOptions: Int, CaseIterable {
    case total, personal, others //섹션
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitle: [String] {
        switch self {
        case .total:
            return ["전체 설정", "개인 설정", "기타"]
        case .personal:
            return ["공지사항", "실험실", "버전 정보"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingPracTableViewController: UITableViewController {

    var settingSectionList = ["전체 설정", "개인 설정", "기타"]
    
    var allSettingCellList = ["공지사항", "실험실", "버전 정보"]
    var personalSettingCellList = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var otherSettingList = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(SettingOptions.allCases.count) // 3
        print(SettingOptions.allCases[0]) // total
        print(SettingOptions.allCases[1].sectionTitle) // 개인 설정
        print(SettingOptions.allCases[2].rowTitle) // ["고객센터/도움말"]
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        //return settingSectionList.count
        
        return SettingOptions.allCases.count
    }
    
    //1
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return settingSectionList[section]
        
        return SettingOptions.allCases[section].sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
         if section == 0 {
             return allSettingCellList.count
         } else if section == 1 {
             return personalSettingCellList.count
         }
         return 1
         */
        
        return SettingOptions.allCases[section].rowTitle.count
    }
    
    //2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
         
         if indexPath.section == 0 {
             cell.textLabel?.text = allSettingCellList[indexPath.row]
             cell.textLabel?.font = .systemFont(ofSize: 12)
         } else if indexPath.section == 1 {
             cell.textLabel?.text = personalSettingCellList[indexPath.row]
         } else {
             cell.textLabel?.text = otherSettingList[indexPath.row]
         }
         
         
         return cell
         */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12)
        return cell
        
    }
    
}
