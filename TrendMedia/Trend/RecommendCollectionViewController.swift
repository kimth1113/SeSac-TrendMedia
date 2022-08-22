//
//  RecommendCollectionViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

class RecommendCollectionViewController: UICollectionViewController {
    
    //1. 값 전달 - 데이터를 받을 공간(프로퍼티) 생성
    var movieData = ""
    //var movieData: Movie?
    //따로따로 프로퍼티를 생성하지 않고 하나의 구조체 전체를 전달 반는 이유?
    //깔끔한 유지보수를 위해
    
    var imageURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220617_113%2F1655427761368j8QHv_JPEG%2Fmovie_image.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. 값 전달 - 프로퍼티 값을 뷰에 표현
        title = movieData
        //title = movieData?.title ?? "값 없음"

        //컬렉션 뷰의 셀 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3 * 1.2)
        layout.scrollDirection = .vertical
        //상하좌우 여백
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
        
        //Compositianal Layout
        
    }
    
    /*
     TableView > CollectionView
     Row > Item
     heightForRowAt > ??? FlowLayout (heightForItemAt이 없는 이유)
     */
    
    //numberOfRowInSection과 유사
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    //cellForRowAt과 유사
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as? RecommendCollectionViewCell else {
            // 비어있는 인스턴스로 반환
            return UICollectionViewCell()
        }
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        
        return cell
    }

    // Item을 클릭했을 때
    // Toast UI
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.")
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.", duration: 3, position: .center)
        
        self.navigationController?.popViewController(animated: true)
    }
}
