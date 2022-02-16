//
//  MeokBTI.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/19.
//

import Foundation

enum MeokType: Character {
//     접근성 (A, B) 양 (C, D) 분위기 (E, F) 가격 (G, H)
    case E = "A", H = "B", M = "C", L = "D", G = "E", B = "F", I = "G", C = "H"
    
}

enum MeokBTI: String, Codable {
    
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
    
    // MARK: 이미지 위에 들어갈 정의(MeokBTI 다음줄)
    var shortDefinition : String {
        switch self {
        case .EMGI :
            return "까다로운 오이"
            
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
            return "배부른 대왕돈까스"
        //----
        case .ELGI :
            return "금사빠 새우튀김"
       
        case .ELBI :
            return "영민한 삼각김밥"
            
        case .HLGI :
            return "텐션폭발 소주"
            
        case .HLBI :
            return "구두쇠 붕어빵"
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
    
    // MARK: 이미지 밑에 들어갈 설명
    var shortDescription: String {
        switch self {
        case .EMGI :
            return "여기보단 저기가 더 나은데"
            
        case .EMBI :
            return "건강하고 정직한 음식이 최고야!"
            
        case .HMGI :
            return "훗! 내가 알아서 다 한다구!"
            
        case .HMBI :
            return "냠냠쩝쩝.. 냠냠쩝쩝.."
        //----
        case .EMGC :
            return "나랑 같이 저거 먹을래?"
            
        case .EMBC :
            return "집에서도 맛있는 음식 충분히 먹을 수 있는데.."
            
        case .HMGC :
            return "유하~ 이거 보세요! 이게 바로 랍스터라는 것이에요!"
            
        case .HMBC :
            return "밥은 든~든하게 먹는 게 최고지!"
        //----
        case .ELGI :
            return "뭐야?! 여기 완전 맛있잖아!"
       
        case .ELBI :
            return "이 집은 왜이리 음식이 늦게 나와"
            
        case .HLGI :
            return "나 아직 더 먹을 수 있어!!"
            
        case .HLBI :
            return "에이 저거 사 먹기에는 뭔가 아까운데.."
        //----
        case .ELGC :
            return "저번에 그집 괜찮던데, 같이 갈래? 내가 사줄게"
       
        case .ELBC :
            return "바로 앞에 저기 가자 그냥~"
            
        case .HLGC :
            return "여기 분위기 대박이지?"
            
        case .HLBC :
            return "아무거나~ 난 다 괜찮아"
        }
    }
    
    // MARK: 제일 밑에 들어갈 설명
    var longDescription: String {
        switch self {
        case .EMGI :
            return " 대단합니다. 대부분의 식당들과 음식들이 이들의 입맛을 충족시켜 주지 못하는데 용케도 지금까지 살아남았군요.\n\n 오이형 사람과 식사약속을 잡으려는 친구는 분명 마음 깊이 스트레스가 쌓여있을 지도 모릅니다.  하지만 그만큼 오이형 사람의 식당추천은 거의 100% 확신이 들 정도로 믿음직한 추천입니다.\n\n 과연 이들의 귀한 선택을 받은 식당은 과연 몇 군데가 있을까요?"
            
        case .EMBI :
            return " 감자형 사람에게는 음식에 자신만의 옳고 그름이 있습니다. 바로 저렴한 가격에 자신의 배를 푸짐하게 채워주는 것이죠.\n\n 근처에서 이들을 만족시켜주는 식당의 분위기가 다른 사람들에게는 불만일수도 있어요. 하지만 이들에게 그런건 문제가 아니랍니다."
//            return " 감자형 사람에게 음식은 옳고 그름이 있습니다. 정직하고 성실하며 위풍당당한 이들은 어떤 어려움이 닥쳐오더라도 이들이 추구하는 옳은 음식만을 먹습니다. 심지어 주변 사람들에게도 그들의 식사방식을 권면하기도 하죠.\n\n  만일 주변의 누군가가 뚜렷한 목표를 세우고 힘들어도 옳은 음식 먹기를 고수하는 이가 있다면 그는 바로 감자형 사람일 것입니다.\n\n 이들의 음식결정에 있어서 어떤 이들은 융통성이 없다고 할 지도 모릅니다. 하지만 감자형 사람의 성격이 외골수여서가 아니라 건강하고 옳은 음식을 먹는 것이 참된 길임을 굳게 믿는 강한 의지의 사람이기 때문인 것을 주변에서도 알아줘야 할 것입니다."
            
        case .HMGI :
            return " 냉철하면서도 왕성한 호기심을 가진 민트초코형 사람은 상당히 도전적인 사람입니다.\n\n 제아무리 어려워도 푸짐하고 좋은 분위기의 가성비가 좋은 식당들을 찾는 데에도 재주가 있죠. 때문에 식사일정을 잡을 때 혼자 도맡아서 모든 걸 짊어질 때가 종종 생깁니다. 그만큼 대부분의 사람들이 이들의 도전적인 식당선택을 믿고 의지하는 편입니다.  \n그러나 때로는 이들의 확고한 입맛취향 때문에 호불호가 갈리는 식사도 생기기도 합니다.\n 명심하십시오. 민초는 모두의 음식이 아닌 것을."
            
        case .HMBI :
            return " 한 자리에 우뚝 앉아서 냠냠쩝쩝 쉬지 않고 음식을 먹는 이가 있다면 그는 캔맥주형 사람일 수 있습니다. 느릿느릿하면서도 꾸준히 먹는 모습으로 식사자리에서 이들만의 입지를 확고하게 다집니다.\n\n 나긋나긋하게 움직이는  이들의 손길에서 음식을 향한 강렬한 의지가 느껴지기도 합니다.  또한 캔맥주형 사람은 식사자리에서 사람들과 친화적으로 시간을 보내 주변 사람들이 이들에게서 섬세함을 느낍니다. 그래서 사교성이 좋고 활발한 사람으로 비춰지지만 때로는 이들만의 혼술타임이 필요로 하는 사람이기도 합니다."
        //----
        case .EMGC :
//            return " 치아바타형 사람은 최고의 식사를 위해 힘쓰기를 좋아합니다. 음식에 진정성이 있으며 많은 에너지를 식사에 쓰고 식사를 통해 얻습니다. 코믹하게 식사의 분위기를 만들기도 합니다.\n\n 이들은 이들이 추구하는 식사를 위해서라면 어떠한 비용을 치룰 준비가 되어있습니다. 치아바타형 사람을 친구로 둔 사람들은 함께 식사할 때 얼마나 행복할까요?"
            return " 치아바타형 사람에게 최고의 식사를 위해서는 어떠한 비용도 치룰 준비가 되어있습니다. 누가 먹어도 배부르고 분위기 좋은 식당이 가까운곳에 있다면 단골손님이 될 수도 있겠네요.\n\n 오이형 사람과는 비용적인 문제로 마찰이 생길수도 있으니 그들에게 맞춰주는게 어떨까요?"
            
        case .EMBC :
//            return " 치킨형 사람은 도전적으로 식당 가는 것에 용기를 내기 어려워하는 사람에 속합니다.\n\n 새롭거나 접근하기 어려운 식당은 큰 뜻을 품어야 겨우 가볼 수 있는 곳이죠. 그래서 배달음식을 주로 시켜먹는 것이 일상입니다.\n\n  하지만 그 식당들에 가는 것과 먹는 것이 익숙해지면 아무렇지 않고 덤덤하게 푸짐한 식사를 즐깁니다. 배달음식만을 즐기다가 이렇게 하나씩 하나씩  가봄직한 식당들을 발견해간다면 치킨형 사람에게도 식사의 즐거움을 깨달을 것입니다."
            return " 치킨형 사람은 도전적으로 식당 가는 것에 용기를 내기 어려워하는 사람에 속합니다. 찾아가기 어려운 식당은 큰 뜻을 품어야 겨우 가볼 수 있는 곳이죠. 그래서 배달료가 아깝더라도 시켜먹는 것이 일상입니다.\n\n 하지만 그 식당들에 가는 것과 먹는 것이 익숙해지면 분위기가 어떻든 아무렇지 않고 덤덤하게 푸짐한 식사를 즐깁니다.\n\n 배달음식만을 즐기다가 이렇게 하나씩 하나씩 가봄직한 식당들을 발견해간다면 치킨형 사람도 식사의 즐거움을 깨달을 수 있을 것입니다."
            
        case .HMGC :
            return " 랍스터형 사람은 주로 푸짐하다는 특징이 있습니다. 어떤 음식이든  제아무리 그 몸값이 비싸더라도 이들은 꼭 푸짐하게 먹는 스타일을 고집합니다. 마치 스트리머들이 먹방찍듯이 말이죠.\n\n  또한 랍스터형 사람은 식사자리에서 이목을 많이 끄는 편이기도 합니다.\n 웃음거리를 안겨주기도 하는 이들은 식사행위를 즐거움의 컨텐츠로 승화시킵니다. 이들과 함께 밥 먹는 사람들은 이들을 두고 재밌는 사람이라고 느끼고 있을지도 모릅니다.  하지만 어떤 이들은 걱정어린 눈빛으로 랍스터형 사람들을 바라볼 수도 있습니다. 이들이 자기 형편에 비해 너무 과하게 음식을 먹는 게 아닌가 하고요.\n 절제하는 능력만 갖춰진다면 완벽한 멋쟁이가 될 것입니다."
            
        case .HMBC :
            return " 항상 넘치게 먹어야 만족하는 대왕돈까스형 사람은 풍족하게 펼쳐져 있는 식탁의 음식들을 보기만 해도 미소가 지어집니다. 그것들이 자신의 뱃속을 가득 채워주는 양분이 될 때 세상을 다 가진 것처럼 행복해집니다.\n\n  대왕돈까스형 사람은 뭐니뭐니해도 양을 중요시 여깁니다. 주변에 음식을 다 먹기 힘들어하는 친구가 있다면 그 친구 대신 남은 음식들을 모두 먹어줄 정도로 잘 먹는 사람이기도 합니다."
        //----
        case .ELGI :
//            return " 새우튀김형 사람은 음식 먹는 행위를 마치 예술로 승화시키는 능력이 있습니다. 이들의 디자인 감각을 통해 음식들은 아름다운 이미지로 형상화되고 그 이미지를 통하여 다른 이들로 하여금 식욕을 돋구게 합니다.\n\n 이같은 예술행위에 마치 중독된 모양처럼 새로운 음식들을 자꾸만 찾아나서게 됩니다. 그래서 많은 양의 음식을 취하기 보다는 음식을 적게 먹고 최대한 다양한 음식을 먹으려고 하는 경향이 강합니다."
//            return " 새우튀김형 사람은 매우 즉흥적이고 모험심이 강한 사람입니다. 길을 가다 마음에 드는 식당이 보이면 일단 들어가버리죠.\n\n 들어가면서부터 식당의 분위기에 취해 음식의 양이 적어도 알아차리지 못합니다. 계산서를 보고 식당을 나서며 웃을 수 있다면 단골 가게가 될지도 몰라요."
            return " 새우튀김형 사람은 식당을 고를 때, 별 상관없는 듯하지만 사실 마음속에 한 곳을 담아두고 있어요. 그치만 입맛에 안 맞더라도 다수의 의견을 잘 따르려고 하는 편이에요. \n\n평소에는 음식에 돈을 많이 쓰려하진 않지만 특별한날에는 그래도 쓰려고 해서 한번씩 친구들한테 한턱쏘기도 해요.\n\n 가까운 곳에서 식사를 하는 걸 즐기지만, 다들 상관없어하면 멀리 가는 것도 괜찮아해요. 그래서 유명한 맛집들은 대부분 친구에게 이끌려서 접해보았어요. \n\n플레이팅이 잘 된 음식을 보면 괜시리 기분이 좋아져, 그 식당에 대한 만족도가 높아져요. 거기다가 음식이 입맛에 맞다면 거긴 단골식당이 될 확률이 높아요."
       
        case .ELBI :
//            return " 삼각김밥형 사람은 바쁜 환경 속에서 혹은 바쁜 마음으로 살고 있습니다. 가까운 거리와 적합한 가격을 제공해주는 식당들이 이들의 선택을 받기 수월 합니다.\n\n 때로는 편의점 컵라면으로 끼니를 넘기는 경우도 발생하기도 합니다.  그만큼 삶의 중심이 음식이 아닌 다른 일에 초점이 맞춰져 있는 사람입니다. 다른 이들이 음식에 열중할 때 어쩌면 이들은 다른 소중한 것들을 얻고 있을지 모릅니다. 그래도 소중한 이들과의 식사만큼은 소중히 챙겨보는 것은 어떨까요?"
            return " 삼각김밥형 사람은 바쁜 환경속에서 살고 있거나 식사시간에는 바쁜 마음으로 살고 있습니다. 그래서 그런지 식사를 제대로 챙겨먹지 못하는 경우가 많습니다.\n\n식사를 빠르게 끝내고 싶어하기에 먹는 속도도 빠르고 빨리 나오는 음식을 선호하며 껍질을 까야한다거나 먹기 불편한 음식은 기피하는 경향이 있습니다.\n\n식사에 큰 시간을 들이지 않으려하고 효율적인 식사를 하려합니다.\n\n근처식당은 이미 다 섭렵을 하셨을테니, 한번쯤은 못이기는척 유명한 맛집도 가보는 것이 어떨까요? "
            
        case .HLGI :
//            return " 함께 식사하면서 흥얼거리며 즉흥적으로 흥을 돋우는 누군가가 있다면 이 사람은 바로 소주형 사람일 가능성이 큽니다. 이들은 순간의 흥분되는 감정과 분위기에 빠져들기 좋아하며 주위 사람들도 함께 즐기기를 원합니다.\n\n  함께 식사교제하는 사람들을 즐겁게 해 주는 이들의 텐션은 다른 유형의 사람들은 쉽사리 따라오지 못합니다. 어떠한 어색한 식당이 있더라도 이들에겐 그들의 무대로 따라올 뿐입니다.\n  자리를 즐겁게 만들어주는 이들에게 걱정거리가 있으니 바로 식당의 비용문제입니다. 텐션이 폭발하고 난 이후가 되고 정신을 차려 영수증을 보는 소주형 사람들은 슬퍼할지도 모릅니다. 정신차려있을 때 부담없는 식당을 고르는 것이 좋겠습니다."
            return " 식사중에도 쉬지않고 말을 하며 주로 식사의 분위기를 주도하는 이 사람은 바로 소주형 사람일 가능성이 큽니다.\n\n함께 식사하는 사람들을 즐겁게 해주는 이들의 텐션을 다른 유형의 사람들은 쉽사리 따라오지 못합니다. 어떤 어색한 식당이더라도 이들에겐 그들의 무대일 뿐입니다.\n\n 하지만 즐겁게 식사를 하고 나서 식당의 비용 때문에 남몰래 고민하기도 합니다. 비싼 음식을 먹는다고 즐거운 것이 아니니 이들에게 식당 선택을 맡긴다면 저렴한 비용으로 즐거운 식사를 할 수 있지 않을까요? "
            // 가격이 싸야하는데 영수증을 보고 후회한다?? -> 수정필요
            
        case .HLBI :
            return " 붕어빵형 사람은 식사보다 중요한 게 많은 사람입니다. 한번 먹고 사라지는 음식보단 다른 곳에 지출을 하는 편인 것이죠.\n\n주로 식당을 고려할 때 가격은 빠질 수 없는 요소이나, 시간을 쓰는 건 아까워하진 않습니다.\n\n경제력이 올라간다면 음식에 대한 욕심이 커질 확률이 높은 유형입니다.\n\n눈으로 이쁜 음식은 결국 속으로 들어가면 똑같기에, 애초부터 든든한 음식들을 선호하는 경향이 있습니다.\n\n 특별한 날에 기회삼아 새로운 음식을 접해보는건 어떠세요?\n"
        //----
        case .ELGC :
//            return " 마카롱형 사람에게는 따뜻한 이상이 담겨 있습니다. 분위기가 멋있는 식당에서 좋은 사람들과 함께 식사하는 낭만이 바로 그것이죠.\n\n 마카롱형 사람은 이들이 추구하는 이상과 근접하는 식당에서 식사하는 것에 많은 비용을 지불하더라도 개의치 않습니다. 다만 그렇지 못한 상황에서 식사를 하게 될 경우 다른 유형의 사람들보다 훨씬 불편한 마음을 가지고 식사할지도 모릅니다. 식당을 찾거나 식사하기 까지의 과정도 어려움을 겪을 때도 마찬가지이죠.\n\n  함께 식사했던 사람들 중 행복하게 식사했던 사람들을 주변에 꼭 붙잡는 건 어떨까요? 그들이라면 마카롱형 사람이 그리워하는 식사환경을 찾아줄 수 있을 겁니다."
            return " 마카롱형 사람에게는 따뜻한 이상이 담겨 있습니다. 분위기가 멋있는 식당에서 좋은 사람들과 함께 식사하는 낭만이 바로 그것이죠.\n\n 마카롱형 사람은 이들이 추구하는 이상과 근접한 식당에서 푸짐하게 먹는 것에 많은 비용을 지불하더라도 개의치 않습니다. 다만 그렇지 못한 상황에서 식사를 하게 될 경우 다른 유형의 사람들보다 훨씬 불편한 마음을 가지고 식사할지도 모릅니다. 식당을 찾기까지의 과정에서 어려움을 겪을 때처럼 말이죠.\n\n 함께 식사했던 사람들 중 행복하게 식사했던 사람들을 주변에 꼭 붙잡는 건 어떨까요? 그들이라면 마카롱형 사람이 그리워하는 식사환경을 찾아줄 수 있을 겁니다."
       
        case .ELBC :
//            return " 라면형 사람은 식당선택 시 고려사항이 간단합니다. 얼마나 편하게 식당에 갈 수 있느냐입니다. 심지어 먹기 불편한 음식을 판매하는 식당도 왠만해선 가지 않습니다.\n\n 주변 친구들은 이들이 음식선택에 관대한건지 귀찮은건지 헷갈리기도 합니다.  그럼에도 불구하고 라면형 사람은 이들의 니즈를 충족시킬 수만 있다면 어떠한 결격사항이 있어도 오케이입니다. 그것이 양이 적든, 분위기가 별로든, 비용이 많이 나가든 어떻든 간에 간편하고 원활하게 음식을 먹을 수 있는 것이 이들에게 있어 최선의 식사입니다."
            return " 라면형 사람과의 식사장소는 비교적 간단하게 고를 수 있습니다. 딱히 거르는 음식들이 없기에 다른사람이 제안하는 식당들을 대부분 수용하기 때문이죠. \n\n가까운 곳에 위치한 식당이라면 어떤 곳이든 갈 의향이 있습니다. 자주 가는 식당도 그러한 곳이지요. \n\n주어진 시간이 별로 없다면 라면형 사람이 가장 좋은 식사장소를 선택할 확률이 높습니다.\n\n음식에 꽤나 관대하여 다양한 음식을 먹어볼 능력을 충분히 있으니 특색있는 요리를 먹으러 떠나보는건 어떨까요?"
            
        case .HLGC :
            return " 레드와인형 사람은 식당 분위기를 제일 중요시하며 눈으로도 식사를 즐기는 유형입니다. 이쁘게 플레이팅된 음식과 어우러지는 조명은 식사를 즐겁게 만들어 줍니다. \n\nSNS에 나오는 맛집은 레드와인형 사람에게 주 타겟이 됩니다. 많은 곳을 경험해본만큼 이제는 본인이 직접 찾은 분위기맛집이 있을 정도입니다. \n\n자신이 만족했던 식당에 다른 사람을 데려간다면 그사람은 분명 만족해하거나 부담스러워하거나 둘 중 하나일 겁니다. \n\n특별한날은 레드와인형 사람에게 식당선택을 맡기면 성공할 확률이 높습니다."
            
        case .HLBC :
            return " 번데기형 사람이 자주 하는 말은 ‘아무거나’입니다. 그래서 많은 오해를 받을 때가 있습니다. 정말 아무거나 먹어도 괜찮은데 말이죠.\n\n일행이 가자는 곳을 대부분 잘 가며, 가리는 음식도 없어서 모든 먹BTI형과 잘 맞아 떨어지는 유형이기도 합니다.\n\n새로운 음식에 대한 거리낌이 없는 편이지만 그날 기분에 따라 식당선택이 달라지기도 합니다.\n\n이것저것 따지는 사람과 식사를 한다면 매우 불쾌한 사람이 될 수도 있으니 원하는 식당 하나쯤은 정해두는 것은 어떨까요?\n"
        }
    }
    
    func printConvertedMeokBTI() {
        print(self.meokBTI)
    }
    
    func getMeokBTI() -> String {
        return self.meokBTI
    }
    
    func calculateResponseToMeokBTI(responses: [Answer]) {
        
    }
}
