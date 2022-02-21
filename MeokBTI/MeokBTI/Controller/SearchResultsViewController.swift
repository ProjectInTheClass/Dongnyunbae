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
    
    // 검색버튼이 클릭되었을 때 델리게이트에 알림
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        print("update search!")
        let pathData = TMapPathData()
        
        let center = CLLocationCoordinate2D(latitude: MapViewController.currentLocation!.coordinate.latitude, longitude: MapViewController.currentLocation!.coordinate.longitude)

        pathData.requestFindAroundKeywordPOI(center, keywordName: "치킨", radius: 1, count: 50, completion: { (result, error) -> Void in
            if let result = result {
                DispatchQueue.main.async {
                    self.tempResultData = result
                }
            }
        } )
    }
}
