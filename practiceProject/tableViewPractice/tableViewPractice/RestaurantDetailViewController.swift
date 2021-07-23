//
//  RestaurantDetailViewController.swift
//  tableViewPractice
//
//  Created by 추만석 on 2021/07/17.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var meokBTILabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
//    var restaurantName: String?
//    var meokBTI: String?
//    var location: String?
//    var review: String?
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantNameLabel.text = restaurant.name
        meokBTILabel.text = restaurant.meokBTI
        locationLabel.text = restaurant.place
        reviewLabel.text = restaurant.basis

        // Do any additional setup after loading the view.
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
