//
//  LikeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/05.
//

import UIKit

class LikeViewController: UIViewController {

    @IBOutlet var table: UITableViewCell!
    @IBOutlet var hello: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
       let user = User.loadFromFile()
        
        
        
        hello.text = user.favoriteRestaurants.description
        print(user.favoriteRestaurants)
        
    }
    
 

}
