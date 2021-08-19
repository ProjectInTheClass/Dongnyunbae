//
//  MeokBTI.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/19.
//

import Foundation

enum MeokType: Character {
    case accessPos = "A", accessNeg = "B", ammountPos = "C", ammountNeg = "D", moodPos = "E", moodNeg = "F", pricePos = "G", priceNeg = "H"
    
}

enum MeokBTI: String {
//        case ACEG, ACFG, BCEG, BCFG,
    //         ACEH, ACFH, BCEH, BCFH,
    //         ADEG, ADFG, BDEG, BDFG,
    //         ADEH, ADFH, BDEH, BDFH
//    case ACEG = "ACEG", ACFH = "ACFH", BDFH = "BDFH"
    
    case EMGI = "ACEG",    EMBI = "ACFG",    HMGI = "BCEG",    HMBI = "BCFG",
         EMGC = "ACEH",    EMBC = "ACFH",    HMGC = "BCEH",    HMBC = "BCFH",
         ELGI = "ADEG",    ELBI = "ADFG",    HLGI = "BDEG",    HLBI = "BDFG",
         ELGC = "ADEH",    ELBC = "ADFH",    HLGC = "BDEH",    HLBC = "BDFH"
    
    var meokBTI: String {
        switch self {
        case .EMGI :
            return "EMGI"
            
        case .EMBI :
            return "EMBI"
            
        case .HMGI :
            return "HMGI"
            
        case .HMBI :
            return "HMBI"
        //----
        case .EMGC :
            return "EMGC"
            
        case .EMBC :
            return "EMBC"
            
        case .HMGC :
            return "HMGC"
            
        case .HMBC :
            return "HMBC"
        //----
        case .ELGI :
            return "ELGI"
       
        case .ELBI :
            return "ELBI"
            
        case .HLGI :
            return "HLGI"
            
        case .HLBI :
            return "HLBI"
        //----
        case .ELGC :
            return "ELGC"
       
        case .ELBC :
            return "ELBC"
            
        case .HLGC :
            return "HLGC"
            
        case .HLBC :
            return "HLBC"
        }
    }
    
    var shortDefinition : String {
        switch self {
        case .EMGI :
            return "질투많은 오이"
            
        case .EMBI :
            return "3대600 감자"
            
        case .HMGI :
            return "혼자 바쁜 민트초코"
            
        case .HMBI :
            return "배불뚝이 캔맥주"
        //----
        case .EMGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .EMBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HMGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HMBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        //----
        case .ELGI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
       
        case .ELBI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLGI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLBI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        //----
        case .ELGC :
            return "낭만있는 마카롱"
       
        case .ELBC :
            return "게으른 라면"
            
        case .HLGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        }
    }
    
    var longDescription: String {
        switch self {
        case .EMGI :
            return "Blah~ Blah~ Blah~ Blah~"
            
        case .EMBI :
            return "Blah~ Blah~ Blah~ Blah~"
            
        case .HMGI :
            return "Blah~ Blah~ Blah~ Blah~"
            
        case .HMBI :
            return "Blah~ Blah~ Blah~ Blah~"
        //----
        case .EMGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .EMBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HMGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HMBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        //----
        case .ELGI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
       
        case .ELBI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLGI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLBI :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        //----
        case .ELGC :
            return "낭만을 추구하는 당신에게 식당은 편안하고 훌륭한 분위기를주어야만 합니다. 이를 위해 비싼 비용도 마다하지 않는 당신은 낭만파 마카롱!"
       
        case .ELBC :
            return "음식 먹을 땐 간편한게 최고! 음식의 양이 어떻든, 분위기가 어떻든,가격도 신경쓰이지 않지만 편한 게 최고인 당신에게서 게을러보여도 친근함이 느껴집니다."
            
        case .HLGC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
            
        case .HLBC :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        }
    }
    
    func showConvertedMeokBTI() {
        print(self.meokBTI)
    }
    
    
}

//enum MeokBTI: String {
////    case ACEG, ACFG, BCEG, BCFG,
//    //         ACEH, ACFH, BCEH, BCFH,
//    //         ADEG, ADFG, BDEG, BDFG,
//    //         ADEH, ADFH, BDEH, BDFH
//    case ACEG = "ACEG", ACFH = "ACFH", BDFH = "BDFH"
//
//    var definition : String {
//        switch self {
//        case .ACEG :
//            return "새로운 음식 도전하는 것을 좋아함. 어느식당에서나 혼밥 할 수 있는 힘을 가지고 있다. 음식 가지고 장난치는건 못참는 편."
//
//        case .ACFH :
//            return "게으른 완벽주의자. 메뉴를 정하는데 오랜 시간이 걸린다. 열 번 중 여덟번은 내가 한일에 만족 하지 못함 항상 가는 식당이 정해져있다"
//
//        case .BDFH :
//            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
//        }
//    }
//
//
//}
