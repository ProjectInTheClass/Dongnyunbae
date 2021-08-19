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
        let rawMeokBTI = Best4MeokTypeSorted.map { String($0.key) }.reduce("") { $0 + $1 }
        
        print(rawMeokBTI)
        
        let resultImage = UIImage(named: "\(rawMeokBTI).jpg")
        resultAnswerImage.image = resultImage
        
        if let refinedMeokBTI = MeokBTI(rawValue: rawMeokBTI) {
            resultAnswerLabel.text = "\( refinedMeokBTI.shortDefinition)\n\( refinedMeokBTI.meokBTI)"
            resultDefinitionLabel.text = refinedMeokBTI.longDescription
            
            let user = User()
            user.meokBTI = refinedMeokBTI
            print("stored!! ->",user,user.meokBTI)
        }
        

        
    }

}

// 12 problems, 3 : 3 : 3 : 3 ,  A : 2 B : 1 / C: 2 D: 1 / E: 1 F: 2 / G: 2 H: 1
// 100 problems . 25: 25: 25: 25 A : 13 B : 12 / C: 23 D: 1 / E: 11 F: 14 / G: 20 H: 5
