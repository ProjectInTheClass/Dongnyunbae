//
//  CollectViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//

import UIKit
class MeokBTIResultsViewController: UIViewController{
    @IBOutlet var MeokBTIResultsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "테스트 결과 모아보기"
        MeokBTIResultsCollectionView.dataSource = self
        MeokBTIResultsCollectionView.delegate = self
        MeokBTIResultsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension MeokBTIResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meokBTIResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeokBTIResultCollectionViewCell", for: indexPath) as! MeokBTIResultCollectionViewCell
        cell.setup(with: meokBTIResults[indexPath.row])
        return cell
    }
}

extension MeokBTIResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.bounds.width / 2 - 20
        let cellHeight = view.bounds.height / 3 - 20
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension MeokBTIResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let eachResultVC = storyboard?.instantiateViewController(withIdentifier: "EachResultViewController") as? EachResultViewController else { return }
        eachResultVC.selectedResult = meokBTIResults[indexPath.row]
        navigationController?.pushViewController(eachResultVC, animated: true)
    }
}
