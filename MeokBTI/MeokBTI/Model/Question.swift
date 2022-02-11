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

let questions: [Question] = [
    // MARK: Access ( Easy, Hard )
    Question(text: "SNS 보던 중 가고픈 맛집 발견! 그러나 거리가 2시간일 때",
             answers: [
                Answer(text: "대체할 수 있는 주변식당을 찾는다.", type: .E, tag: 1),
                Answer(text: "신경쓰지 않고 무조건 간다.", type: .H, tag: 1)]
            ),
    
    Question(text: "햇볕이 내리쬐는 점심시간, 친구들과 탕수육을 먹으려고 할 때",
             answers: [
                Answer(text: "바로 먹고 싶으니 가장 가까운 중국집으로 간다.", type: .E, tag: 2),
                Answer(text: "15분 걸어서 소문난 탕수육 맛집으로 간다.", type: .H, tag: 2)]
            ),
    
    Question(text: "다른 지역에 사는 사람들에게 우리지역맛집을 소개시켜준다면? ",
             answers: [
                Answer(text: "번화가에 있는 누구나 들으면 알만한 핫한 맛집", type: .E, tag: 3),
                Answer(text: "외곽에 있지만 나만 아는 소중한 맛집", type: .H, tag: 3)]
            ),
    
    // MARK: Amount ( Much, Little )
    Question(text: "친구들과 고기를 먹으러 갈 때",
             answers: [
                Answer(text: "우리를 얕보지말라며 무한리필집을 간다.", type: .M, tag: 1),
                Answer(text: "적당하게 먹으면 되니까 일반고기집을 간다.", type: .L, tag: 1)]
            ),
    
    Question(text: "내일은 중요한 시험날! 어느덧 점심시간이 될 때",
             answers: [
                Answer(text: "든든한 식사가 집중력을 만든다!", type: .M, tag: 2),
                Answer(text: "시험공부가 우선이니 간단하게 먹는다.", type: .L, tag: 2)]
            ),
    
    Question(text: "외식상품권(가격동일)을 받았을 때 가고싶은 곳은?",
             answers: [
                Answer(text: "산해진미를 쓸어모아놓은 뷔페", type: .M, tag: 3),
                Answer(text: "쉐프의 진가를 보여주는 코스요리", type: .L, tag: 3)]
            ),
    
    // MARK: Mood ( Good, Bad )
    Question(text: "친구가 가자고 꼬신다면 넘어갈 식당은?",
             answers: [
                Answer(text: "통유리창에 양초가 켜져있는 파스타집", type: .G, tag: 1),
                Answer(text: "50년 전통의 돼지국밥집", type: .B, tag: 1)]
            ),
    
    Question(text: "기분 좋은날 한잔하려고 간 곳은?",
             answers: [
                Answer(text: "화려한 조명아래 벚꽃나무가 흩날리는 이자카야", type: .G, tag: 2),
                Answer(text: "포장마차들과 푸드트럭들이 늘어선 먹자골목", type: .B, tag: 2)]
            ),
    
    Question(text: "TV에 나온다면 가고싶은 곳은?",
             answers: [
                Answer(text: "현대적으로 재해석한 인테리어의 한식당", type: .G, tag: 3),
                Answer(text: "할머니의 손맛을 자랑하는 시장통 한식당", type: .B, tag: 3)]
            ),

    
    // MARK: Price ( Inexpensive, Costly )
    Question(text: "내 잔고는 바닥을 치는데 월급날이 아직일 때",
             answers: [
                Answer(text: "조금만 참으면 되니 식비부터 절약한다.", type: .I, tag: 1),
                Answer(text: "먹고 힘내야 월급날까지 버틸 수 있으므로 배달부터 시킨다.", type: .C, tag: 1)]
            ),
    
    Question(text: "신용카드는 한도초과상태, 내역을 확인하니 가장 많이 쓴 곳이?",
             answers: [
                Answer(text: "옷이나 여러 구독형 결제들", type: .I, tag: 2),
                Answer(text: "배달앱 또는 여러 식당들", type: .C, tag: 2)]
            ),
    
    Question(text: "축제중에 저 건너편 푸드트럭에서 날 지긋이 쳐다본다.",
             answers: [
                Answer(text: "재빠르게 가격표를 본 뒤, 저 돈이면..하며 돌아선다.", type: .I, tag: 3),
                Answer(text: "내 왼손에는 닭꼬지, 오른손엔 음료가 이미 있다.", type: .C, tag: 3)]
            )
]



