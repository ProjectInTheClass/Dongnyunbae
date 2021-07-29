//
//  QuestionData.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import Foundation
import UIKit

struct  Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: MeokType
}

enum MeokType: Character {
    case accessPos = "A", accessNeg = "B", ammountPos = "C", ammountNeg = "D", moodPos = "E", moodNeg = "F", pricePos = "G", priceNeg = "H"
    
}

enum MeokBTI: String {
//    case ACEG, ACFG, BCEG, BCFG,
    //         ACEH, ACFH, BCEH, BCFH,
    //         ADEG, ADFG, BDEG, BDFG,
    //         ADEH, ADFH, BDEH, BDFH
    case ACEG = "ACEG", ACFH = "ACFH", BDFH = "BDFH"
    
    var definition : String {
        switch self {
        case .ACEG :
            return "새로운 음식 도전하는 것을 좋아함. 어느식당에서나 혼밥 할 수 있는 힘을 가지고 있다. 음식 가지고 장난치는건 못참는 편."
            
        case .ACFH :
            return "게으른 완벽주의자. 메뉴를 정하는데 오랜 시간이 걸린다. 열 번 중 여덟번은 내가 한일에 만족 하지 못함 항상 가는 식당이 정해져있다"
            
        case .BDFH :
            return "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"
        }
    }
    
//    var definition: String {
//        switch self {
//        case .dog:
//            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
//        case .cat:
//            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
//        case .rabbit:
//            return "You love everything that's soft. You are healthy and full of energy."
//        case .turtle:
//            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
//        }
//    }
    
}

let questions: [Question] = [
    // Access
    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
                    type: .accessNeg)]),
//    Question(text: "Sns를 하다가 맛집을 발견했다. 하지만 서울에 있다고 한다.", answers: [
//                Answer(text: "대체할 다른 식당을 근처에서 찾아본다",
//                       type: .accessPos),
//                Answer(text: "라멘먹으러 일본까지 가는 나에겐 거리따위 신경쓰지 않는다. 무조건 간다.",
//                    type: .accessNeg)]),
//    Question(text: "친구들과 탕수육을 먹기로 했다. 다들 아무데나 상관없다고 할 때 나는~", answers: [
//                Answer(text: "당장 배고프니까 여기서 3분 내에 있는 중국집에서 탕수육을 먹는다", type: .accessPos),
//                Answer(text: "이왕 먹는 거 15분 걷더라도 탕수육 맛집에서 먹는다.",
//                    type: .accessNeg)]),
    // Amount
    Question(text: "서브웨이를 먹을 때는", answers: [
                Answer(text: "무적권 60cm 먹어줘야제!", type: .ammountPos),
                Answer(text: "30cm로도 충분해.",
                    type: .ammountNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)]),
    // Mood
    Question(text: "연인과에 1주년, 점심을 먹으려고 한다.", answers: [
                Answer(text: "맛은 모르겠지만 인테리어가 예쁘다고 소문난  식당에 간다",
                    type: .moodPos),
                Answer(text: "식당은 음식을 먹기 위해 가는 곳이다. 음식이 맛있다면 분위기는 상관 없다.",
                    type: .moodNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)]),
    // price
    Question(text: "아직 월급날은 3일 남았고 내 잔고는 바닥을 치고 있다.", answers: [
                Answer(text: "잘 먹는게 최고니 다른 곳에서 아끼고 먹는 것 만큼은 아끼지 않는다.", type: .pricePos),
                Answer(text: "식비부터 최대한 아껴야하므로 남은 3일간은 대충 끼니를 해결한다.",
                    type: .priceNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)]),
//    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
//                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
//                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
//                    type: .accessNeg)])
// END
]
