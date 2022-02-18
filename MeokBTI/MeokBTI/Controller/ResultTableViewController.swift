//
//  ResultTableViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/19.
//

import UIKit

class ResultTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    

    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var meokBTIImageView: UIImageView!
    @IBOutlet weak var shortDesriptionLabel: UILabel!
    @IBOutlet weak var oneLineDescriptions: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var harmonyCollectionView: UICollectionView!
    
    var imageToShare = UIImage()
    var userMeokBTI: MeokBTI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let firstCellCaptureImage = cell.contentView.transformToImage()
            imageToShare = firstCellCaptureImage!
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let harmonies = userMeokBTI?.harmonies.harmonies.count else { return 0 }
        
        return harmonies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "harmonyCell", for: indexPath) as? HarmonyCollectionViewCell else { return UICollectionViewCell() }
        
        if let harmonies = userMeokBTI?.harmonies.harmonies {
            cell.meokBTIImage.image = UIImage(named: "\(harmonies[indexPath.row].meokBTI).png")
            cell.shortDefinition.text = "\(harmonies[indexPath.row].shortDefinition)"
        }
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 120, height: 120)
//    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
