//
//  APIKeys.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/02/22.
//

import Foundation

enum APIKeys: String {
    case GoogleMaps = "AIzaSyA7nr52fSWzE10vuWjBvibFnPBZgocV2oQ"
    case TMap = "l7xxdc91957989154f5da7c8548ade820e14"
    case Kakao = "c4b131df326f5e420d6b275a484a3e2c"
    
    func getAPIKey() -> String {
        return self.rawValue
    }
}
