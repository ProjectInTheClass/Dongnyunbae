//
//  Restaurant.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/05.
//

//
// api 변경 관련
//

import Foundation
import CoreLocation
import GoogleMaps

struct Restaurant: Codable {
    let name: String
    let position: CLLocationCoordinate2D
    var like: Bool {
        return isLikedRestaurant(placeName: name, position: position)
    }
    
    func transformNameToShow(basisof map: GMSMarker.basisOfMap) -> String {
        var beingTransformedName: String
        if map == .tmap {
            // 지역점까지 나타내니 너무 길어서 짜름 ex) 롯데리아 진주혁신점 -> 롯데리아
            beingTransformedName = String(name.split(separator: " ")[0])
        } else {
            beingTransformedName = name.replacingOccurrences(of: " ", with: "")
        }
        
        return beingTransformedName
    }
    
    func isLikedRestaurant(placeName: String, position: CLLocationCoordinate2D) -> Bool {
        let userData = User.loadFromFile()
        let result = userData.favoriteRestaurants.contains(where: { $0.name == placeName && $0.position == position
        })
        return result
    }    
}

struct MeokBTIRanking {
    var ranking: [String: Int]
}

enum Ranking {
    case first, second, third
    
    var medal: String {
        switch self {
        case .first:
            return "🥇"
            
        case .second:
            return "🥈"
            
        case .third:
            return "🥉"
        }
    }
}

struct SearchPlaceIDResult: Codable {
    let restaurant: [PlaceID]
    
    enum CodingKeys: String, CodingKey {
        case restaurant = "candidates"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.restaurant = try valueContainer.decode([PlaceID].self, forKey: CodingKeys.restaurant)
    }
    
}

struct PlaceID: Codable {
    let placeID: String
    
    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.placeID = try valueContainer.decode(String.self, forKey: CodingKeys.placeID)
    }
}

