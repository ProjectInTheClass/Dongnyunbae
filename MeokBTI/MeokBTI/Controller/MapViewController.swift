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
import FirebaseDatabase
import KakaoSDKCommon

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, MapMarkerDelegate, UISearchBarDelegate {
    
    // 디바이스 크기 변수
    let screenHeight = UIScreen.main.bounds.size.height
    
    // 검색창 코드
    var searchController: UISearchController?

    // 위치 관련 변수들
    var locationManager: CLLocationManager!
    static var currentLocation: CLLocation?
    var currentCamera: GMSCameraPosition!
    var placesClient: GMSPlacesClient!
    var preciseLocationZoomLevel: Float = 17.0
    
    // 맵뷰 관련 변수들
    var mapView: GMSMapView!
    fileprivate var locationMarker : GMSMarker? = GMSMarker()
    var isLikedRestaurant: Bool!
    var selectedMarkers: [GMSMarker] = []
    static var handleMapVC = MapViewController()
    
    // 식당 5개 선택 관련
    var isTested = false // meokbti 테스트 했는지
    var isSelectedFiveRestaurant = false // 5개 선택 했는지
    
    // InfoWindow
    var meokBTIRanking: String = ""
    var top3MeokBTIData = NSDictionary()
    var shownRestaurant: Restaurant?
    var shownRestaurantPlaceID: String = ""
    private var infoWindow = MapMarkerWindow()
    
    // DetailInfoWindow에 넘겨줄 데이터
    var tempPoiItems = [TMapPoiItem]()
    var restaurantAddress = String()
    var restaurantPhoneNumber = String()
    var addressAndPhoneNumber: [String] {
        return [restaurantAddress, restaurantPhoneNumber]
    }
    
    // 유저데이터
    let user = User.shared
    
    // TmapAPI 이용하기위함.
    let pathData = TMapPathData()
    
    // 파이어베이스 관련 변수
    var ref: DatabaseReference!
    var beingUpdatedContents: [String: Any] = [:]
    
    // 지역내 재검색버튼
    var refreshButton = UIButton()
    var selectFiveRestaurantLabel = UILabel()
    var countLabel = UILabel()
    var selectedRestaurantsCount = 0
    var selectLabelAndRefreshButtonStackView = UIStackView()
    var selectVerticalStackView = UIStackView()
    
    // likeButton 관련
    var meokBTILikeCount = Int()
        
    override func viewDidLoad() {
        checkDevice()
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
        self.infoWindow = loadNiB()
        
        // 위치관련 초기설정
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        
        configureUI()
        guard let currentLocation = MapViewController.currentLocation else { return }
        generateAroundMarker(bothLatLng: currentLocation.coordinate, count: 30)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailRestaurantInfoViewController,
        let shownRestaurant = shownRestaurant else { return }
        
        detailVC.shownRestaurant = shownRestaurant
        detailVC.shownRestaurantPlaceID = shownRestaurantPlaceID
        detailVC.likeButtonTapped = infoWindow.likeButtonTapped
        detailVC.previousInfoWindow = infoWindow
        detailVC.top3MeokBTI = top3MeokBTIData
        detailVC.addressAndPhoneNumber = addressAndPhoneNumber
        detailVC.placesClient = placesClient
    }

    fileprivate func configureUI() {
        // 지도 구현
        configureMapView()
        
        // 검색창 구현
        configureSearchBar()
        
        // 선택요청뷰와 지역재검색뷰 스택뷰 구현
        configureSelectFiveRestaurantLabel()
        configureRefreshButton()
        mergeSelectLabelAndRefreshButton()
    }
    
    func checkDevice() {
        print(screenHeight)
        if screenHeight == 926 {
            print("13PM, 12PM")
        }
        else if screenHeight == 896 {
            print("11PM, 11, XR")
        }
        else if screenHeight == 844 {
            print("13P, 13, 12P, 12")
        }
        else if screenHeight == 812 {
            print("13m, 12m, 11P")
        }
        else if screenHeight == 736 {
            print("8+")
        }
        else if screenHeight == 667 {
            print("SE,8")
        }
        else if screenHeight == 568 {
            print("iPod")
        }
        else {
            print("iPhone XS")
        }
    }
    
    func configureSearchBar() {
        let resultsViewController = SearchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        var searchControllerSubView = UIView()
        if screenHeight == 736 || screenHeight == 667 || screenHeight == 568 {
            searchControllerSubView = UIView(frame: CGRect(x: 0, y: 10, width: 350.0, height: 45))
        }
        else {
            searchControllerSubView = UIView(frame: CGRect(x: 0, y: 50, width: 350.0, height: 45))
        }
        
        if let searchView = searchController?.searchBar {
            searchView.searchBarStyle = .minimal
            searchView.placeholder = "식당 검색"
            searchView.searchTextField.backgroundColor = .white
            searchControllerSubView.addSubview(searchView)
            searchView.sizeToFit()
            searchView.delegate = self
        }
   
        view.addSubview(searchControllerSubView)

        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
    }
    
    func configureRefreshButton() {
        refreshButton.addTarget(self, action: #selector(self.updateAroundMarker), for: .touchUpInside)
        refreshButton.setTitle("  💫지역내 재검색  ", for: .normal)
        refreshButton.titleLabel?.font = UIFont(name: "Binggrae", size: 15)
        refreshButton.layer.cornerRadius = 15
        refreshButton.setTitleColor(.orange, for: .normal)
        refreshButton.backgroundColor = .white
    }
    
    func configureSelectFiveRestaurantLabel() {
        if user.hasSelectedFavorites { return }
        
        selectFiveRestaurantLabel.text = " 식당에 좋아요를 눌러보세요! "
        selectFiveRestaurantLabel.font = UIFont(name: "Binggrae", size: 15)
        selectFiveRestaurantLabel.layer.cornerRadius = 15
        selectFiveRestaurantLabel.adjustsFontSizeToFitWidth = true

        countLabel.text = "\(selectedRestaurantsCount) / 5"
        countLabel.backgroundColor = .white
    }
    
    fileprivate func configureSelectVStack() {
        selectVerticalStackView.axis = .vertical
        selectVerticalStackView.addArrangedSubview(selectFiveRestaurantLabel)
        selectVerticalStackView.addArrangedSubview(countLabel)
        selectVerticalStackView.layer.cornerRadius = 15
        selectVerticalStackView.backgroundColor = .white
        selectVerticalStackView.alignment = .center
    }
    
    // 좋아요식당, 재검색 스택뷰
    fileprivate func setConstraintSelectAndRefresh() {
        selectLabelAndRefreshButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        selectLabelAndRefreshButtonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        if screenHeight == 736 || screenHeight == 667 || screenHeight == 568 {
            selectLabelAndRefreshButtonStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        }
        else {
            selectLabelAndRefreshButtonStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        }
        selectLabelAndRefreshButtonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 10).isActive = true
        selectLabelAndRefreshButtonStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: -10).isActive = true
    }
    
    func mergeSelectLabelAndRefreshButton() {
        configureSelectVStack()
        
//        selectLabelAndRefreshButtonStackView.addArrangedSubview(selectVerticalStackView)
//        selectLabelAndRefreshButtonStackView.addArrangedSubview(refreshButton)
        selectLabelAndRefreshButtonStackView.spacing = 20
        selectLabelAndRefreshButtonStackView.axis = .horizontal
        self.view.addSubview(selectLabelAndRefreshButtonStackView)
        setConstraintSelectAndRefresh()
        
        [selectVerticalStackView, refreshButton].forEach { selectLabelAndRefreshButtonStackView.addArrangedSubview($0) }
    }
    
    func configureMapView() {
        MapViewController.currentLocation = locationManager.location ?? CLLocation(latitude: 36.343805, longitude: 127.417154)
        if let defaultLocation = MapViewController.currentLocation {
            currentCamera = GMSCameraPosition.camera(
                withLatitude: defaultLocation.coordinate.latitude,
                longitude: defaultLocation.coordinate.longitude,
                zoom: preciseLocationZoomLevel)
        }
        //MARK: 여기서 맵뷰 생성
        mapView = GMSMapView.map(withFrame: view.bounds, camera: currentCamera)
        mapView.setMinZoom(0, maxZoom: 20)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        MapViewController.handleMapVC.mapView = mapView
        self.view.addSubview(mapView)
    }
    
    func updateSelectCount() {
        countLabel.text = "\(selectedRestaurantsCount) / 5"
        if selectedRestaurantsCount == 5 {
            selectVerticalStackView.removeFromSuperview()
            isSelectedFiveRestaurant = true
            user.hasSelectedFavorites = true
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
            MapViewController.currentLocation = CLLocation(latitude: CLLocationDegrees(36.343805), longitude: CLLocationDegrees(127.417154))
            getLocationUsagePermission()
            
        case .denied:
            // [x] 위치접근 거부시 기본위치 대전으로 설정 : 대전이 한국에서 중간지점으로 이길래 ㅎㅎ
            print("GPS 권한 요청 거부됨")
            MapViewController.currentLocation = CLLocation(latitude: CLLocationDegrees(36.343805), longitude: CLLocationDegrees(127.417154))
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
    
    
    // 기존 mapview에 포함된 infowindow 탭시 반응하는 함수는 infowindow를 커스텀해서 사용하게되면서 사용불가
    func didTapInfoWindow(_ sender: Any) {
        performSegue(withIdentifier: "DetailRestaurantInfo", sender: nil)
        print("Infowindow!")
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        // MARK: #ISSUE1 기존의 infowindow가 화면뒤로 겹쳐서 생성됨
        // detailView가 사라지고 나서도 기존의 infowindow가 보임
        setPreviousMarkerRed()
        showInfoWindow(marker: marker, with: .tmap)
        setMarkerColor(marker: marker, with: UIColor.green)
        selectedMarkers.append(marker)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        // MARK: #ISSUE1 해결 - 겹치는 이미지 삭제
        return UIView()
    }
    
    // 어느곳을 터치하던 좌표만을 보여주는 함수
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        infoWindow.removeFromSuperview()
        setPreviousMarkerRed()
    }
    
    // [x] 지도 이동시에도 그 마커위에 그대로 남겨 놓게하기.
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        if (locationMarker != nil) {
            guard let location = locationMarker?.position else { return }
            infoWindow.center = mapView.projection.point(for: location)
            infoWindow.center.y = infoWindow.center.y - 110
        }
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("zoomLevel : ",mapView.camera.zoom)
    }
    
    func initializeInfoWindow(marker: GMSMarker) {
        // infoWindow 초기화
        locationMarker = marker
        infoWindow.removeFromSuperview()
        infoWindow.spotPhotos = []
        infoWindow = loadNiB()
        
        // infoWindow 테두리 지정 / 버튼 둥글게 (현재 버튼에선 적용 x)
        infoWindow.delegate = self
        infoWindow.layer.cornerRadius = 12
        infoWindow.layer.borderWidth = 0
        infoWindow.likeButton.layer.cornerRadius = infoWindow.likeButton.frame.height / 2
    }
    
    func configureInfoWindow(at marker: GMSMarker, with map: GMSMarker.basisOfMap) {
        initializeInfoWindow(marker: marker)
        
        // 데이터가 아닌 infoWindow에 나타나는 이름만 짤라줌.
        guard let rawTitle = marker.title else { return }
        shownRestaurant = Restaurant(name: rawTitle, position: marker.position)
        
        // infoWindow에 들어갈 정보 할당 및 위치 지정
        infoWindow.nameLabel.text = " " + shownRestaurant!.transformNameToShow(basisof: map)
        setMeokBTIRanking()
        infoWindow.center = mapView.projection.point(for: marker.position)
        infoWindow.center.y = infoWindow.center.y - 110
        
        // 버튼액션함수가 buttonTapped을 기준으로 실행되는데 연동이 안되있으므로 infoWindow를 다른 것을 띄웠다가 돌아왔을 때 버튼이미지가 안 바뀌는 이슈
        // Solution: buttonTapped과 연동시켜주면서 버튼 동작을 정상적으로 만들어줌
        infoWindow.likeButtonTapped = shownRestaurant!.like
        infoWindow.setButtonImage()
    }
    
    fileprivate func getPlaceID(_ marker: GMSMarker) {
        if let name = marker.title {
            print("here is didTap", name)
            // 식당이름으로 placeID를 받아오기 (API호출)
            fetchPlaceID(restaurantName: name) { (placeID) in
                // 받아온 placeID로 해당 식당 사진 받아오기
                if let selectedPlaceID = placeID {
                    //                    self.fetchRestaurantPhoto(placeID: selectedPlaceID)
                    
                    DispatchQueue.main.async {
                        self.shownRestaurantPlaceID = selectedPlaceID
                    }
                }
                
            }
        }
    }
    
    func showInfoWindow(marker: GMSMarker, with map: GMSMarker.basisOfMap) {
        // MARK: 마커에 필요한 정보: title, position
        configureInfoWindow(at: marker, with: map)
        self.view.addSubview(infoWindow)
        
        mapView.animate(to: GMSCameraPosition(target: marker.position, zoom: mapView.camera.zoom))
        
        getPlaceID(marker)
        
        // DetailView에 뿌릴 정보지만 속도가 느려 미리 정보를 얻어옴.
        getAddress(of: shownRestaurant!)
        getPhoneNO(of: shownRestaurant!)
    }
    
