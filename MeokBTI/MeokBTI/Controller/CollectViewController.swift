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
        guard let selectedCell = sender.superview?.superview as? UICollectionViewCell else {
            return
        }
        
        guard let indexPathSelected = collectionView.indexPath(for: selectedCell) else {
            return
        }
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        let hii = movies[indexPathSelected.row]
        let hi = indexpath1.row
        print(hii)
        print(hi)
        
        guard let vcDest = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        vcDest.sproduct = hii
        
        navigationController?.pushViewController(vcDest, animated: true)
        
        
        
    }
}




extension CollectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension CollectViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title)
        
        guard let vcDest = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        vcDest.sproduct = movies[indexPath.row]
        
        navigationController?.pushViewController(vcDest, animated: true)
        
        
    }
}




