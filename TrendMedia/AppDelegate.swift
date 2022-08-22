//
//  AppDelegate.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/18.
//

import UIKit

//앱이 켜졌다 종료됐다
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    //런치스크린이 뜰 때 실행 (가장 먼저 실행)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    //신델리게이트에 기능을 넘겨줌, 신델리게이트 이름: "Default Configuration" (Info에서 확인)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

