//
//  ResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultAnswerImage: UIImageView!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [Character : Int] = [:]
        let responseTypes = responses.map { $0.type.rawValue }
        
        // 타입들의 빈도수를 구함
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        // 빈도수 기준으로 정렬
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        // MeokBTI 변환전, 알파벳순서로 정렬
        let Best4MeokTypeSorted = frequentAnswerSorted[0...3].sorted { $0.key < $1.key }
        print("frequentAnswerSorted",frequentAnswerSorted)
        print("Best4MeokTypeSorted",Best4MeokTypeSorted)
        
        // 정렬된 알파벳들을 하나에 문자(MeokBTI)로 만들어 줌.
        let meokBTI = Best4MeokTypeSorted.map { String($0.key) }.reduce("") { $0 + $1 }
        
        print(meokBTI)
        
        let resultImage = UIImage(named: "\(meokBTI).jpg")
        resultAnswerImage.image = resultImage
        
        resultAnswerLabel.text = pushDefinition(meokBTI: "\(meokBTI)")["resultAnswer"]
        resultDefinitionLabel.text = pushDefinition(meokBTI: "\(meokBTI)")["resultDefinition"]

        

        
        
//        let mostCommonAnswer = frequentAnswerSorted.map { $0.key.rawValue }
        
        // 위 두 문단의 코드를 밑에 한줄로 축약 가능
//        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        
        
    }
    
    
    func pushDefinition(meokBTI: String) -> [String : String] {
    // 각 먹bti에 맞는 설명들 추출 -> 클래스로 해당 데이터들을 담아서 함수에서는 그걸 추출하는 식으로 바꿔야할 듯
        switch meokBTI {
        case "ACEG" :
            return ["resultAnswer" : "독고다이 돌하르방 \n\(meokBTI)",
                    "resultDefinition" : "새로운 음식 도전하는 것을 좋아함. 어느식당에서나 혼밥 할 수 있는 힘을 가지고 있다. 음식 가지고 장난치는건 못참는 편."]
        case "ACFH" :
            return ["resultAnswer" : "단골가게 충성돼지 \n\(meokBTI)",
                    "resultDefinition" : "게으른 완벽주의자. 메뉴를 정하는데 오랜 시간이 걸린다. 열 번 중 여덟번은 내가 한일에 만족 하지 못함 항상 가는 식당이 정해져있다"]
        case "BDFH" :
            return ["resultAnswer" : "별심이 \n\(meokBTI)",
                    "resultDefinition" : "순진하다. 여러사람들과 함께 하는 식사 자리를 즐긴다. 외로움을 잘 느낀다. 밥 먹을 때 건드리면 문다"]
        default:
            return ["resultAnswer" : "Your MeokBTI",
                    "resultDefinition" : "Not yet"]
        }
    }
    
}

// 12 problems, 3 : 3 : 3 : 3 ,  A : 2 B : 1 / C: 2 D: 1 / E: 1 F: 2 / G: 2 H: 1
// 100 problems . 25: 25: 25: 25 A : 13 B : 12 / C: 23 D: 1 / E: 11 F: 14 / G: 20 H: 5
