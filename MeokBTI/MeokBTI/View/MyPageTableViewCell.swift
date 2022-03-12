//
//  MyPageCell.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/02/20.
//

import UIKit

class MyPageTableViewCell: UITableViewCell {

    let menuLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI(){
        addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        
        ])
    }
}
