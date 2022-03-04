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
    
@IBAction func ViewInside(_ sender: Any) {
        
        print ("good")
    }
    
    
}

extension CollectViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(viewdetail), for: .touchUpInside)
        return cell
    }
    
    @objc func viewdetail(sender:UIButton)
    {
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        let hii = movies[indexpath1.row]
        let hi = indexpath1.row
        print(hii)
        print(hi)
    
    }
}




extension CollectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}

extension CollectViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title)
    }
}




