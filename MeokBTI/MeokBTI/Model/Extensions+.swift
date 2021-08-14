//
//  Extensions+.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/15.
//

import Foundation


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
