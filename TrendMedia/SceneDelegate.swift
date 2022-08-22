//
//  SceneDelegate.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //윈도우 객체: 화면을 보여주기 위한 통로/바구니
    //수많은 뷰컨트롤러가 있는데 UIWindow가 어떤 걸 보여줄지 관리
    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        
//        //앱이 다시 시작될 때마다 실행
//        //UserDefaults.standard.set(true, forKey: "First")
//        
//        //guard let _ = (scene as? UIWindowScene) else { return }
//        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//        
//        //처음 방문이라면 ViewController, 아니면 SearchMovieTableVC
//        if UserDefaults.standard.bool(forKey: "First") {
//                    
//            let sb = UIStoryboard(name: "Home", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! SearchMovieJTableViewController
//            window?.rootViewController = vc
//            //네비게이션 설정도 가능함
//            //window?.rootViewController = UINavigationController(rootViewController: vc)
//        } else {
//            let sb = UIStoryboard(name: "Trend", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
//            
//            window?.rootViewController = vc
//            
//            UserDefaults.standard.set(true, forKey: "First")
//        }
        //실제로 보여주겠다라는 코드
        window?.makeKeyAndVisible()
        //인포피리스트에 지정했어도 코드상이 뜸
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

