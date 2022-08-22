//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var birthdayFriends = ["구경민", "박민규", "박항효", "정수환", "김태현"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //(모든) 셀 높이
        //tableView.rowHeight = 80 //default: 44
        
    }
    
    //섹션의 갯수(옵션)
    //섹션 갯수의 기본값은 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 두명"
        } else {
            return "오류"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터푸퍼투퍼"
    }
    
    //1. 셀의 갯수: numberOfRowsInSection
    //ex. 카톡 친구 100명 > 셀 100개, 3000명 > 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 5
        }
        return 0
    }
    
    //2. 셀의 디자인과 데이터 삽입(필수): cellForRowAt
    //ex. 카톡 이름, 프로필 사진, 상태 메세지 등
    //재사용 매커니즘: 셀이 1000개 있을 때 처음부터 모든 셀을 준비해놓지 않음
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            cell.textLabel?.text = "2번 인덱스"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 30)
            cell.detailTextLabel?.text = "디테일레이블"
            
            if indexPath.row % 2 == 1 {
                cell.backgroundColor = .white
            } else {
                cell.backgroundColor = .lightGray
            }
            
            cell.imageView?.image = indexPath.row % 2 == 1 ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .blue
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "1번 인덱스"
                cell.textLabel?.textColor = .purple
                cell.textLabel?.font = .boldSystemFont(ofSize: 25)
            }
            
            return cell
        }
    
    }
    
    //셀 높이 지정(섹션마다 다른 높이 지정 가능, rowHeight보다 우선시)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //if indexPath == [0, 0]
        //if indexPath.section == 0 && indexPath.row == 0
        
        return 80
    }
}
