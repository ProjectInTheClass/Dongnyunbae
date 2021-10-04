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

// 자 TMap poi에서 주소랑 전화번호를 가져올 수 있었다. 구글맵스가 아닌!
// 마커 불러올때 정보를 다 가져올 수 있어서 자원사용 최소화
// but 이 poi에서의 정보를 저장할 방법을 고안하던중 GMSMarker를 건들였더만 인스턴스 생성함수?가 정의 되지 않아 fail
// extension으로 변수를 추가해주려고 했는데, extension은 변수추가가 불가능..
// 우짜노 --> 변수추가가 힘들어보이고 그렇게 많은 데이터도(1~1000) 아닌 것 같으니 pois 를 클래스내에 임시로 저장해보는게 어떰?
extension GMSMarker {
    // 식당이름을 불러올 때, 구글(서치뷰)을 통해 검색한 식당이름 vs TMap에서 불러오는 식당이름 차이가 있어 나눠줌.
    // TODO: 식당검색도 TMap으로 통합시키기.
    enum basisOfMap {
        case google, tmap
    }

}

extension UIView {
    func transformToImage() -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(frame.size, isOpaque, 0.0)
        UIGraphicsBeginImageContext(CGSize(width: bounds.size.width, height: bounds.size.height))
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
