//
//  MapMarkerWindow.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/17.
//

import UIKit

protocol MapMarkerDelegate: AnyObject {
//    func didTapInfoButton(data: NSDictionary)
    func didTapLikeButton()
}

class MapMarkerWindow: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    var buttonTapped: Bool = true
    
    weak var delegate: MapMarkerDelegate?
    var spotPhotos = [UIImage]()
    
    @IBAction func didTapLikeButton(_ sender: UIButton) {
//        delegate?.didTapInfoButton(data: spotData!)
        delegate?.didTapLikeButton()
        buttonTapped = !buttonTapped
        likeButton.scalesLargeContentImage = true
        if buttonTapped {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        }
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MapMarkerWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func initCollectionView() {
        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photoCollectionView.dataSource = self
        photoCollectionView.reloadData()
    }
    
    
}

extension MapMarkerWindow: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        print("im in MapMarkerView at numberofItem", spotPhotos)
        if spotPhotos.isEmpty {
            return 1
        } else if spotPhotos.count > 10 {
            let overCount = spotPhotos.count - 10
            spotPhotos.removeSubrange(0..<overCount)
        }
        return spotPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { fatalError("can't dequeue CustomCell") }
        
        print("im in MapMarkerView at cellforItem", spotPhotos.count)
        if spotPhotos.isEmpty {
            // 기본 미리보기
            cell.photoView.image = UIImage(named: "ACEG")
        } else {
            // 식당사진
            cell.photoView.image = spotPhotos[indexPath.item]
        }
        
        print("get image successfully ")
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 70, height: 100)
//    }
    
}




