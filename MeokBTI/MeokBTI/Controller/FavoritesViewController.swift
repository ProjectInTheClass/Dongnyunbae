//
//  LikeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/05.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate {
    let tableView = UITableView(frame: .zero, style: .grouped)
    let user = User.loadFromFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.navigationItem.title = "관심 식당"
    }
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: "MyPageTableViewCell")
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = .white
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let user = User.loadFromFile()
        return user.favoriteRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath) as! MyPageTableViewCell
        let user = User.loadFromFile()

        cell.menuLabel.text = user.favoriteRestaurants[indexPath.row].name
        cell.menuLabel.font = UIFont(name: "Binggrae", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}





