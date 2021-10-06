//
//  MapMarkerWindow.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/17.
//

import UIKit
import CoreLocation

protocol MapMarkerDelegate: AnyObject {
//    func didTapInfoButton(data: NSDictionary)
    func didTapLikeButton(_ sender: Bool)
    
    func didTapInfoWindow(_ sender: Any)
}

class MapMarkerWindow: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    var likeButtonTapped: Bool = false
    
    weak var delegate: MapMarkerDelegate?
    var spotPhotos = [UIImage]()
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MapMarkerWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
//    func initCollectionView() {
//        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
//        photoCollectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
//        photoCollectionView.dataSource = self
//        photoCollectionView.reloadData()
//    }
    
    func setButtonImage() {
        if likeButtonTapped {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        }
    }
    

    @IBAction func didTapLikeButton(_ sender: Any) {
//        delegate?.didTapInfoButton(data: spotData!)
        likeButtonTapped = !likeButtonTapped
        delegate?.didTapLikeButton(likeButtonTapped)
        setButtonImage()
    }
    
    @IBAction func didTapInfoWindow(_ sender: Any) {
        delegate?.didTapInfoWindow(sender)
    }
    
    
}
/*
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
//        print("*****collectionView return size")
//        무슨이유인지 이 함수만 실행안되는 것 같음
//        return CGSize(width: 70, height: 85)
//    }
    
}
*/