//MARK: 식당만 뜨게하는
    func generateAroundMarker(bothLatLng currentPosition: CLLocationCoordinate2D, count: Int) {
        // categoryName: 카테고리 5개까지 가능 ;로 구분, radius: 단위 1km
        pathData.requestFindNameAroundPOI(currentPosition, categoryName: "식당", radius: 20, count: count, completion: { (result, error) -> Void in
            // 가져온 결과로 주변식당 위치에 마커 띄우기
            if let result = result {
                DispatchQueue.main.async {
                    // Realtimebase(Firebase)에서 child에 들어가지 못하는 문자까지 걸러냄
                    let withoutParkingResult = result.filter { !(($0.name?.contains("주차장"))!) && !(($0.name?.contains("."))!) && !(($0.name?.contains("#"))!) && !(($0.name?.contains("["))!) && !(($0.name?.contains("]"))!) && !(($0.name?.contains("$"))!)}
                    
                    for poi in withoutParkingResult {
                        let marker = GMSMarker(position: poi.coordinate!)
                        marker.title = poi.name
                        marker.snippet = poi.address
                        marker.map = self.mapView
                        
                        self.saveTempPoiItem(item: poi)
                    }
                }
            }
        })
    }
    
    func setMarkerColor(marker: GMSMarker, with color: UIColor) {
        marker.icon = GMSMarker.markerImage(with: color)
    }
    
    fileprivate func setPreviousMarkerRed() {
        if !selectedMarkers.isEmpty {
            setMarkerColor(marker: selectedMarkers[0], with: UIColor.red)
            _ = selectedMarkers.popLast()
        }
    }
    
    func saveTempPoiItem(item: TMapPoiItem) {
        tempPoiItems.append(item)
    }
    
    @objc func updateAroundMarker() {
        refreshButton.pulsate()
        let cameraPosition = self.mapView.camera
        
        switch cameraPosition.zoom {
        
        case 15...17:
            generateAroundMarker(bothLatLng: cameraPosition.target,count: 30)
            
        case 17...18:
            generateAroundMarker(bothLatLng: cameraPosition.target,count: 50)
            
        case 18...20:
            generateAroundMarker(bothLatLng: cameraPosition.target,count: 100)
            
        default:
            generateAroundMarker(bothLatLng: cameraPosition.target,count: 10)
        }
    }
    
    func fetchPlaceID(restaurantName name: String, completion: @escaping (String?) -> Void) {
        let baseURL = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?")!
        
        let query: [String: String] = [
            "key": APIKeys.GoogleMaps.getAPIKey(),
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
                print("PlaceID is Okay")
                completion(result.restaurant[0].placeID)
            } else {
                print("PlaceID가 안 받아와져;;")
                completion(nil)
                return
            }
        }
        task.resume()
    }
    
    func fetchMeokBTIRankingFromFirebase(completion: @escaping (NSDictionary) -> Void) {
        // Firebase에서 식당명에 맞는 MeokBTI 데이터 가져옴 -> 좋아요순 상위 3개의 MeokBTI만 추려냄
        ref = Database.database().reference()
        guard let shownRestaurant = shownRestaurant else { return }
        let top3MeokBTIQuery = ref.child("\(shownRestaurant.name)/meokBTIRanking").queryOrderedByValue().queryLimited(toLast: 3)
        
        top3MeokBTIQuery.observeSingleEvent(of: DataEventType.value) { snapshot in
            guard let value = snapshot.value as? NSDictionary else { return completion([:])}
            print("observeSingleEvent",value)
            completion(value)
        }
    }
    
    func fetchCurrentLikeCount(completion: @escaping (Int) -> Void) {
        ref = Database.database().reference()
        guard let shownRestaurant = shownRestaurant,
              let userMeokBTI = user.meokBTI?.meokBTI else { return }
        let meokBTIRankingRef = ref.child("\(shownRestaurant.name)/meokBTIRanking/\(userMeokBTI)")
        
        meokBTIRankingRef.observe(DataEventType.value) { snapshot in
            guard let value = snapshot.value as? NSNumber else { return }
            let count = Int(value)
            completion(count)
        }
    }
    
    func setMeokBTIRanking() {
        // Firebase에서 먹BTI랭킹 가져와서 infowindow에 먹BTI랭킹 3위까지 넣어줌
        fetchMeokBTIRankingFromFirebase { top3 in
            self.meokBTIRanking = ""
            for (idx, meokBTI) in top3.enumerated() {
                var medal: String
                
                switch idx {
                case 0:
                    medal = Ranking.first.medal
                    
                case 1:
                    medal = Ranking.second.medal
                    
                case 2:
                    medal = Ranking.third.medal
                    
                default:
                    print("Not a medalist more")
                    return
                }
                
                DispatchQueue.main.async {
                    self.meokBTIRanking += "\(medal)\(meokBTI.key)"
                    self.infoWindow.rankingLabel.text = self.meokBTIRanking
                    // [x] 원하는 결과 : 🥇EMGI🥈EMGC🥉EMBC
                }
            }
            
            self.top3MeokBTIData = top3
        }
    }
    
    func setDefaultCameraZoom() {
        print("it's me cameraZoom")
        guard mapView != nil  else { return }
        mapView.animate(toZoom: 15)
        
    }
    
    func didTapLikeButton(_ sender: Bool) {
        // [x] 서버로 좋아요 누른거 전송
        // [x] Like, 좋아한 식당목록에 추가
        // [x] Unlike, 좋아한 식당목록에서 제거

        guard let shownRestaurant = shownRestaurant else { return }
    
        if sender {
            print("Like!")
            selectedRestaurantsCount += 1
            user.favoriteRestaurants.append(shownRestaurant)
            addMeokBTILikeCount()
            

        } else {
            print("Unlike!")
            selectedRestaurantsCount -= 1
            user.favoriteRestaurants.remove(at: getRestaurantIndex())
            
            if isLikeCountLastOne() {
                deleteMeokBTILikeCount()
            } else {
                subtractMeokBTILikeCount()
            }
        }
        
        updateSelectCount()
        User.saveToFile(user: user)
        sendRestaurantLikeToFirebase()
    }
    
    func isLikeCountLastOne() -> Bool {
        fetchCurrentLikeCount { count in
            DispatchQueue.main.async {
                self.meokBTILikeCount = count
            }
        }

        return (meokBTILikeCount <= 1) ? true : false
    }
    
    func addMeokBTILikeCount() {
        guard let userMeokBTI = user.meokBTI?.meokBTI,
              let shownRestaurant = shownRestaurant else { return }
        
        beingUpdatedContents = ["\(shownRestaurant.name)/meokBTIRanking/\(userMeokBTI)" : ServerValue.increment(NSNumber(1))] as [String : Any]
    }
    
    func subtractMeokBTILikeCount() {
        guard let userMeokBTI = user.meokBTI?.meokBTI,
              let shownRestaurant = shownRestaurant else { return }
        
        beingUpdatedContents = ["\(shownRestaurant.name)/meokBTIRanking/\(userMeokBTI)" : ServerValue.increment(NSNumber(-1))] as [String : Any]
    }
    
    func deleteMeokBTILikeCount() {
        guard let userMeokBTI = user.meokBTI?.meokBTI,
              let shownRestaurant = shownRestaurant else { return }
        
        beingUpdatedContents = ["\(shownRestaurant.name)/meokBTIRanking/\(userMeokBTI)" : nil] as [String : Any]
    }
    
    func sendRestaurantLikeToFirebase() {
        // (데이터관계 : 식당이름 -> 먹BTI랭킹 -> 먹BTI별 좋아요 갯수) 좋아요 -> 로컬에서 좋아요 여부 확인 -> 서버로 보냄
        ref = Database.database().reference()
        self.ref.updateChildValues(beingUpdatedContents)
        print("success MeokBTI Ranking update")
    }
    
    func getAddress(of restaurant: Restaurant) {
        // TODO: TMAP API로 정확한 주소 얻어오기
        let point = restaurant.position
        
        pathData.convertGpsToAddressAt(point) { (address, error) in
            DispatchQueue.main.async {
                if let address = address {
                    self.restaurantAddress = address
                }
            }
        }
    }
    
    func getPhoneNO(of restaurant: Restaurant) {
        // TODO: poi에서 폰번호 얻어오기
        var restaurantPois = tempPoiItems.filter { item in
            return item.name == restaurant.name && item.coordinate == restaurant.position
        }
        
        if restaurantPois.isEmpty {
            getJustOnePoi(restaurant.name)
            restaurantPois.append(tempPoiItems.last!)
        }
        
        // #ISSUE 식당검색후 해당 식당으로 이동시 Fatal error: Index out of range -> marker를 만들지 않기 때문 -> 함수 안에서 추가해줘서 해결
        if let phoneNumber = restaurantPois[0].telNO {
            if phoneNumber == "" {
                self.restaurantPhoneNumber = "정보가 없습니다."
            } else {
                self.restaurantPhoneNumber = phoneNumber
            }
        }
    }
    
    func getJustOnePoi(_ name: String) {
        pathData.requestFindTitlePOI(name) { result, error in
            if let pois = result {
                let poi = pois[0]
                self.saveTempPoiItem(item: poi)
            }
        }
    }
    
    func getRestaurantIndex() -> Int {
        let index = user.favoriteRestaurants.firstIndex(where: { $0.name == shownRestaurant!.name && $0.position == shownRestaurant!.position })!
        return index
    }
}