// MARK: deadQuestions
/*
let deadQuestions: [Question] = [
    // Access ( Easy, Hard )
    Question(text: "두근두근! 첫 데이트 날! 데이트 식당장소를 정할 때",
             answers: [
                Answer(text: "정해둔 데이트 코스의 근처 식당을 찾아본다.", type: .E),
                Answer(text: "식당을 먼저 정하고 데이트 코스를 계획한다.", type: .H)]
            ),
    
    Question(text: "국밥을 먹으려고 하는데 근처에 두 곳이 있다.",
             answers: [
                Answer(text: "눈앞에 보이는 국밥집으로 간다.", type: .E),
                Answer(text: "시장 깊숙한 곳이지만 맛집으로 유명한 국밥집으로 간다.", type: .H)]
            ),
    
    Question(text: "오랜만에 만난 친구들과 함께 저녁을 먹기로 했다.",
             answers: [
                Answer(text: "주변에 즐길거리가 많은 곳에서 먹는다", type: .E),
                Answer(text: "밥만 먹고 헤어질 것이므로 아무데나 간다.", type: .H)]
            ),
    
    // Amount ( Much, Little )
    Question(text: "서브웨이를 먹을 때",
             answers: [
                Answer(text: "무적권 60cm!", type: .M),
                Answer(text: "30cm가 충분하다.", type: .L)]
            ),
    Question(text: "친구들과 치킨을 시켜 먹을 때",
             answers: [
                Answer(text: "4명 모두 배부르게 먹도록 4마리를 시킨다.", type: .M),
                Answer(text: "적당하게 2마리를 시킨다.", type: .L)]
            ),
    
    Question(text: "내일은 중요한 시험날! 어느덧 점심시간이 될 때",
             answers: [
                Answer(text: "다시 힘을 내기 위해 든든하게 식사하고 온다.", type: .M),
                Answer(text: "시험공부를 위해 간단하게 먹는다.", type: .L)]
            ),
    
    Question(text: "친구들과 비빔면을 끓여먹을 때",
             answers: [
                Answer(text: "4명이서 넉넉하게 4개를 끓인다.", type: .M),
                Answer(text: "남기지 않도록 3개를 끓인다.", type: .L)]
            ),
    
    Question(text: "삼겹살 무한 리필집에서 배가 불러올 때", answers: [
                Answer(text: "언제 또 올지 모르니 더 먹는다.", type: .M),
                Answer(text: "배부르니 만족한다. 끝.", type: .L)]
            ),
    
    Question(text: "오늘은 치팅데이! 마음껏 먹어보자.", answers: [
                Answer(text: "세상엔 맛있는 게 너무 많다. 이것저것 다 시켜 먹는다.", type: .M),
                Answer(text: "치팅데이라도 적당히 먹는다.", type: .L)]),
    
    // Mood ( Good, Bad )
    Question(text: "나랑 비슷한 느낌의 식당은?",
             answers: [
                Answer(text: "통유리창에 양초가 켜져있는 파스타집", type: .G),
                Answer(text: "50년 전통의 돼지국밥집", type: .B)]
            ),
    
    Question(text: "기분 좋은날 한잔하려고 간 곳은?",
             answers: [
                Answer(text: "화려한 조명아래 벚꽃나무가 흩날리는 이자카야", type: .G),
                Answer(text: "포장마차", type: .B)]
            ),
    
//    Question(text: "친구에게 소개팅을 받기로 했는데, 장소가 부득이하게 식당으로 정해야한다.", answers: [
//                Answer(text: "인스타에서 분위기 좋은 식당을 찾아서 정한다.", type: .moodPos), Answer(text: "네이버에서 주변에 시간대에 맞는 적당한 식당을 찾는다.", type: .moodNeg)]),
    
    Question(text: "라면을 먹으려고 하는데",
             answers: [
                Answer(text: "라멘집에서 파는 라면을 선호한다.", type: .G),
                Answer(text: "내가 직접 끓여먹는 라면을 선호한다.", type: .B)]
            ),
    
    Question(text: "가족들과 한식 식사를 하려고 할 때",
             answers: [
                Answer(text: "외관부터 멋있고 고풍스러운 한식당에서 먹는다.", type: .G),
                Answer(text: "할머님들의 자연스런 손맛이 담긴 한식당에서 먹는다.", type: .B)]
            ),

    Question(text: "sns에서 보게 된 멋진 분위기의 식당을 보고",
             answers: [
                 Answer(text: "그래 식당은 분위기도 좋아야지.", type: .G),
                 Answer(text: "분위기가 좋다고 맛있을까?", type: .B)]
            ),

    Question(text: "친구와 맥주한잔 하려고 할 때",
             answers: [
                 Answer(text: " ", type: .G),
                 Answer(text: " ", type: .B)]
            ),

    // Price ( Inexpensive, Costly )
    Question(text: "내 잔고는 바닥을 치는데 월급날이 아직일 때",
             answers: [
                Answer(text: "조금만 참으면 되니 식비부터 절약한다.", type: .I),
                Answer(text: "먹고 힘내야 월급날까지 버틸 수 있으므로 배달부터 시킨다.", type: .C)]
            ),
    
    Question(text: "친구가 초밥을 먹으러가자고 한다.",
             answers: [
                Answer(text: "아무렴 좋다. 초밥 파는 아무 곳이나 간다.", type: .I),
                Answer(text: "친구와 추억으로 남길겸 오마카세로 즐겨본다.", type: .C)]
            ),
    
    Question(text: "친구 생일날 밥 한 끼 사주려고 할 때",
             answers: [
                Answer(text: "친구가 자주가는 식당에서 한 턱 쏜다.", type: .I),
                Answer(text: "가격이 좀 들더라도 친구가 못 먹어본 음식을 대접한다.", type: .C)]
            ),
    
    Question(text: "피자(또는 서브웨이)를 먹을 때",
             answers: [
                Answer(text: "토핑은 사치일 뿐, 그냥 기본으로 먹는다.", type: .I),
                Answer(text: "토핑도 국룰이 있다. 이것저것 토핑을 추가한다.", type: .C)]
            ),
    
    Question(text: "축제에 참가하고 있는데 배가 고프다.",
             answers: [
                Answer(text: "축제를 마치고 다른 곳가서 먹는다.", type: .I),
                Answer(text: "가격이 조금 비싸긴해도 현장에서 배를 채운다.", type: .C)]
            )
]
*/
