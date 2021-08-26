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

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, MapMarkerDelegate, GMSAutocompleteViewControllerDelegate {
 
    // 검색창 코드(3줄)
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    var positionChanged = false

    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?
    var currentCamera: GMSCameraPosition!
    var placesClient: GMSPlacesClient!
    var preciseLocationZoomLevel: Float = 15.0
    
    var mapView: GMSMapView!
    var showingRestaurant: Restaurant!
    private var infoWindow = MapMarkerWindow()
    fileprivate var locationMarker : GMSMarker? = GMSMarker()
    var loadedPhotos = [UIImage]()
    var isLikedRestaurant: Bool!
    
    // 식당 5개 선택 관련
    var isTested = false // meokbti 테스트 했는지
    var isSelectedFiveRestaurant = false // 5개 선택 했는지
    let user = User.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Stored UserID : ", User.loadFromFile().id ?? "Nothing load")
//        resetFavoriteRestaurantData()
        self.infoWindow = loadNiB()
        infoWindow.initCollectionView()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        
        loadMapView()
        guard let currentLocation = currentLocation else { return }
        generateAroundMarker(bothLatLng: currentLocation.coordinate,count: 30)
        
        placesClient = GMSPlacesClient.shared()
        
        // 검색창 구현
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self

        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let subView2 = UIView(frame: CGRect(x: 0, y: 30.0, width: 350.0, height: 45.0))

        subView2.addSubview((searchController?.searchBar)!)
        view.addSubview(subView2)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false

        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
        // Do any additional setup after loading the view.
        
    }
    // 식당 5개 선택 관련 코드 (미완성)
    func gotoIntrodoction() {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "Main") as? IntroductionViewController else { return }
        let storyboard2 = UIStoryboard.init(name: "Popup", bundle: nil)
        let popUp = storyboard.instantiateViewController(identifier: "Popup")
        
        if (isSelectedFiveRestaurant == true)
        {
            return
        }
        else
        {
            if (isTested == true)
            {
                    // 좋아하는 식당 5개 선택하는 창 생성
                popUp.modalPresentationStyle = .overCurrentContext
                popUp.modalTransitionStyle = .crossDissolve
                let temp = popUp as? PopUpViewController
                
            }
            else
            {
                        // 테스트 화면으로 넘어가기.
                
                present(nextVC, animated: true, completion: nil)
                isTested = true
            }
            isSelectedFiveRestaurant = true
        }
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
    
    func loadNiB() -> MapMarkerWindow {
        let infoWindow = MapMarkerWindow.instanceFromNib() as! MapMarkerWindow
        return infoWindow
    }
    
    func loadMapView() {
        // 임시 좌표지정
        let currentPostion = CLLocationCoordinate2D(latitude: CLLocationDegrees(35.1735298751079), longitude: CLLocationDegrees(128.13643500208855))
        currentLocation = CLLocation(latitude: currentPostion.latitude, longitude: currentPostion.longitude)
        
        // 실제 서비스는 현재위치를 기본으로 함.
//        currentLocation = locationManager.location!
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
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        // [x] 정보창 띄움 ([x] 식당이름, [x] 식당이미지, [x] 먹bti선호도를 나타내는 창)
        mapView.selectedMarker = marker
        initializeInfoWindow(marker: marker)
        
        // 지역점까지 나타내니 너무 길어서 짜름 ex) 롯데리아 진주혁신점 -> 롯데리아
        // 데이터가 아닌 infoWindow에 나타나는 이름만 짤라줌.
        guard let rawTitle = marker.title else { return false }
        let name = rawTitle.split(separator: " ")[0]
        let ranking = "🥇EMGI🥈EMGC🥉EMBC"
        
        // infoWindow에 들어갈 정보 할당 및 위치 지정
        // 앞부분에 inset이 필요해서 공백추가
        infoWindow.nameLabel.text = " " + String(name)
        infoWindow.rankingLabel.text = ranking
        infoWindow.center = mapView.projection.point(for: marker.position)
        infoWindow.center.y = infoWindow.center.y - 110
        
        // 해당 식당이 좋아요한 식당인지 확인후 버튼모양 설정해줌.
        isLikedRestaurant = infoWindow.loadDataAndCheckLikeButton(placeName: rawTitle, position: marker.position)
        infoWindow.setButtonImage(isLikedRestaurant)
        // 버튼액션함수가 buttonTapped을 기준으로 실행되는데 연동이 안되있으므로 infoWindow를 다른 것을 띄웠다가 돌아왔을 때 버튼이미지가 안 바뀌는 이슈
        // Solution: buttonTapped과 연동시켜주면서 버튼 동작을 정상적으로 만들어줌
        infoWindow.buttonTapped = isLikedRestaurant
        
        self.view.addSubview(infoWindow)
        mapView.animate(to: GMSCameraPosition(target: marker.position, zoom: mapView.camera.zoom))
        
        if let name = marker.title {
            print("here is didTap",name)
            // 식당이름으로 placeID를 받아오기 (API호출)
            fetchPlaceID(restaurantName: name) { (placeID) in
                // 받아온 placeID로 해당 식당 사진 받아오기
                if let selectedPlaceID = placeID {
                    self.fetchRestaurantPhoto(placeID: selectedPlaceID)
                }
                
            }
        }
        
        showingRestaurant = Restaurant(name: rawTitle, position: marker.position, like: isLikedRestaurant)
                
//        print("tapped marker")
        return false
    }
    
    // 어느곳을 터치하던 좌표만을 보여주는 함수
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        print("coordinate \(coordinate)")
        infoWindow.removeFromSuperview()
    }
    
    // [x] 지도 이동시에도 그 마커위에 그대로 남겨 놓게하기.
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        if (locationMarker != nil) {
            guard let location = locationMarker?.position else {
                print("locationMarker is nil")
                return
            }
            infoWindow.center = mapView.projection.point(for: location)
            infoWindow.center.y = infoWindow.center.y - 110
        }
    }
    
    // [x] 지도 이동이 끝났을 때, 해당 좌표 주위에 식당들 업데이트
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        // zoom level에 따라 보여주는 식당 갯수를 다르게 구현.
        switch mapView.camera.zoom {
        
        case 15...17:
            generateAroundMarker(bothLatLng: position.target,count: 30)
            
        case 17...18:
            generateAroundMarker(bothLatLng: position.target,count: 50)
            
        case 18...20:
            generateAroundMarker(bothLatLng: position.target,count: 100)
            
        default:
            generateAroundMarker(bothLatLng: position.target,count: 10)
        }
        
        print("zoomLevel : ",mapView.camera.zoom)
    }
    
    // 해당지점 탭시 PlaceID를 알 수 있는 함수 but, 한국은 안됌!
