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
    Question(text: "두근두근! 내일은 첫 데이트 날이다. 데이트 할 때 식당을 정하려고 한다.", answers: [
                Answer(text: "다음 장소까지의 거리를 계산하여 최대한 가까운 식당으로 정한다.", type: .accessPos),
                Answer(text: "일단 가고 싶은 식당을 정하고 다음 장소를 정한다.",
                    type: .accessNeg)]),
    
//    Question(text: "군복무 시절 강원도에서 먹었던 막국수가 먹고 싶다.", answers: [
//                Answer(text: "강원도 까지 가서 막국수를 야무지게 즐긴다.", type: .accessPos), Answer(text: "집 근처 아무 막국수 집에 간다.", type: .accessNeg)]),
    
    Question(text: "Sns를 하다가 맛집을 발견했다. 하지만 서울에 있다고 한다.", answers: [
                Answer(text: "대체할 다른 식당을 근처에서 찾아본다",
                       type: .accessPos),
                Answer(text: "라멘먹으러 일본까지 가는 나에겐 거리따위 신경쓰지 않는다. 무조건 간다.",
                    type: .accessNeg)]),
    
    Question(text: "친구들과 탕수육을 먹기로 했다. 다들 아무데나 상관없다고 할 때 나는~", answers: [
                Answer(text: "당장 배고프니까 여기서 3분 내에 있는 중국집에서 탕수육을 먹는다", type: .accessPos),
                Answer(text: "이왕 먹는 거 15분 걷더라도 탕수육 맛집에서 먹는다.",
                    type: .accessNeg)]),
    
    
    // Amount
    Question(text: "서브웨이를 먹을 때는", answers: [
                Answer(text: "무적권 60cm 먹어줘야제!", type: .ammountPos),
                Answer(text: "30cm로도 충분해.",
                    type: .ammountNeg)]),
    Question(text: "친구들과 치킨을 시킨다.", answers: [
                Answer(text: "넷이서 두마리면 될 정도로 양이 많은 치킨을 시킨다.", type: .ammountPos), Answer(text: "치킨은 자고로 1인 1닭이다. 나눠먹기엔 적어도 혼자먹기는 적당한 치킨을 4마리 시킨다.", type: .ammountNeg)]),
    
    Question(text: "이틀 뒤 중요한 시험을 치르게 된다. 혼자 도서관을 가서 공부하다 보니 점심시간이 되었다.", answers: [
                Answer(text: "시험이 얼마 남지 않았으니 최대한 간단하게 먹고 다시 공부하러 간다.", type: .ammountPos), Answer(text: "든든하게 먹어야 다시 힘내서 공부를 할 수 있다.", type: .ammountNeg)]),
    
    Question(text: "친구들이 우리집에 놀러왔다. 비빔면을 끓여먹으려는데 3개를 끓이자니 애매하고 4개를 끓이자니 많다.", answers: [
                Answer(text: "음식을 남길 순 없으니 적당히 먹을 수 있게 3개만 끓인다.", type: .ammountPos), Answer(text: "부족한 것 보단 차라리 남기는 게 나으니 4개를 끓인다.", type: .ammountNeg)]),
    
    Question(text: "나는 현재 군인이다. 삽겹살이 너무 먹고 싶다. 마침 휴가를 나와서 삽겹살 무한 리필집에 오게 되었다. 너무 많이 먹어서 현재 배가 부른 상태다.", answers: [
                Answer(text: "언제 다시 먹을지 모르니 배 불러도 더 먹는다", type: .ammountPos), Answer(text: "배부르니 만족. 시마이 친다.", type: .ammountNeg)]),
    
//    Question(text: "오늘은 치팅데이! 마음껏 먹어보자.", answers: [
//                Answer(text: "세상엔 맛있는 게 너무 많다. 이것저것 다 시켜 먹는다.", type: .ammountPos), Answer(text: "어..어? 내 생각보다 많이 들어가지 않아 아쉬워한다.", type: .ammountNeg)]),
    
    
    

    // Mood
    Question(text: "연인과에 1주년, 점심을 먹으려고 한다.", answers: [
                Answer(text: "맛은 모르겠지만 인테리어가 예쁘다고 소문난  식당에 간다",
                    type: .moodPos),
                Answer(text: "식당은 음식을 먹기 위해 가는 곳이다. 음식이 맛있다면 분위기는 상관 없다.",
                    type: .moodNeg)]),
    
//    Question(text: "친구에게 소개팅을 받기로 했는데, 장소가 부득이하게 식당으로 정해야한다.", answers: [
//                Answer(text: "인스타에서 분위기 좋은 식당을 찾아서 정한다.", type: .moodPos), Answer(text: "네이버에서 주변에 시간대에 맞는 적당한 식당을 찾는다.", type: .moodNeg)]),
    
    Question(text: "어디서 더 먹고 싶은가?", answers: [
                Answer(text: "전문 라면집에서 먹는 라면.", type: .moodPos),
                Answer(text: "야간 행군 끝나고 먹는 라면.", type: .moodNeg)]),
    
    Question(text: "연구실 프로젝트 도중 밥 시간이 되었다. 모처럼 교수님께서 한턱 쏘신다고 하는데 한식을 드시고 싶다고 하신다. 이럴 때,", answers: [
                Answer(text: "보기 좋아야 먹기도 좋다고 비싸더라도 고풍스러운 한식당을 소개시켜드린다.", type: .moodPos),
                Answer(text: "멋없더라도 할머님들의 손맛이 알차고 자연스럽게 담긴 한식당을 소개시켜드린다.", type: .moodNeg)]),
    
    // price
    Question(text: "아직 월급날은 3일 남았고 내 잔고는 바닥을 치고 있다.", answers: [
                Answer(text: "식비부터 최대한 아껴야하므로 남은 3일간은 대충 끼니를 해결한다.", type: .pricePos),
                Answer(text: "잘 먹는게 최고니 다른 곳에서 아끼고 먹는 것 만큼은 아끼지 않는다.",
                    type: .priceNeg)]),
    
    Question(text: "드디어 월급날, 돈이 들어온 기념으로 무언가 특별한 음식을 찾다보니 초밥이 끌린다.", answers: [
                Answer(text: "이왕 먹는거 하나하나 정성스럽게 만들어주는 곳을 가보자. 오마카세 식당에 간다.", type: .pricePos),
                Answer(text: "초밥이 거기서 거기지. 가격이 그렇게 비싸지 않은 동네 초밥집에 간다.", type: .priceNeg)]),
    
    Question(text: "친구 생일날 밥 한끼를 사주려고 한다.", answers: [
                Answer(text: "친구가 자주가는 식당에서 한 턱 쏜다.", type: .pricePos),
                Answer(text: "가격이 좀 들더라도 친구가 못 먹어본 음식을 대접한다.", type: .priceNeg)]),
    
    Question(text: "브리또(또는 그 무언가) 를 먹을거다.", answers: [
                Answer(text: "먹고 싶은 토핑 하나만 정해서 넣는다.", type: .pricePos),
                Answer(text: "비싸더라도 먹고 싶은 토핑 이것저것 다 넣는다.", type: .priceNeg)]),
    
    Question(text: "짬뽕을 먹고 싶을 때", answers: [
                Answer(text: "동네 중국집에서 편하고 저렴하게 먹어야지.", type: .pricePos),
                Answer(text: "비싸더라도 이비가짬뽕 같은 이름있는 곳에서 먹어야지.", type: .priceNeg)])
// END
]
