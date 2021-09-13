//
//  AppDelegate.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/29.
//

import UIKit
import GoogleMaps
import GooglePlaces
import TMapSDK
import FirebaseCore
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate, TMapTapiDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyDha3Nwl8AW-SIjoGczNqVJYO4xjNXYHfQ")
        GMSPlacesClient.provideAPIKey("AIzaSyCT8daNhwSuDMC0spQszzU7Xgxr8LIA13I")
        TMapApi.setSKTMapAuthenticationWithDelegate(self, apiKey: "l7xxdc91957989154f5da7c8548ade820e14")
        FirebaseApp.configure()
        KakaoSDKCommon.initSDK(appKey: "{c4b131df326f5e420d6b275a484a3e2c}")
        
        if User.loadFromFile().id == nil {
            let user = User.shared
            user.id = UUID().uuidString
            User.saveToFile(user: user)
            print("ID save success!")
        }
        // Stored ID: 60E8A898-77D5-43B1-A25B-54A371F99032 --> 일정한지 확인! (koesnam simulator) -> 새로 saveToFile 할 때 바뀜!
        // -> loadFromFile을 먼저한 후 가져온 User에다가 내용 추가하고 saveToFile 함수 호출해서 파일 저장해야함.
        return true
    }

    // MARK: UISceneSession Lifecycle

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

