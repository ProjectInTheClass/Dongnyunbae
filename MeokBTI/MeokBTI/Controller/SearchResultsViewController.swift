//
//  SearchResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/01/27.
//

import UIKit
import TMapSDK

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
        return tempResultData.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = tempResultData[indexPath.row].name
        
        cell.contentConfiguration = content
        print("Make cell!")
        
        return cell
    }
    
    func initializeSearchResultsTableView() {
        searchResultsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height - 0)))
        
        guard let searchResultsTableView = searchResultsTableView else { return }
        self.view.addSubview(searchResultsTableView)
    }
    
    func connectTableViewWithVC() {
        searchResultsTableView?.delegate = self
        searchResultsTableView?.dataSource = self
        searchResultsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
    }
    
    func searchPoi(of: String) {
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        print("Update search!")
        let pathData = TMapPathData()
        
        // 사용자 입력
        guard let userSearchKeyword = searchController.searchBar.text else { return }
        
        // 사용자 위치
        let center = CLLocationCoordinate2D(latitude: MapViewController.currentLocation!.coordinate.latitude, longitude: MapViewController.currentLocation!.coordinate.longitude)
        
        // keywordName에 사용자 입력
        pathData.requestFindAroundKeywordPOI(center, keywordName: userSearchKeyword, radius: 10, count: 50, completion: { (result, error) -> Void in
            if let result = result {
                DispatchQueue.main.async {
                    self.tempResultData = result
                    self.searchResultsTableView?.reloadData()
                }
            }
        } )
    }
    
    // 셀이 터치 되었을 때 식당으로 이동시켜주는 함수
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let indexpath = tableView.(<#T##tableView: UITableView##UITableView#>, didSelectRowAt: <#T##IndexPath#>)
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let place: T
//        mapView.animate(toLocation: place.coordinate)
        print("Cell touched!")
    }
    
}
