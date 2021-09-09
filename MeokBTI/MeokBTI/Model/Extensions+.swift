//
//  Extensions+.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/15.
//

import Foundation
import CoreLocation
import GoogleMaps

// MapViewController에서 쓰임.
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
        { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

// Restaurant 구조체에서 Codable을 준수시키기 위해 사용. ( CLLocationCoordinate2D는 원래 Codable을 준수하지 않음 )
extension CLLocationCoordinate2D: Codable, Equatable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let longitude = try container.decode(CLLocationDegrees.self)
        let latitude = try container.decode(CLLocationDegrees.self)
        self.init(latitude: latitude, longitude: longitude)
    }
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
    }
    
    func coordinateToStringTuple() -> (String,String) {
        return (String(self.latitude),String(self.longitude))
    }
}

extension GMSMarker {
    enum basisOfMap {
        case google, tmap
    }
}

extension UIView {
    func transfromToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, isOpaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
}
