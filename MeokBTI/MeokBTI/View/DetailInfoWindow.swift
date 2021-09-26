//
//  MapMarkerWindow.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/17.
//

import UIKit
import CoreLocation

protocol DetailInfoWindowDelegate: AnyObject {
//    func didTapInfoButton(data: NSDictionary)
    func didTapLikeButton(_ sender: Bool)
}

class DetailInfoWindow: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    var buttonTapped: Bool = false
    
    weak var delegate: DetailInfoWindowDelegate?
    var spotPhotos = [UIImage]()
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "DetailInfoWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func initCollectionView() {
        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photoCollectionView.dataSource = self
        photoCollectionView.reloadData()
    }
    
    func loadDataAndCheckLikeButton(placeName: String, position: CLLocationCoordinate2D) -> Bool {
        let userData = User.loadFromFile()
        let result = userData.favoriteRestaurants.contains(where: { $0.name == placeName && $0.position == position
        })
        return result
    }
    
    func setButtonImage(_ buttonTapped: Bool) {
        if buttonTapped {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        }
    }
    

    @IBAction func didTapLikeButton(_ sender: Any) {
//        delegate?.didTapInfoButton(data: spotData!)
        print("buttonTapped in detailInfoWindow")
        buttonTapped = !buttonTapped
        delegate?.didTapLikeButton(buttonTapped)
        setButtonImage(buttonTapped)
    }
        
    
}

extension DetailInfoWindow: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
    
}




