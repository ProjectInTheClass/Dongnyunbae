//
//  CollectViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//

import UIKit

class CollectViewController: UIViewController{

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension CollectViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meokBTIResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeokBTIResultCollectionViewCell", for: indexPath) as! MeokBTIResultCollectionViewCell
        cell.setup(with: meokBTIResults[indexPath.row])
        
        return cell
    }
}

extension CollectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension CollectViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vcDest = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        vcDest.sproduct = meokBTIResults[indexPath.row]
        
        navigationController?.pushViewController(vcDest, animated: true)
    }
}




