//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func movieButton(_ sender: UIButton) {
        //화면전환: 1. 스토리보드 파일 2. 스토리보드 내 뷰컨트롤러 3. 화면전환
        //영화버튼 클릭 > BucketlistTableViewController Present
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //전달 2.
        vc.textfieldPlaceholder = "영화"
        
        //3.
        self.present(vc, animated: true)
    }
    
    @IBAction func dramaButton(_ sender: UIButton) {
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        //2.5. (present 시 화면 전환 방식 설정 옵션)
        vc.modalPresentationStyle = .fullScreen
        
        //전달 2.
        vc.textfieldPlaceholder = "드라마"
        
        //3.
        self.present(vc, animated: true)
    }
    
    @IBAction func bookButton(_ sender: UIButton) {
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //전달 2.
        vc.textfieldPlaceholder = sender.currentTitle
        
        //2.5
        let nav = UINavigationController(rootViewController: vc)
        
        
        //2.5. (present 시 화면 전환 방식 설정 옵션)
        //vc.modalPresentationStyle = .fullScreen //동작안함. 프리젠트한 주체를 맞춰야함
        nav.modalPresentationStyle = .fullScreen
        
        //3.
        self.present(nav, animated: true)
    }
    
}
