//
//  Answer.swift
//  MeokBTI
//
//  Created by 추만석 on 2022/02/10.
//

import Foundation

struct Answer {
    var text: String
    var type: MeokType
    var tag: Int
    
    var oneLineDescriptions: [String] {
        let tag = self.tag
        
        switch self.type {
        case .E:
            /*
             Answer(text: "대체할 수 있는 주변식당을 찾는다.", type: .E, tag: 1),
             Answer(text: "바로 먹고 싶으니 가장 가까운 중국집으로 간다.", type: .E, tag: 2)
             Answer(text: "번화가에 있는 누구나 들으면 알만한 핫한 맛집", type: .E, tag: 3)
             */
            if tag == 1 {
                return ["밥 먹으러 멀리 나가는 걸 그다지 선호하지 않아요."]
            } else if tag == 2 {
                return ["음식에 있어서는 오래 기다리는 걸 참을 수 없어요."]
            } else {
                return ["식당에 사람이 없으면 맛없는 식당으로 의심해요."]
            }
            
        case .H:
            /*
             Answer(text: "신경쓰지 않고 무조건 간다.", type: .H, tag: 1)]
             Answer(text: "15분 걸어서 소문난 탕수육 맛집으로 간다.", type: .H, tag: 2)
             Answer(text: "외곽에 있지만 나만 아는 소중한 맛집", type: .H, tag: 3)
             */
            if tag == 1 {
                return ["SNS에서 추천해주는 식당들은 대부분 가본 곳이에요."]
            } else if tag == 2 {
                return ["사람들이 많이 가는데에는 이유가 있다고 생각해요."]
            } else {
                return ["자신이 사는 지역에서 자신이 모르는 식당은 잘 없어요."]
            }
        case .M:
            /*
             "외식상품권(가격동일)을 받았을 때 가고싶은 곳은?"
             Answer(text: "우리를 얕보지말라며 무한리필집을 간다.", type: .M, tag: 1)
             Answer(text: "든든한 식사가 집중력을 만든다!", type: .M, tag: 2)
             Answer(text: "산해진미를 쓸어모아놓은 뷔페", type: .M, tag: 3)
             */
            if tag == 1 {
                return ["호락호락하게 배부르지 않아요."]
            } else if tag == 2 {
                return ["배가 고프면 일이 손에 잡히질 않아요."]
            } else {
                return ["다양한 음식을 맛보고 싶어해서 음식을 여러 종류로 시키는 편이에요."]
            }
        case .L:
            /*
             Answer(text: "적당하게 먹으면 되니까 일반고기집을 간다.", type: .L, tag: 1)
             Answer(text: "시험공부가 우선이니 간단하게 먹는다.", type: .L, tag: 2)
             Answer(text: "쉐프의 진가를 보여주는 코스요리", type: .L, tag: 3)
             */
            if tag == 1 {
                return ["뭐든 적당히! 평소 먹는 것도 적당히 먹는 것을 선호해요."]
            } else if tag == 2 {
                return ["밥먹는 시간을 아깝다고 생각해 줄여보려고 노력한적이 있어요."]
            } else {
                return ["보류","식사하다보면 얼마 못 가 배불러해요", "음식의 양보다는 요리가 주는 경험을 더 우선시해요."]
            }
        case .G:
            /*
             "TV에 나온다면 가고싶은 곳은?"
             Answer(text: "통유리창에 양초가 켜져있는 파스타집", type: .G, tag: 1)
             Answer(text: "화려한 조명아래 벚꽃나무가 흩날리는 이자카야", type: .G, tag: 2)
             Answer(text: "현대적으로 재해석한 인테리어의 한식당", type: .G, tag: 3)
             */
            if tag == 1 {
                return ["양식당에서 풍기는 분위기를 좋아하는 편이에요."]
            } else if tag == 2 {
                return ["음식맛도 물론 중요하지만 식당에서 풍기는 분위기도 중요시하는 편이에요"]
            } else {
                return ["식당에도 테마가 있는 인테리어가 있으면 좋아해요."]
            }
        case .B:
            /*
             Answer(text: "50년 전통의 돼지국밥집", type: .B, tag: 1)
             Answer(text: "포장마차들과 푸드트럭들이 늘어선 먹자골목", type: .B, tag: 2)
             Answer(text: "할머니의 손맛을 자랑하는 시장통 한식당", type: .B, tag: 3)
             */
            if tag == 1 {
                return ["다른 건 다 참아도 맛없는 음식을 파는 식당은 못 참아요."]
            } else if tag == 2 {
                return ["편안한 곳에서 밥먹는 것을 좋아해요."]
            } else {
                return ["식당 한곳을 자주가서 사장님과 친해진 적이 있어요."]
            }
        case .I:
            /*
             "축제중에 저 건너편 푸드트럭에서 날 지긋이 쳐다본다."
             Answer(text: "조금만 참으면 되니 식비부터 절약한다.", type: .I, tag: 1)
             Answer(text: "옷이나 여러 구독형 결제들", type: .I, tag: 2)
             Answer(text: "재빠르게 가격표를 본 뒤, 저 돈이면..하며 돌아선다.", type: .I, tag: 3)
             */
            if tag == 1 {
                return ["특별한 날이 아니면 식사에 큰 돈을 쓰지 않아요."]
            } else if tag == 2 {
                return ["소비에서 식비는 우선순위에서 밀리는 편이에요."]
            } else {
                return ["비싼 물건을 보면 국밥이 몇그릇인지 계산해보는 편이에요."]
            }
        case .C:
            /*
             Answer(text: "먹고 힘내야 월급날까지 버틸 수 있으므로 배달부터 시킨다.", type: .C, tag: 1)
             Answer(text: "배달앱 또는 여러 식당들", type: .C, tag: 2)
             Answer(text: "내 왼손에는 닭꼬지, 오른손엔 음료가 이미 있다.", type: .C, tag: 3)
             */
            if tag == 1 {
                return ["뭐니뭐니해도 잘 먹는게 최고라고 생각해요."]
            } else if tag == 2 {
                return ["식비지출이 가장 커서 고민일 때가 있어요."]
            } else {
                return ["먹는 것에는 아낌없이 돈을 쓰는 편이에요."]
            }
        }
    }
    
}


