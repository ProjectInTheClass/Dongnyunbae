//
//  SearchResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/01/27.
//

import UIKit
import TMapSDK
import GoogleMaps

class SearchResultsViewController: UIViewController {
    
    var searchResultsTableView: UITableView?
    let pathData = TMapPathData()
    
    var tempResultData: [TMapPoiItem] = []
    var searchResultData: [TMapPoiItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchResultsTableView()
        connectTableViewWithVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestAroundRestaurant()
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
}

// MARK: SearchUpdate
extension SearchResultsViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        // 사용자 입력할 때마다 호출되는 함수
        guard let userSearchKeyword = searchController.searchBar.text else { return }
        
        searchResultData = tempResultData.filter { $0.name?.contains(userSearchKeyword) ?? false }
        searchResultsTableView?.reloadData()
    }
    
    func requestAroundRestaurant() {
        let center = CLLocationCoordinate2D(latitude: MapViewController.currentLocation!.coordinate.latitude, longitude: MapViewController.currentLocation!.coordinate.longitude)
        
        // 33km, 200개가 max
        pathData.requestFindNameAroundPOI(center, categoryName: "식당", radius: 33, count: 200, completion: { (result, error) -> Void in
            if let result = result {
                DispatchQueue.main.async {
                    // 주차장 및 특수문자가 들어간 식당들을 걸러냄
                    let withoutParkingResult = result.filter { !(($0.name?.contains("주차장"))!) && !(($0.name?.contains("."))!) && !(($0.name?.contains("#"))!) && !(($0.name?.contains("["))!) && !(($0.name?.contains("]"))!) && !(($0.name?.contains("$"))!)}
                    
                    self.tempResultData = withoutParkingResult
                }
            }
        })
    }
}

// MARK: TableView
extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = searchResultData[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: 셀이 터치 되었을 때 식당으로 이동시켜주는 함수
    // TODO: infoWindow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // infoWindow 생성되게
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        if let rootVC = rootVC as? MeokBTITabBarController {
            guard let mapVC = rootVC.viewControllers![1] as? MapViewController else { return }
            let poi = searchResultData[indexPath.row]
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
