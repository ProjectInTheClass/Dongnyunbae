//
//  LikeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/05.
//

import UIKit

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