//    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
//
//        print("here is the PlaceID: ",placeID)
//
//    }
    
    func initializeInfoWindow(marker: GMSMarker) {
        // infoWindow 초기화
        locationMarker = marker
        infoWindow.removeFromSuperview()
        infoWindow.spotPhotos = []
        infoWindow = loadNiB()
        infoWindow.initCollectionView()
        
        // infoWindow 테두리 지정 / 버튼 둥글게 (현재 버튼에선 적용 x)
        infoWindow.delegate = self
        infoWindow.layer.cornerRadius = 12
        infoWindow.layer.borderWidth = 0
        infoWindow.likeButton.layer.cornerRadius = infoWindow.likeButton.frame.height / 2
    }
    
    func generateAroundMarker(bothLatLng currentPosition: CLLocationCoordinate2D, count: Int) {
        // [] 좋아요 누른 식당은 다른색 마커 띄우기
        let pathData = TMapPathData()
        
        // categoryName: 카테고리 5개까지 가능 ;로 구분, radius: 단위 1km
        pathData.requestFindNameAroundPOI(currentPosition, categoryName: "식당", radius: 20, count: count, completion: { (result, error) -> Void in
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
    
    func fetchPlaceID(restaurantName name: String, completion: @escaping (String?) -> Void) {
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
               let result = try? decoder.decode(SearchPlaceIDResult.self, from: data),
               !(result.restaurant.isEmpty) {
                completion(result.restaurant[0].placeID)
//                print(result.restaurant[0].placeID)
            } else {
                print("뭔가 잘못돼쓰")
                completion(nil)
                return
            }
        }
        task.resume()
       
    }
    
    func fetchRestaurantPhoto(placeID: String) {
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.photos.rawValue))!
        self.loadedPhotos = []
        self.placesClient?.fetchPlace(fromPlaceID: placeID,
                                      placeFields: fields,
                                      sessionToken: nil, callback: {
                                        (place: GMSPlace?, error: Error?) in
                                        if let error = error {
                                            print("An error occurred: \(error.localizedDescription)")
                                            return
                                        }
                                        
                                        if let place = place, !(place.photos?.isEmpty ?? true) {
                                            // Get the metadata for the first photo in the place photo metadata list
                                            
                                            var photoMetadata: [GMSPlacePhotoMetadata] = []
                                            
                                            if place.photos!.count > 5 {
                                                photoMetadata = (0...4).map { place.photos![$0] }
                                            } else {
                                                photoMetadata = place.photos!
                                            }
                                            
                                            
                                            // Call loadPlacePhoto to display the bitmap and attribution.
                                            for metaData in photoMetadata {
                                                self.placesClient?.loadPlacePhoto(metaData, callback: { (photo, error) -> Void in
                                                    if let error = error {
                                                        // TODO: Handle the error.
                                                        print("Error loading photo metadata: \(error.localizedDescription)")
                                                        return
                                                    } else {
                                                        // Display the first image and its attributions.
    //                                                    self.restaurantPhotoView?.image = photo;
                                                        print("Load Photo Success :",type(of: photo))
                                                        
                                                        if let photo = photo {
                                                            self.loadedPhotos.append(photo)
                                                            self.infoWindow.spotPhotos = self.loadedPhotos
                                                            self.infoWindow.photoCollectionView.reloadData()
                                                        }
                                                        
                                                        
                                                        
                                                        print("photos append after :",self.loadedPhotos)
                                                        //self.lblText?.attributedText = photoMetadata.attributions;
                                                    }
                                                })
                                            }
                                            
                                            print("after load photo: ",self.loadedPhotos)
                                            
                                        }
                                      })
    }
    
    func setDefaultCameraZoom() {
        print("it's me cameraZoom")
        guard mapView != nil  else { return }
        mapView.animate(toZoom: 15)
        
    }
    
    func didTapLikeButton(_ sender: Any) {
        // [ ] 서버로 좋아요 누른거 전송
        // [x] Like, 좋아한 식당목록에 추가
        // [x] Unlike, 좋아한 식당목록에서 제거
//        print(sender.isHighlighted)
        print("넘겨받은 buttonTapped", sender)
        
        let storedUserData = User.loadFromFile()
        // 좋아요가 눌러진 상태인지를 확인하고 ? 안 눌러져있다가 좋아요 -> 좋아요 목록에 추가 : 눌러져있는 상태에서 한번 더 좋아요 -> 좋아요 목록에서 삭제
        if sender as! Bool {
            print("Like!")
            let likedRestaurant = Restaurant(name: showingRestaurant.name, position: showingRestaurant.position, like: true)
            storedUserData.favoriteRestaurants.append(likedRestaurant)
            User.saveToFile(user: storedUserData)
            print("Saved! :",User.loadFromFile().favoriteRestaurants)
        } else {
            print("Unlike!")
            if let restaurantIndex = storedUserData.favoriteRestaurants.firstIndex(where: { $0.name == showingRestaurant.name && $0.position == showingRestaurant.position }) {
                storedUserData.favoriteRestaurants.remove(at: restaurantIndex)
                User.saveToFile(user: storedUserData)
                print("Removed! :",User.loadFromFile().favoriteRestaurants)
            }
            
        }
    }
    
    func resetFavoriteRestaurantData() {
        let reset = User.loadFromFile()
        reset.favoriteRestaurants.removeAll()
        User.saveToFile(user: reset)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
    }

}

extension MapViewController: GMSAutocompleteResultsViewControllerDelegate {
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
    // 검색한 곳으로 이동 및 정보 띄우기
    mapView.clear()
    let cord2D = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
    let marker = GMSMarker()
    marker.position = cord2D
    marker.title = place.name
    marker.snippet = place.name
    marker.map = self.mapView
    
    searchController?.isActive = false
    searchController?.resignFirstResponder()
    let acController = GMSAutocompleteViewController()
    acController.delegate = self
    self.mapView.camera = GMSCameraPosition.camera(withTarget: cord2D , zoom: 15)
    // Do something with the selected place.
    print("Place name: \(place.name)")
    print("Place address: \(place.formattedAddress)")
    print("Place attributions: \(place.attributions)")
    
    // [] 카메라 이동
    
  }

  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didFailAutocompleteWithError error: Error){
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
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



