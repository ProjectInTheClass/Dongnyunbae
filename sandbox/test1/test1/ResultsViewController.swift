//
//  ResultsViewController.swift
//  test1
//
//  Created by 박대호 on 2021/08/16.
//
import UIKit
import Foundation
import GooglePlaces
import GoogleMaps
import CoreLocation

protocol ResultsViewControllerDelegate: AnyObject {
    func didTapPlace(with coordinates: CLLocationCoordinate2D)
}
class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: ResultsViewControllerDelegate?
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    } ()

    private var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 자동완성 뷰 컨트롤러
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    public func update(with places: [Place]) {
        self.tableView.isHidden = false
        self.places = places
        print(places.count)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.isHidden = true
        
        let place = places[indexPath.row]
        GooglePlacesManager.shared.resolveLocation(for: place) { result in
            switch result {
            case .success(let coordinate):
                DispatchQueue.main.async {
                    self.delegate?.didTapPlace(with: coordinate)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
