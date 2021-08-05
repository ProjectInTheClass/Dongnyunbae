//
//  MapViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/04.
//

import UIKit
import NMapsMap
class MapViewController: UIViewController, NMFMapViewTouchDelegate, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    @IBOutlet weak var mapView: NMFNaverMapView!
    
    var currentTappedSymbol = Set<NMFSymbol>()
    var likedRestaurant = Set<NMFSymbol>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showLocationButton = true
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        
        updateMarker(mapView, symbol)
        print("tap",currentTappedSymbol)
        return true
        
    }
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        
    }
    func updateMarker(_ mapview: NMFMapView,_ symbol: NMFSymbol) {
        print("First")
        
        var iconImage = NMF_MARKER_IMAGE_GRAY
        
//        if currentTappedSymbol.contains(symbol) {
//            iconImage = NMF_MARKER_IMAGE_GREEN
//        } else {
//            currentTappedSymbol.append(symbol)
//        }
        
        for rest in currentTappedSymbol {
            if rest.position == symbol.position && rest.caption == symbol.caption {
                iconImage = NMF_MARKER_IMAGE_GREEN
            } else {
                print("append")
                currentTappedSymbol.insert(symbol)
                break
            }
        }
        
        if currentTappedSymbol.isEmpty {
            currentTappedSymbol.insert(symbol)
        }
        
        let marker = NMFMarker(position: symbol.position, iconImage: iconImage)
        marker.mapView = mapview
        
        
        let infoWindow = NMFInfoWindow()
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        dataSource.title = "\(symbol.caption!)"
        infoWindow.dataSource = dataSource
            
        // 마커에 달아주기
        infoWindow.open(with: marker)
        infoWindow.close()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            //location 접근권한 요청확인
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                print("GPS 권한 설정됨")
                self.locationManager.startUpdatingLocation() // 주소데이터를 현위치로 업데이트
            case .restricted, .notDetermined:
                print("GPS 권한 설정되지 않음")
                getLocationUsagePermission()
            case .denied:
                print("GPS 권한 요청 거부됨")
                getLocationUsagePermission()
            default:
                print("GPS: Default")
            }
        }
    
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
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
