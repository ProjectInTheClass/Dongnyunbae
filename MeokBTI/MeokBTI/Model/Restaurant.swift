//
//  Restaurant.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/05.
//

import Foundation

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

