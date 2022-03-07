//
//  SearchResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/01/27.
//

import UIKit
import TMapSDK
import GoogleMaps

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchResultsTableView: UITableView?
    
    var tempResultData: [TMapPoiItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchResultsTableView()
        connectTableViewWithVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SearchBar touched!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tempResultData.count == 0 {
//            return 1
//        }
//        else {
//            return tempResultData.count
//        }
        return tempResultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
//        if tempResultData.count == 0 {
//            content.text = " "
//        }
//        else {
//            content.text = tempResultData[indexPath.row].name
//        }
        content.text = tempResultData[indexPath.row].name
        
        cell.contentConfiguration = content
        print("Make cell!")
        
        return cell
    }
    
    func initializeSearchResultsTableView() {
        searchResultsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height)))
        
        guard let searchResultsTableView = searchResultsTableView else { return }
        self.view.addSubview(searchResultsTableView)
    }
    
    func connectTableViewWithVC() {
        searchResultsTableView?.delegate = self
        searchResultsTableView?.dataSource = self
        searchResultsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
    }

    func updateSearchResults(for searchController: UISearchController) {
        print("Update search!")
        let pathData = TMapPathData()
        
        // 사용자 입력
        guard let userSearchKeyword = searchController.searchBar.text else { return }
//        var userSearchKeyword: String
//
//        if tempResultData.count == 0 {
//            userSearchKeyword = " "
//        }
//        else {
//            userSearchKeyword = searchController.searchBar.text!
//        }
        
        // 사용자 위치
        let center = CLLocationCoordinate2D(latitude: MapViewController.currentLocation!.coordinate.latitude, longitude: MapViewController.currentLocation!.coordinate.longitude)
        
        // keywordName에 사용자 입력
        pathData.requestFindAroundKeywordPOI(center, keywordName: userSearchKeyword, radius: 10, count: 50, completion: { (result, error) -> Void in
            if let result = result {
                DispatchQueue.main.async {
//                    if self.tempResultData.count == 0 {
//                        self.tempResultData = []
//                    }
//                    else {
//                        self.tempResultData = result
//                    }
                    self.tempResultData = result
                    self.searchResultsTableView?.reloadData()
                }
            }
        })
    }
    
    // MARK: 셀이 터치 되었을 때 식당으로 이동시켜주는 함수
    // TODO: infoWindow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 확인 메시지
        print("Cell touched!")
        
        // 터치시 식당으로 카메라 이동
        MapViewController.handleMapVC.mapView.animate(toLocation: tempResultData[indexPath.row].coordinate!)
        
        // 카메라 이동 후 마커 생성
        let marker2 = GMSMarker()
        
        marker2.position = tempResultData[indexPath.row].coordinate!
        marker2.title = tempResultData[indexPath.row].name
        marker2.map = MapViewController.handleMapVC.mapView
        
        // infoWindow 생성되게
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        if let rootVC = rootVC as? MeokBTITabBarController {
            guard let mapVC = rootVC.viewControllers![1] as? MapViewController else { return }
            let poi = tempResultData[indexPath.row]
            let position = poi.coordinate!
            let marker = GMSMarker(position: position)
            marker.title = poi.name
            marker.map = mapVC.mapView
            
            mapVC.setMarkerColor(marker: marker, with: .green)
            mapVC.showInfoWindow(marker: marker, with: .tmap)
        }
        
        // 테이블뷰 꺼짐
        self.dismiss(animated: true)
    }
}
