//
//  MovieCollectionViewCell.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//


import UIKit

class MeokBTIResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var meokBTIImageView: UIImageView!
    @IBOutlet weak var meokBTITitleLabel: UILabel!

    func setup(with result: MeokBTIResult) {
        meokBTIImageView.image = result.image
        meokBTITitleLabel.text = result.title
    }
}
