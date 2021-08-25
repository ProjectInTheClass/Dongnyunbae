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

enum MeokBTI: String, Codable {
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
            return "익살스런 치아바타"
            
        case .EMBC :
            return "부끄러운 치킨"
            
        case .HMGC :
            return "먹방BJ 랍스타"
            
        case .HMBC :
            return "니것도 내것 대왕돈까스"
        //----
        case .ELGI :
            return "금사빠 새우튀김"
       
        case .ELBI :
            return "정신없는 삼각김밥"
            
        case .HLGI :
            return "텐션폭발 소주"
            
        case .HLBI :
            return "불량한 붕어빵"
        //----
        case .ELGC :
            return "낭만있는 마카롱"
       
        case .ELBC :
            return "게으른 라면"
            
        case .HLGC :
            return "도도한 레드와인"
            
        case .HLBC :
            return "늘 졸린 번데기"
        }
    }
    
    var longDescription: String {
        switch self {
        case .EMGI :
            return "대단합니다. 대부분의 식당들과 음식들이 이들의 입맛을 충족시켜 주지 못하는데 용케도 지금까지 살아남았군요. 오이형 사람과 식사약속을 잡으려는 친구는 분명 마음 깊이 스트레스가 쌓여있을 지도 모릅니다.  하지만 그만큼 오이형 사람의 식당추천은 거의 100% 확신이 들 정도로 믿음직한 추천입니다. 과연 이들의 귀한 선택을 받은 식당은 과연 몇 군데가 있을까요?"
            
        case .EMBI :
            return "감자형 사람에게 음식은 옳고 그름이 있습니다. 정직하고 성실하며 위풍당당한 이들은 어떤 어려움이 닥쳐오더라도 이들이 추구하는 옳은 음식만을 먹습니다. 심지어 주변 사람들에게도 그들의 식사방식을 권면하기도 하죠.  만일 주변의 누군가가 뚜렷한 목표를 세우고 힘들어도 옳은 음식 먹기를 고수하는 이가 있다면 그는 바로 감자형 사람일 것입니다. 이들의 음식결정에 있어서 어떤 이들은 융통성이 없다고 할 지도 모릅니다. 하지만 감자형 사람의 성격이 외골수여서가 아니라 건강하고 옳은 음식을 먹는 것이 참된 길임을 굳게 믿는 강한 의지의 사람이기 때문인 것을 주변에서도 알아줘야 할 것입니다."
            
        case .HMGI :
            return "냉철하면서도 왕성한 호기심을 가진 민트초코형 사람은 상당히 도전적인 사람입니다. 제아무리 어려워도 푸짐하고 좋은 분위기의 가성비가 좋은 식당들을 찾는 데에도 재주가 있죠.  때문에 식사일정을 잡을 때 혼자 도맡아서 모든 걸 짊어질 때가 종종 생깁니다. 그만큼 대부분의 사람들이 이들의 도전적인 식당선택을 믿고 의지하는 편입니다.  그러나 때로는 이들의 확고한 입맛취향 때문에 호불호가 갈리는 식사도 생기기도 합니다. 명심하십시오. 민초는 모두의 음식이 아닌 것을."
            
        case .HMBI :
            return "한 자리에 우뚝 앉아서 냠냠쩝쩝 쉬지 않고 음식을 먹는 이가 있다면 그는 캔맥주형 사람일 수 있습니다. 느릿느릿하면서도 꾸준히 먹는 모습으로 식사자리에서 이들만의 입지를 확고하게 다집니다. 나긋나긋하게 움직이는  이들의 손길에서 음식을 향한 강렬한 의지가 느껴지기도 합니다.  또한 캔맥주형 사람은 식사자리에서 사람들과 친화적으로 시간을 보내 주변 사람들이 이들에게서 섬세함을 느낍니다. 그래서 사교성이 좋고 활발한 사람으로 비춰지지만 때로는 이들만의 혼술타임이 필요로 하는 사람이기도 합니다."
        //----
        case .EMGC :
            return "Not yet"
            
        case .EMBC :
            return "Not yet"
            
        case .HMGC :
            return "Not yet"
            
        case .HMBC :
            return "Not yet"
        //----
        case .ELGI :
            return "새우튀김형 사람은 음식 먹는 행위를 마치 예술로 승화시키는 능력이 있습니다. 이들의 디자인 감각을 통해 음식들은 아름다운 이미지로 형상화되고 그 이미지를 통하여 다른 이들로 하여금 식욕을 돋구게 합니다.  이같은 예술행위에 마치 중독된 모양처럼 새로운 음식들을 자꾸만  찾아나서게 됩니다. 그래서 많은 양의 음식을 취하기 보다는 음식을 적게 먹고 최대한 다양한 음식을 먹으려고 하는 경향이 강합니다."
       
        case .ELBI :
            return "Not yet"
            
        case .HLGI :
            return "함께 식사하면서 흥얼거리며 즉흥적으로 흥을 돋우는 누군가가 있다면 이 사람은 바로 소주형 사람일 가능성이 큽니다. 이들은 순간의 흥분되는 감정과 분위기에 빠져들기 좋아하며 주위 사람들도 함께 즐기기를 원합니다.  함께 식사교제하는 사람들을 즐겁게 해 주는 이들의 텐션은 다른 유형의 사람들은 쉽사리 따라오지 못합니다. 어떠한 어색한 식당이 있더라도 이들에겐 그들의 무대로 따라올 뿐입니다.  자리를 즐겁게 만들어주는 이들에게 걱정거리가 있으니 바로 식당의 비용문제입니다. 텐션이 폭발하고 난 이후가 되고 정신을 차려 영수증을 보는 소주형 사람들은 슬퍼할지도 모릅니다. 정신차려있을 때 부담없는 식당을 고르는 것이 좋겠습니다."
            
        case .HLBI :
            return "붕어빵형 사람은 청렴결백하면서도 정확한 논리력으로 가성비가 출중한 식당들을 골라냅니다. 이들에겐 이들만의 질서가 잡혀있으며 누군가가 그 질서에 간섭하는 것을 원치 않습니다. 다함께 식사하러 가야하는데 비용문제가 클 경우 이들의 판단이 빛을 발하기도 하죠.  예리하며 근거있는 판단으로 음식먹기를 결정하는 이들은 즉흥적으로 여기저기서 음식먹는 행위를 낭비라고 생각하기도 합니다. 그래서인지 붕어빵형 사람들끼리 모여 음식을 먹거나 보통 혼밥하는 모습이 많이 보이는 유형이기도 합니다."
        //----
        case .ELGC :
            return "낭만을 추구하는 당신에게 식당은 편안하고 훌륭한 분위기를주어야만 합니다. 이를 위해 비싼 비용도 마다하지 않는 당신은 낭만파 마카롱!"
       
        case .ELBC :
            return "음식 먹을 땐 간편한게 최고! 음식의 양이 어떻든, 분위기가 어떻든,가격도 신경쓰이지 않지만 편한 게 최고인 당신에게서 게을러보여도 친근함이 느껴집니다."
            
        case .HLGC :
            return "Not yet"
            
        case .HLBC :
            return "이들의 정체는 과연 누구일까요? 도전적인 사람? 부자? 번데기형 사람에게 꽤 독특한 특징이 있는데 바로 이들의 정체성이 뚜렷하게 드러나지 않는다는 점입니다. 마치 통조림만 보면 통조림 안의 내용물을 볼 수 없듯이 말이죠.  그나마 번데기형 사람들에게서 찾아볼 수 있는 특이점 중 대표적인 것이 다른 유형의 사람들과 식사약속을 잡을 때 늘 맞춰준다는 점입니다. 때문에 음식취향이 뚜렷한 유형의 사람들과 죽이 잘 맞기도 합니다.  그러나 식당선택에 곤란함을 겪고있는 사람들에게 있어 이들은 마치 게으름에 빠져있는 친구로 보이기 쉽상입니다. 대강대강 선택하기보다는 한번쯤은 신중하게 식당을 선택해 보는 것은 어떨까요?"
        }
    }
    
    func showConvertedMeokBTI() {
        print(self.meokBTI)
    }
    
    
}
