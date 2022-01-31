//
//  SearchResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/01/27.
//

import UIKit
import TMapSDK

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    var searchResultsTableView: UITableView?
    
    var tempResultData: [TMapPoiItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchResultsTableView()
        connectTableViewWithVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hey! im  here bro!")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempResultData.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = tempResultData[indexPath.row].name
        cell.contentConfiguration = content
        print("make cell!")
        
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
        print("update search!")
        let pathData = TMapPathData()
        
        // 사용자 위치 얻기
//        let center = CLLocationCoordinate2D(latitude: 35.26781, longitude: 128.86856)
        
        let center = CLLocationCoordinate2D(latitude: MapViewController.currentLocation!.coordinate.latitude, longitude: MapViewController.currentLocation!.coordinate.longitude)
        
        // keywordName에 사용자 입력 들어가야함
        pathData.requestFindAroundKeywordPOI(center, keywordName: "sk", radius: 500, count: 20, completion: { (result, error)->Void in
            if let result = result {
                DispatchQueue.main.async { self.tempResultData = result
                }
            }
        })
    }
}
