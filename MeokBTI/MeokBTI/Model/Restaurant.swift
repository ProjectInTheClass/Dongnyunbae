//
//  Restaurant.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/05.
//

import Foundation
import CoreLocation

struct Restaurant: Codable {
    let name: String
    let position: CLLocationCoordinate2D
    var like: Bool?
//    var meokBTIRanking: [String: Int]?
//
//    var toDictionary: [String: Any] {
//        let (lat, lng) = position.coordinateToStringTuple()
//        return ["position": "\(lat),\(lng)", "meokBTIRanking": meokBTIRanking!]
//    }
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

