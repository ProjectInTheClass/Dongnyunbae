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

@main
class AppDelegate: UIResponder, UIApplicationDelegate, TMapTapiDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyDha3Nwl8AW-SIjoGczNqVJYO4xjNXYHfQ")
        GMSPlacesClient.provideAPIKey("AIzaSyCT8daNhwSuDMC0spQszzU7Xgxr8LIA13I")
        TMapApi.setSKTMapAuthenticationWithDelegate(self, apiKey: "l7xxdc91957989154f5da7c8548ade820e14")
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

