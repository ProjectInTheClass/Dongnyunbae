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
    @IBOutlet weak var photoScrollView: UIScrollView!
    
    var buttonTapped: Bool = true
    
    weak var delegate: MapMarkerDelegate?
    var spotData: NSDictionary?
    
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
}
