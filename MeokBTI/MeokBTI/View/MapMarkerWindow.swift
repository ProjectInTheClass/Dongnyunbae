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
