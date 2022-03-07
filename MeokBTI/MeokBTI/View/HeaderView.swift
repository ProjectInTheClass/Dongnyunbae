//
//  HeaderView.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/02/20.
//

import UIKit

class HeaderView: UIView {

    //프로필 사진
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        let user = User.loadFromFile()
        
        
        //시스템에서 기본 이미지 사용하였음
        //sf 이미지
        iv.image = UIImage(systemName: "person.fill")
        iv.contentMode  = .scaleToFill
        return iv
        
    }()
    
    
    //background color 등등 변화하려면
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
     
        
    }
    
    
}
