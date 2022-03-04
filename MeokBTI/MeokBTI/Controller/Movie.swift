
//  Movie.swift
//  CollectionViews
//
//  Created by Emmanuel Okwara on 28/06/2020.
//  Copyright © 2020 Macco. All rights reserved.
//

import UIKit

struct Movie {
    let title: String
    let image: UIImage
}

let movies: [Movie] = [
    Movie(title: "까다로운 오이", image: #imageLiteral(resourceName: "EMGI.png")),
    Movie(title: "3대600 감자", image:#imageLiteral(resourceName: "EMBI.png") ),
    Movie(title: "혼자 바쁜 민트초코", image:#imageLiteral(resourceName: "HMGI.png") ),
    Movie(title: "배불뚝이 캔맥주", image: #imageLiteral(resourceName: "HMBI.png")),
    Movie(title: "익살스런 치아바타", image: #imageLiteral(resourceName: "EMGC.png")),
    Movie(title: "부끄러운 치킨", image:#imageLiteral(resourceName: "EMBC.png") ),
    Movie(title: "먹방BJ 랍스타", image: #imageLiteral(resourceName: "HMGC.png")),
    Movie(title: "배부른 대왕돈까스", image: #imageLiteral(resourceName: "HMBC.png")),
    Movie(title: "금사빠 새우튀김", image: #imageLiteral(resourceName: "ELGI.png")),
    Movie(title: "영민한 삼각김밥", image: #imageLiteral(resourceName: "ELBI.png")),
    Movie(title: "텐션폭발 소주", image: #imageLiteral(resourceName: "HLGI.png")),
    Movie(title: "구두쇠 붕어빵", image: #imageLiteral(resourceName: "HLBI.png")),
    Movie(title: "낭만있는 마카롱", image: #imageLiteral(resourceName: "ELGC.png")),
    Movie(title: "게으른 라면", image:  #imageLiteral(resourceName: "ELBC.png")),
    Movie(title: "도도한 레드와인", image: #imageLiteral(resourceName: "HLGC.png")),
    Movie(title: "늘 졸린 번데기", image:  #imageLiteral(resourceName: "HLBC.png"))
    

]
