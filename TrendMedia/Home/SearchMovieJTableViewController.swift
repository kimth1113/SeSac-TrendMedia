//
//  SearchMovieJTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit

class SearchMovieJTableViewController: UITableViewController {

    var movieList = MovieInfo()
    //["암살", "괴물", "해리포터와 슈렉", "내 머리속의 지우개", "기묘한 이야기", "라라랜드", "라이언 일병 구하기", "외계+인"]
    
    //MARK: 뷰컨트롤러의 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
    }
    
    //MARK: 일반 액션
    
    ///window RootViewController 교체 - 시작 화면으로 돌아가는 메서드
    @objc
    func resetButtonClicked() {
        //iOS13+ SceneDelegate 쓸 때 동작하는 코드 (그 이하는 인터넷에 코드 많음)
        //Appdelegate 처음부터 실행. (아래코드는 AppDelegate에서 관장)
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        
        //SceneDelegate에 접근하는 코드
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
    }

    //MARK: 테이블뷰 메서드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieJTableViewCell", for: indexPath) as! SearchMovieJTableViewCell
        
        let data = movieList.movie[indexPath.row]
        //코드를 간결하게: CellController의 함수로 전달
        cell.configureCell(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //디바이스 전체 높이
        return UIScreen.main.bounds.height / 8
    }
    
    //화면전환: 영화 리스트 요소 클릭 시
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselectRowAt") //동작하지 않는다면? 1. Table
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommendCollectionViewController") as! RecommendCollectionViewController
        
        
        //2. 값 전달 - (푸시 전) cv가 가지고 있는 프로퍼티에 데이터 추가
        vc.movieData = ""
        //vc.movieData = movieList.movie[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
