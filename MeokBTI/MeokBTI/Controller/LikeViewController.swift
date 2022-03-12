//
//  LikeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/05.
//

import UIKit
import SafariServices

private let cellID = "Cell"

class LikeViewController: UIViewController, UITableViewDelegate {
 
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let user = User.loadFromFile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    func configureUI(){
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: cellID)
        
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
    }
  

}

extension LikeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let user = User.loadFromFile()
        
        return user.favoriteRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageTableViewCell
        let user = User.loadFromFile()

        cell.menuLabel.text = user.favoriteRestaurants[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}





/*

class LikeViewController: UIViewController {

    @IBOutlet var hello: UITextField!
    @IBOutlet var hello2: UITextField!
    @IBOutlet var hello3: UITextField!
    @IBOutlet var hello4: UITextField!
    @IBOutlet var hello5: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
       let user = User.loadFromFile()
        
        hello.text = user.favoriteRestaurants[0].name
        hello2.text = user.favoriteRestaurants[1].name
        hello3.text = user.favoriteRestaurants[2].name
        hello4.text = user.favoriteRestaurants[3].name
        hello5.text = user.favoriteRestaurants[4].name
        
    }
    
 

}

*/
