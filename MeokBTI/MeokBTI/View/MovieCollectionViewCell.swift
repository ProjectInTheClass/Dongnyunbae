//
//  MovieCollectionViewCell.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//


import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var button: UIButton!
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBAction func button(_ sender: UIButton) {
        self.button.backgroundColor = UIColor.yellow
    }
    
    
    
    
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        titleLbl.text = movie.title
    }
}
