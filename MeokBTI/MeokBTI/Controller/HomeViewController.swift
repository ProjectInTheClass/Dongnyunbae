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
  
    
    var sproduct : Movie!=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeimage.image = sproduct.image
        homelabel.text = sproduct.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