/*
 Answer(text: "대체할 수 있는 주변식당을 찾는다.", type: .E, tag: 1),
 Answer(text: "바로 먹고 싶으니 가장 가까운 중국집으로 간다.", type: .E, tag: 2)
 Answer(text: "번화가에 있는 누구나 들으면 알만한 핫한 맛집", type: .E, tag: 3)
 
 Answer(text: "신경쓰지 않고 무조건 간다.", type: .H, tag: 1)]
 Answer(text: "15분 걸어서 소문난 탕수육 맛집으로 간다.", type: .H, tag: 2)
 Answer(text: "외곽에 있지만 나만 아는 소중한 맛집", type: .H, tag: 3)

 
 // MARK: Amount ( Much, Little )
 
 Answer(text: "우리를 얕보지말라며 무한리필집을 간다.", type: .M, tag: 1)
 Answer(text: "든든한 식사가 집중력을 만든다!", type: .M, tag: 2)
 Answer(text: "산해진미를 쓸어모아놓은 뷔페", type: .M, tag: 3)
 
 Answer(text: "적당하게 먹으면 되니까 일반고기집을 간다.", type: .L, tag: 1)
 Answer(text: "시험공부가 우선이니 간단하게 먹는다.", type: .L, tag: 2)
 Answer(text: "쉐프의 진가를 보여주는 코스요리", type: .L, tag: 3)

 
 // MARK: Mood ( Good, Bad )
 Answer(text: "통유리창에 양초가 켜져있는 파스타집", type: .G, tag: 1)
 Answer(text: "화려한 조명아래 벚꽃나무가 흩날리는 이자카야", type: .G, tag: 2)
 Answer(text: "현대적으로 재해석한 인테리어의 한식당", type: .G, tag: 3)
 
 Answer(text: "50년 전통의 돼지국밥집", type: .B, tag: 1)
 Answer(text: "포장마차들과 푸드트럭들이 늘어선 먹자골목", type: .B, tag: 2)
 Answer(text: "할머니의 손맛을 자랑하는 시장통 한식당", type: .B, tag: 3)
 
 // MARK: Price ( Inexpensive, Costly )
 Answer(text: "조금만 참으면 되니 식비부터 절약한다.", type: .I, tag: 1)
 Answer(text: "옷이나 여러 구독형 결제들", type: .I, tag: 2)
 Answer(text: "재빠르게 가격표를 본 뒤, 저 돈이면..하며 돌아선다.", type: .I, tag: 3)
 
 Answer(text: "먹고 힘내야 월급날까지 버틸 수 있으므로 배달부터 시킨다.", type: .C, tag: 1)
 Answer(text: "배달앱 또는 여러 식당들", type: .C, tag: 2)
 Answer(text: "내 왼손에는 닭꼬지, 오른손엔 음료가 이미 있다.", type: .C, tag: 3)
 
 */



