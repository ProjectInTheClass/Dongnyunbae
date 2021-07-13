//
//  RestaurantsViewController.swift
//  tableViewPractice
//
//  Created by 추만석 on 2021/07/07.
//

import Foundation
import UIKit
import GameplayKit

class RestaurantsViewController: UITableViewController {
    
//    var colorList: [UIColor?] = [UIColor.cyan, UIColor.purple, UIColor.blue, UIColor.brown, UIColor.darkGray]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let restaurant = Restaurant(name: rawData[indexPath.row][0], meokBTI: rawData[indexPath.row][2], place: rawData[indexPath.row][1],basis: rawData[indexPath.row][3])
        
        
        // MARK: 기본셀로 subtitle 스타일로 만들어 줄 때의 코드 (식당이름,이유)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        cell.textLabel?.text = restaurant.name + "(\(restaurant.meokBTI))"
//        cell.detailTextLabel?.text = restaurant.basis
//        cell.backgroundColor = colorList[indexPath.row % colorList.count ]
        
        // MARK: customcell을 만들어 줄 떄의 코드 (식당이름,먹bti,이유)
        let cell: RestaurantCell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell",for: indexPath) as! RestaurantCell
        
        cell.nameLabel.text = restaurant.name
        cell.meokbtiLabel.text = restaurant.meokBTI
        cell.basisLabel.text = restaurant.basis
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}

struct Restaurant {
    
    var name: String
    var meokBTI: String
    let place: String
    var basis: String
    
}




