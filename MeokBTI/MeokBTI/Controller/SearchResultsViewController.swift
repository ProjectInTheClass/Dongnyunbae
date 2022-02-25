//
//  SearchResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/01/27.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    let tempResultData = ["크로월당", "크로월당 본점"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hey! im  here bro!")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = tempResultData[indexPath.row]
        cell.contentConfiguration = content
        print("make cell!")
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
