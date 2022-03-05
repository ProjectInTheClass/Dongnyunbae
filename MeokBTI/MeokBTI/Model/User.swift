//
//  User.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/19.
//

import Foundation


class User: Codable {
    static let shared = User.loadFromFile()
    // 유저데이터 저장위치
    static let documanetsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documanetsDirectory.appendingPathComponent("User").appendingPathExtension("plist")

    var id: String?
    var meokBTI: MeokBTI? = nil
    var favoriteRestaurants: [Restaurant] = []
//    var testCompletion: Bool = false
    
    // 한번 더 초기화되는 것 방지
    private init() { }
    
    static func saveToFile(user: User) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedUserData = try? propertyListEncoder.encode(user)
        try? encodedUserData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> User {
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedUserData = try? Data(contentsOf: archiveURL),
              let decodedUser = try? propertyListDecoder.decode(User.self, from: retrievedUserData) else { return User() }
        
        return decodedUser
    }
    
    func resetFavoriteRestaurantData() {
        let reset = User.shared
        reset.favoriteRestaurants.removeAll()
        User.saveToFile(user: reset)
    }
    
    func printOutData() {
        print("id: \(String(describing: self.id)), meokBTI: \(String(describing: self.meokBTI)), favoriteRestaurants: \(self.favoriteRestaurants)")
    }
}
