//
//  MapViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/04.
//

import UIKit
import GooglePlaces
import GoogleMaps
import TMapSDK

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?
    var currentCamera: GMSCameraPosition!
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var preciseLocationZoomLevel: Float = 15.0
    var approximateLocationZoomLevel: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        
        // 시뮬레이터에 현재위치 미국으로 찍혀서 ㅠ 임시로 저희집(진주)으로 고정
        let currentPostion = CLLocationCoordinate2D(latitude: CLLocationDegrees(35.1735298751079), longitude: CLLocationDegrees(128.13643500208855))
        currentLocation = CLLocation(latitude: currentPostion.latitude, longitude: currentPostion.longitude)
//        currentLocation = locationManager.location!
//        let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
        if let defaultLocation = currentLocation {
            currentCamera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                                  longitude: defaultLocation.coordinate.longitude, zoom: preciseLocationZoomLevel)
        }
        
        mapView = GMSMapView.map(withFrame: view.bounds, camera: currentCamera)
        mapView.setMinZoom(0, maxZoom: 20)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        generateAroundMarker(bothLatLng: currentPostion)
        placesClient = GMSPlacesClient.shared()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //location 접근권한 요청확인
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
            self.locationManager.startUpdatingLocation() // 주소데이터를 현위치로 업데이트
        case .restricted, .notDetermined:
            // [x] 위치접근 거부시 기본위치 대전으로 설정 : 대전이 한국에서 중간지점으로 이길래 ㅎㅎ
            print("GPS 권한 설정되지 않음")
            self.currentLocation = CLLocation(latitude: CLLocationDegrees(36.343805), longitude: CLLocationDegrees(127.417154))
            getLocationUsagePermission()
        case .denied:
            // [x] 위치접근 거부시 기본위치 대전으로 설정 : 대전이 한국에서 중간지점으로 이길래 ㅎㅎ
            print("GPS 권한 요청 거부됨")
            self.currentLocation = CLLocation(latitude: CLLocationDegrees(36.343805), longitude: CLLocationDegrees(127.417154))
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
    
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        // [ ] 정보창 띄움 ([x] 식당이름, 식당이미지, 먹bti선호도를 나타내는 창)
        mapView.selectedMarker = marker
        var seletedPlaceID: String?
        if let name = marker.title {
            print("here is didTap",name)
            fetchPlaceID(restaurantName: name) { (result) in
                seletedPlaceID = result?.restaurant[0].placeID
                print("seletedPlaceID in func", seletedPlaceID)
            }
        }
        
//        print("seletedPlaceID out func",seletedPlaceID) --> nil
//        print("tapped marker")
//        print("marker position : ",marker.position)
        
        return true
    }
    
    // 어느곳을 터치하던 좌표만을 보여주는 함수
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("coordinate \(coordinate)")
    }
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {

    }
    
    func generateAroundMarker(bothLatLng currentPosition: CLLocationCoordinate2D) {
        let pathData = TMapPathData()
        
        // categoryName: 카테고리 5개까지 가능 ;로 구분, radius: 단위 1km
        pathData.requestFindNameAroundPOI(currentPosition, categoryName: "식당", radius: 20, count: 100, completion: { (result, error) -> Void in
            // 가져온 결과로 주변식당 위치에 마커 띄우기
            if let result = result {
                DispatchQueue.main.async {
                    let withoutParkingResult = result.filter { !(($0.name?.contains("주차장"))!) }
                    for poi in withoutParkingResult {
                        let marker = GMSMarker(position: poi.coordinate!)
                        marker.title = poi.name
//                        print("success input title: ",marker.title)
                        marker.snippet = poi.address
//                        print("success input snippet: ",marker.snippet)
                        marker.map = self.mapView
                        
                    }
                }
            }
        })
    }
    
    func fetchPlaceID(restaurantName name: String, completion: @escaping (SearchPlaceIDResult?) -> Void) {
        let baseURL = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?")!
        
        let query: [String: String] = [
            "key": "AIzaSyCT8daNhwSuDMC0spQszzU7Xgxr8LIA13I",
            "fields": "place_id",
            "inputtype": "textquery",
            "input": name
        ]
        
        let url = baseURL.withQueries(query)
        
        guard let searchURL = url else { return }
    
        let task = URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
               let placeID = try? decoder.decode(SearchPlaceIDResult.self, from: data),
               !(placeID.restaurant.isEmpty) {
                completion(placeID)
                print(placeID.restaurant[0].placeID)
                
            } else {
                print("뭔가 잘못돼쓰")
                completion(nil)
                return
            }
        }
        task.resume()
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension MapViewController {
//
//    override func loadView() {
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 14.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//
//        do {
//          // Set the map style by passing the URL of the local file.
//          if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
//            mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
//          } else {
//            NSLog("Unable to find style.json")
//          }
//        } catch {
//          NSLog("One or more of the map styles failed to load. \(error)")
//        }
//
//        self.view = mapView
//    }
//}



