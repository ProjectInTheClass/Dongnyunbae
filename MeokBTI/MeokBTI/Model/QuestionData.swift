//
//  QuestionData.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: MeokType
}



let questions: [Question] = [
    // Access
    Question(text: "두근두근! 첫 데이트 날! 데이트 식당장소를 정할 때", answers: [
                Answer(text: "정해둔 데이트 코스의 근처 식당을 찾아본다.", type: .accessPos),
                Answer(text: "식당을 먼저 정하고 데이트 코스를 계획한다.",
                    type: .accessNeg)]),
    
//    Question(text: "군복무 시절 강원도에서 먹었던 막국수가 먹고 싶다.", answers: [
//                Answer(text: "강원도 까지 가서 막국수를 야무지게 즐긴다.", type: .accessPos), Answer(text: "집 근처 아무 막국수 집에 간다.", type: .accessNeg)]),
    
    Question(text: "SNS 보던 중 가고픈 맛집 발견! 그러나 거리가 2시간일 때", answers: [
                Answer(text: "대체할 수 있는 주변식당을 찾는다.",
                       type: .accessPos),
                Answer(text: "신경쓰지 않고 무조건 간다.",
                    type: .accessNeg)]),
    
    Question(text: "친구들과 탕수육을 먹으려고 할 때", answers: [
                Answer(text: "바로 먹고 싶으니 여기서 3분 내의 중국집으로 간다.", type: .accessPos),
                Answer(text: "15분 걸어서 탕수육 맛집으로 간다.",
                    type: .accessNeg)]),
    
//    Question(text: "국밥을 먹으려고 하는데 근처에 두 곳이 있다.", answers: [
//                Answer(text: "바로 가까이에 있는 국밥집으로 간다.", type: .accessPos),
//                Answer(text: "시장 깊숙한 곳이지만 맛집으로 유명한 국밥집으로 간다.",
//                    type: .accessNeg)]),
//
//    Question(text: "오랜만에 만난 친구들과 함께 곱창집에서 식사하고자 한다.", answers: [
//                Answer(text: "내가 맛있게 먹어봤던 곱창집을 추천한다.", type: .accessPos),
//                Answer(text: "맛집검색하고 친구들과 투표로 결정하고 간다.",
//                    type: .accessNeg)]),
    
    // Amount
    Question(text: "서브웨이를 먹을 때", answers: [
                Answer(text: "무적권 60cm!", type: .ammountPos),
                Answer(text: "30cm가 충분하다.",
                    type: .ammountNeg)]),
    Question(text: "친구들과 치킨을 시켜 먹을 때", answers: [
                Answer(text: "4명 모두 배부르게 먹도록 4마리를 시킨다.", type: .ammountPos), Answer(text: "적당하게 2마리를 시킨다.", type: .ammountNeg)]),
    
    Question(text: "내일은 중요한 시험날! 어느덧 점심시간이 될 때", answers: [
                Answer(text: "다시 힘을 내기 위해 든든하게 식사하고 온다.", type: .ammountPos), Answer(text: "시험공부를 위해 간단하게 먹는다.", type: .ammountNeg)]),
    
    Question(text: "친구들과 비빔면을 끓여먹을 때", answers: [
                Answer(text: "4명이서 넉넉하게 4개를 끓인다.", type: .ammountPos), Answer(text: "남기지 않도록 3개를 끓인다.", type: .ammountNeg)]),
    
    Question(text: "삼겹살 무한 리필집에서 배가 불러올 때", answers: [
                Answer(text: "언제 또 올지 모르니 더 먹는다.", type: .ammountPos), Answer(text: "배부르니 만족한다. 끝.", type: .ammountNeg)]),
    
//    Question(text: "오늘은 치팅데이! 마음껏 먹어보자.", answers: [
//                Answer(text: "세상엔 맛있는 게 너무 많다. 이것저것 다 시켜 먹는다.", type: .ammountPos), Answer(text: "치팅데이라도 적당히 먹는다.", type: .ammountNeg)]),
    
    
    

    // Mood
    Question(text: "연인과의 1주년, 점심을 먹으려고 할 때", answers: [
                Answer(text: "사진에 예뻐보이는 식당으로 간다.",
                    type: .moodPos),
                Answer(text: "내가 가봤던 맛있는 식당으로 간다.",
                    type: .moodNeg)]),
    
//    Question(text: "친구에게 소개팅을 받기로 했는데, 장소가 부득이하게 식당으로 정해야한다.", answers: [
//                Answer(text: "인스타에서 분위기 좋은 식당을 찾아서 정한다.", type: .moodPos), Answer(text: "네이버에서 주변에 시간대에 맞는 적당한 식당을 찾는다.", type: .moodNeg)]),
    
    Question(text: "라면을 먹으려고 하는데", answers: [
                Answer(text: "라멘집에서 파는 라면을 선호한다.", type: .moodPos),
                Answer(text: "내가 직접 끓여먹는 라면을 선호한다.", type: .moodNeg)]),
    
    Question(text: "가족들과 한식 식사를 하려고 할 때", answers: [
                Answer(text: "외관부터 멋있고 고풍스러운 한식당에서 먹는다.", type: .moodPos),
                Answer(text: "할머님들의 자연스런 손맛이 담긴 한식당에서 먹는다.", type: .moodNeg)]),

// 질문 두개 더 추가해야함
    Question(text: "sns에서 보게 된 멋진 분위기의 식당을 보고", answers: [
                 Answer(text: "그래 식당은 분위기도 좋아야지.", type: .moodPos),
                 Answer(text: "분위기가 좋다고 맛있을까?", type: .moodNeg)]),

    Question(text: "친구와 맥주한잔 하려고 할 때", answers: [
                 Answer(text: "괜찮은 호프집에서", type: .moodPos),
                 Answer(text: "편의점 앞 테이블에서 ", type: .moodNeg)]),
    
    // price
    // 신경쓴다 pos, 신경 안쓴다 neg
    Question(text: "내 잔고는 바닥을 치는데 월급날이 아직일 때", answers: [
                Answer(text: "식비부터 절약한다.", type: .pricePos),
                Answer(text: "그래도 먹는 것에는 아끼지 않는다.",
                    type: .priceNeg)]),
    
    Question(text: "드디어 월급날! 특별하게 초밥을 먹으려고 할 때", answers: [
                Answer(text: "아무렴 좋다. 초밥 파는 아무 곳이나 간다.", type: .pricePos),
                Answer(text: "고오급 초밥집 오마카세 식당으로 간다.", type: .priceNeg)]),
    
    Question(text: "친구 생일! 밥 한 끼 사주려고 할 때", answers: [
                Answer(text: "친구가 자주가는 식당에서 한 턱 쏜다.", type: .pricePos),
                Answer(text: "가격이 좀 들더라도 친구가 못 먹어본 음식을 대접한다.", type: .priceNeg)]),
    
    Question(text: "브리또(또는 샌드위치)를 먹을 때", answers: [
                Answer(text: "토핑은 사치일 뿐, 그냥 기본으로 먹는다.", type: .pricePos),
                Answer(text: "비싸더라도 먹고 싶은 토핑 이것저것 다 넣는다.", type: .priceNeg)]),
    
    Question(text: "짬뽕을 먹고 싶을 때", answers: [
                Answer(text: "동네중국집에서 편하고 저렴하게 먹는다.", type: .pricePos),
                Answer(text: "이비가짬뽕처럼 유명한 곳에서 먹는다.", type: .priceNeg)])
// END
]