/*
 
 switch self.type {
 case .E:
     /*
      "SNS 보던 중 가고픈 맛집 발견! 그러나 거리가 2시간일 때"
      Answer(text: "대체할 수 있는 주변식당을 찾는다.", type: .E, tag: 1),
      Answer(text: "바로 먹고 싶으니 가장 가까운 중국집으로 간다.", type: .E, tag: 2)
      Answer(text: "번화가에 있는 누구나 들으면 알만한 핫한 맛집", type: .E, tag: 3)
      */
     if tag == 1 {
         return ["밥 먹으러 멀리 나가는 걸 그다지 선호하지 않아요.", "나가는 걸 최소화하려하고 나가더라도 가까운 곳을 선호해요."]
     } else if tag == 2 {
         return ["음식에 있어서는 오래 기다리는 걸 참을 수 없어요.", "오래 걸리는 음식보다는 빠르게 나오는 인스턴트 음식을 선호해요."]
     } else {
         return ["사람들이 북적거리는 식당을 좋아해요", "식당에 사람이 없으면 맛없는 식당으로 의심해요."]
     }
     
 case .H:
     /*
      Answer(text: "신경쓰지 않고 무조건 간다.", type: .H, tag: 1)]
      Answer(text: "15분 걸어서 소문난 탕수육 맛집으로 간다.", type: .H, tag: 2)
      Answer(text: "외곽에 있지만 나만 아는 소중한 맛집", type: .H, tag: 3)
      */
     if tag == 1 {
         return ["먹고싶은 음식이 있으면 그날 꼭 먹어야해요.", "SNS에서 추천해주는 식당들은 대부분 가본 곳이에요."]
     } else if tag == 2 {
         return ["유명한 식당은 진짜인지 꼭 확인해봐야해요.", "사람들이 많이 가는데에는 이유가 있다고 생각해요."]
     } else {
         return ["자신이 사는 지역에서 자신이 모르는 식당은 잘 없어요.", "아무리 외곽에 있어도 맛집을 잘 찾아내요."]
     }
 case .M:
     /*
      Answer(text: "우리를 얕보지말라며 무한리필집을 간다.", type: .M, tag: 1)
      Answer(text: "든든한 식사가 집중력을 만든다!", type: .M, tag: 2)
      Answer(text: "산해진미를 쓸어모아놓은 뷔페", type: .M, tag: 3)
      */
     if tag == 1 {
         return ["호락호락하게 배부르지 않아요.", "곱빼기도 부족할 때가 있어요.", "많이 먹는 대회가 있다면 자신있어해요."]
     } else if tag == 2 {
         return ["먹는 걸로 스트레스를 해소해요.", "시들시들하다가도 든든한 밥한끼면 살아나요.", "배가 고프면 일이 손에 잡히질 않아요."]
     } else {
         return ["다양한 음식을 맛보고 싶어해서 음식을 여러 종류로 시키는 편이에요.", "안 먹어본 음식이 없을 정도로 다양한 식경험있어요."]
     }
 case .L:
     /*
      Answer(text: "적당하게 먹으면 되니까 일반고기집을 간다.", type: .L, tag: 1)
      Answer(text: "시험공부가 우선이니 간단하게 먹는다.", type: .L, tag: 2)
      Answer(text: "쉐프의 진가를 보여주는 코스요리", type: .L, tag: 3)
      */
     if tag == 1 {
         return ["뭐든 적당히! 평소 먹는 것도 적당히 먹는 것을 선호해요.", "곱빼기는 조금 부담스러워해요.", "많이 먹는 사람을 보면 신기해해요."]
     } else if tag == 2 {
         return ["시험 전에는 긴장되서 아무것도 안 먹는 편이에요.", "밥먹는 시간을 아깝다고 생각해 줄여보려고 노력한적이 있어요.", "비교적 허기지는 건 잘 참을 수 있어요."]
     } else {
         return ["식사하다보면 얼마 못 가 배불러해요", "음식의 양보다는 요리가 주는 경험을 더 우선시해요."]
     }
 case .G:
     /*
      Answer(text: "통유리창에 양초가 켜져있는 파스타집", type: .G, tag: 1)
      Answer(text: "화려한 조명아래 벚꽃나무가 흩날리는 이자카야", type: .G, tag: 2)
      Answer(text: "현대적으로 재해석한 인테리어의 한식당", type: .G, tag: 3)
      */
     if tag == 1 {
         return ["주로 파스타나 스테이크 등 양식요리를 즐겨먹어요.", "양식당에서 풍기는 분위기를 좋아하는 편이에요.", "평소 음식 사진을 SNS에 올리곤 해요."]
     } else if tag == 2 {
         return ["분위기가 좋은 식당들을 꽤 알고 있어요.", "음식맛도 물론 중요하지만 식당에서 풍기는 분위기도 중요시하는 편이에요", "내부 분위기, 직원 친절도, 맛 이 세가지면 다 갖춘 식당이라고 생각해요."]
     } else {
         return ["식당에도 테마가 있는 인테리어가 있으면 좋아해요.", "마음에 든 식당앞에서는 꼭 사진을 찍어야해요."]
     }
 case .B:
     /*
      Answer(text: "50년 전통의 돼지국밥집", type: .B, tag: 1)
      Answer(text: "포장마차들과 푸드트럭들이 늘어선 먹자골목", type: .B, tag: 2)
      Answer(text: "할머니의 손맛을 자랑하는 시장통 한식당", type: .B, tag: 3)
      */
     if tag == 1 {
         return ["식당에는 맛있는 음식만 있으면 만족해요.", "다른 건 다 참아도 맛없는 음식을 파는 식당은 못 참아요.", "전통있거나 특별한 비법이 들어간 음식을 파는 식당에 끌려요."]
     } else if tag == 2 {
         return ["친근한 느낌이 나는 식당을 좋아해요.", "자주 가는 식당이 있어서 그 식당 사장님과 내적친밀감이 있어요.", "편안한 곳에서 밥먹는 것을 좋아해요."]
     } else {
         return ["식당 한곳을 자주가서 사장님과 친해진 적이 있어요.", "주로 음식에 정성을 따지는 편이에요."]
     }
 case .I:
     /*
      Answer(text: "조금만 참으면 되니 식비부터 절약한다.", type: .I, tag: 1)
      Answer(text: "옷이나 여러 구독형 결제들", type: .I, tag: 2)
      Answer(text: "재빠르게 가격표를 본 뒤, 저 돈이면..하며 돌아선다.", type: .I, tag: 3)
      */
     if tag == 1 {
         return ["특별한 날이 아니면 식사에 큰 돈을 쓰지 않아요.", "배고픔을 일상생활이 불가능할 정도로 느끼진 않아요.", "배가 고파도 기분에는 별 영향이 없어해요."]
     } else if tag == 2 {
         return ["크게 식비가 나가는 것을 부담스러워해요.", "소비에서 식비는 우선순위에서 밀리는 편이에요.", "외식보단 편하게 집에서 먹는 것을 좋아해요."]
     } else {
         return ["비싼 물건을 보면 국밥이 몇그릇인지 계산해보는 편이에요.", "수중에 남은 돈을 보면서 나갈 식비를 조정해요."]
     }
 case .C:
     /*
      Answer(text: "먹고 힘내야 월급날까지 버틸 수 있으므로 배달부터 시킨다.", type: .C, tag: 1)
      Answer(text: "배달앱 또는 여러 식당들", type: .C, tag: 2)
      Answer(text: "내 왼손에는 닭꼬지, 오른손엔 음료가 이미 있다.", type: .C, tag: 3)
      */
     if tag == 1 {
         return ["배가 고프면 곧장 기분이 안 좋아져요.", "허기지면 일상생활에 지장을 주기도 해요.", "뭐니뭐니해도 잘 먹는게 최고라고 생각해요."]
     } else if tag == 2 {
         return ["한달에 두세번은 외식이나 배달을 시켜먹는 편이에요.", "식비지출이 가장 커서 고민일 때가 있어요."]
     } else {
         return ["타지역 여행을 가면 꼭 그곳의 로컬푸드는 먹어봐야해요.", "먹는 것에는 아낌없이 돈을 쓰는 편이에요."]
     }
 }
 
 */
