import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


struct Location: Codable {
    let lat: Double
    let lng: Double
}

struct LocationInfo: Codable {
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case location
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try valueContainer.decode(Location.self, forKey: CodingKeys.location)
    }
    
}

struct PhotoInfo: Codable {
    var height: Int
    var width: Int
    var photoReference: String
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case photoReference = "photo_reference"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try valueContainer.decode(Int.self, forKey: CodingKeys.height)
        self.width = try valueContainer.decode(Int.self, forKey: CodingKeys.width)
        self.photoReference = try valueContainer.decode(String.self, forKey: CodingKeys.photoReference)
    }
    
}

struct CadidatesInfos: Codable {
    var name: String
    var photos: [PhotoInfo]
    let geometry: LocationInfo
    
    enum CodingKeys: String, CodingKey {
        case name, photos, geometry
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.photos = try valueContainer.decode([PhotoInfo].self, forKey: CodingKeys.photos)
        self.geometry = try valueContainer.decode(LocationInfo.self, forKey: CodingKeys.geometry)
    }
}

struct MapInfo: Codable {
    var candidates: [CadidatesInfos]
    
    enum CodingKeys: String, CodingKey {
        case candidates
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.candidates = try valueContainer.decode([CadidatesInfos].self, forKey: CodingKeys.candidates)
    }
}


let baseURL = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyCT8daNhwSuDMC0spQszzU7Xgxr8LIA13I")!

let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
    let jsonDecoder = JSONDecoder()
    if let data = data,
       let mapInfo = try? jsonDecoder.decode(MapInfo.self, from: data) {
        print("mapInfo.candidates :",mapInfo.candidates)
        print("mapInfo.candidates.type :",type(of: mapInfo.candidates))
        print("mapInfo.candidates[0].name :" ,mapInfo.candidates[0].name)
        print("mapInfo.candidates[0].photos[0] :",mapInfo.candidates[0].photos[0])
        print("mapInfo.candidates[0].geometry.location :",mapInfo.candidates[0].geometry.location)
        print("mapInfo.candidates[0].geometry.location lat :",mapInfo.candidates[0].geometry.location.lat)
        print("mapInfo.candidates[0].geometry.location lng :",mapInfo.candidates[0].geometry.location.lng)
    }
//    if let data = data,
//       let aroundRestaurants = try? decoder.decode(AroundRestaurant.self, from: data) {
//        print(aroundRestaurants.results)
//    } else {
//        print("Either no data was returned, or data was not properly decoded")
//    }
    PlaygroundPage.current.finishExecution()
}
task.resume()
