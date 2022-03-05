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
        var a = user.favoriteRestaurants[0].name
        print(a)
        print(type(of: a))
        print(user.favoriteRestaurants[0])
        
    }
    
 

}
