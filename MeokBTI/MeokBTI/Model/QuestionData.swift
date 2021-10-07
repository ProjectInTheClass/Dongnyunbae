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
                Answer(text: "가고 싶은 식당을 정하고 다음 장소를 정한다.",
                    type: .accessNeg)]),
    
//    Question(text: "군복무 시절 강원도에서 먹었던 막국수가 먹고 싶다.", answers: [
//                Answer(text: "강원도 까지 가서 막국수를 야무지게 즐긴다.", type: .accessPos), Answer(text: "집 근처 아무 막국수 집에 간다.", type: .accessNeg)]),
    
    Question(text: "Sns를 하다가 맛집을 발견했다. 하지만 서울에 있다고 한다.", answers: [
                Answer(text: "가기 편한 비슷한 식당을 찾는다.",
                       type: .accessPos),
                Answer(text: "내가 가고싶은 곳이면 거리는 중요하지 않다.",
                    type: .accessNeg)]),
    
    Question(text: "친구들과 탕수육을 먹기로 했다. 다들 아무데나 상관없다고 할 때 나는~", answers: [
                Answer(text: "가장 가까운 중국집에서 탕수육을 먹는다", type: .accessPos),
                Answer(text: "이왕 먹는 거 15분 걷더라도 탕수육 맛집에서 먹는다.",
                    type: .accessNeg)]),
    
    
    
    // Amount
    Question(text: "서브웨이를 먹을 때는", answers: [
                Answer(text: "무적권 60cm 먹어줘야제!", type: .ammountPos),
                Answer(text: "30cm로도 충분해.",
                    type: .ammountNeg)]),
    Question(text: "친구들과 치킨을 시킨다.", answers: [
                Answer(text: "넷이서 두마리면 될 정도로 양이 많은 치킨을 시킨다.", type: .ammountPos), Answer(text: "1인 1닭 할 수 있는 양의 치킨집에서 4마리를 시킨다.", type: .ammountNeg)]),
    
    Question(text: "이틀 뒤 중요한 시험을 치르게 된다. 혼자 도서관을 가서 공부하다 보니 점심시간이 되었다.", answers: [
                Answer(text: "많이 먹으면 졸리니까 적당히 먹는다.", type: .ammountPos), Answer(text: "든든하게 먹어야 다시 힘내서 공부를 할 수 있다.", type: .ammountNeg)]),
    
    Question(text: "친구들이 우리집에 놀러왔다. 비빔면을 해먹으려는데 3개는 애매하고 4개는 많다.", answers: [
                Answer(text: "부족한 것 보단 차라리 남기는 게 나으니 4개를 끓인다.", type: .ammountPos), Answer(text: "음식을 남길 순 없으니 적당히 먹을 수 있게 3개만 끓인다.", type: .ammountNeg)]),
    
    Question(text: "나는 현재 군인이다. 삽겹살이 너무 먹고 싶다. 마침 휴가를 나와서 삽겹살 무한 리필집에 오게 되었다. 너무 많이 먹어서 현재 배가 부른 상태다.", answers: [
                Answer(text: "언제 다시 먹을지 모르니 배 불러도 더 먹는다.", type: .ammountPos), Answer(text: "모자라게 먹는게 더 맛있다. 적당히 먹고 만다.", type: .ammountNeg)]),
    
//    Question(text: "오늘은 치팅데이! 마음껏 먹어보자.", answers: [
//                Answer(text: "세상엔 맛있는 게 너무 많다. 이것저것 다 시켜 먹는다.", type: .ammountPos), Answer(text: "치팅데이라도 적당히 먹는다.", type: .ammountNeg)]),
    
    
    

    // Mood
    Question(text: "연인과 1주년, 점심을 먹으려고 한다.", answers: [
                Answer(text: "맛은 모르겠지만 인테리어가 예쁘다고 소문난 식당에 간다.",
                    type: .moodPos),
                Answer(text: "식당은 음식을 먹기 위해 가는 곳이다. 음식이 맛있다면 분위기는 상관 없다.",
                    type: .moodNeg)]),
    
//    Question(text: "친구에게 소개팅을 받기로 했는데, 장소가 부득이하게 식당으로 정해야한다.", answers: [
//                Answer(text: "인스타에서 분위기 좋은 식당을 찾아서 정한다.", type: .moodPos), Answer(text: "네이버에서 주변에 시간대에 맞는 적당한 식당을 찾는다.", type: .moodNeg)]),
    
    Question(text: "어디서 더 먹고 싶은가?", answers: [
                Answer(text: "전문 라면집에서 먹는 라면.", type: .moodPos),
                Answer(text: "김밥천국에서 먹는 라면.", type: .moodNeg)]),
    
    Question(text: "모처럼 교수님께서 한턱 쏘신다고 하는데 한식을 드시고 싶다고 하신다. 이럴 때", answers: [
                Answer(text: "누가봐도 고풍스러운 한옥집을 추천한다.", type: .moodPos),
                Answer(text: "김치찌개도 한식아니야? 학교앞 김치찌개 가게를 추천한다.", type: .moodNeg)]),

// 질문 두개 더 추가해야함
    Question(text: "sns에서 보게 된 멋진 분위기의 식당을 보고", answers: [
                 Answer(text: "그래 식당은 분위기도 좋아야지.", type: .moodPos),
                 Answer(text: "분위기가 좋다고 맛있을까?", type: .moodNeg)]),

    Question(text: "친구와 맥주한잔 하려고 할 때", answers: [
                 Answer(text: "괜찮은 호프집에서", type: .moodPos),
                 Answer(text: "편의점 앞 테이블에서 ", type: .moodNeg)]),
    
    // price
    // 비싼게 pos 싼게 neg
    Question(text: "아직 월급날은 3일 남았고 내 잔고는 바닥을 치고 있다.", answers: [
                Answer(text: "나는 먹는게 무엇보다 중요하니까 다른 생활비를 아껴서 식비로 쓴다.", type: .pricePos),
                Answer(text: "아끼는건 식비가 가장 쉽다. 식비를 아끼자.",
                    type: .priceNeg)]),
    Question(text: "드디어 월급날, 돈이 들어온 기념으로 무언가 특별한 음식을 찾다보니 초밥이 끌린다.", answers: [
                Answer(text: "고오급 초밥집 오마카세 식당으로 간다.", type: .pricePos),
                Answer(text: "아무렴 좋다. 초밥 파는 아무 곳이나 간다.", type: .priceNeg)]),
    
    Question(text: "친구 생일날 밥 한끼를 사주려고 한다.", answers: [
                Answer(text: "가격이 좀 들더라도 친구가 못 먹어본 음식을 대접한다.", type: .pricePos),
                Answer(text: "친구가 자주가는 식당에서 한 턱 쏜다.", type: .priceNeg)]),
    
    Question(text: "브리또(또는 그 무언가) 를 먹을거다.", answers: [
                Answer(text: "비싸더라도 먹고 싶은 토핑 이것저것 다 넣는다.", type: .pricePos),
                Answer(text: "먹고 싶은 토핑 하나만 정해서 넣는다.", type: .priceNeg)]),
    
    Question(text: "짬뽕을 먹고 싶을 때", answers: [
                Answer(text: "비싸더라도 이비가짬뽕 같은 이름있는 곳에서 먹어야지.", type: .pricePos),
                Answer(text: "동네 중국집에서 편하고 저렴하게 먹어야지.", type: .priceNeg)])
// END
]
