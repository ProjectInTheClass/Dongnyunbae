//
//  HomeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeimage: UIImageView!
    
    
    @IBOutlet var homelabel: UILabel!
  
    
    @IBOutlet var hometext: UILabel!
    var sproduct : MeokBTIResult! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeimage.image = sproduct.image
        homelabel.text = sproduct.title
        hometext.text = sproduct.text
        
        
    }
    

 

}
