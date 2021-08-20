//
//  ResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    var resultTableView: ResultTableViewController!
    var meokBTI: MeokBTI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        meokBTI = MeokBTI(rawValue: calculatePersonalityResult())
        resultTableView = self.children[0] as? ResultTableViewController
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultTableView.definitionLabel.text = "\(meokBTI.shortDefinition)\n\(meokBTI.meokBTI)"
        resultTableView.meokBTIImageView.image = UIImage(named: "\(meokBTI.meokBTI).jpg")
        resultTableView.descriptionLabel.text = meokBTI.longDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func calculatePersonalityResult() -> String {
        // 기존의 로직은 질문수에 영향을 받아 오류가 남 -> 질문수와 관련없이(but,질문갯수 홀수 필수) 값을 일정하게 뽑아낼 수 있게 변경
        var frequencyOfAnswers: [Character : Int] = [:]
        let responseTypes = responses.map { $0.type.rawValue }
        
        // 1.타입들의 빈도수를 구함
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        
        // 2.알파벳 순서로 정렬
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.key < pair2.key
        })
        
        // 3. 상반되는 타입 중 하나만 남김 (ex A,B -> A)
        var best4MeokType = [Character: Int]()
        for i in stride(from: 0, through: 6, by: 2) {
            if frequentAnswerSorted[i].value > frequentAnswerSorted[i+1].value {
                best4MeokType[frequentAnswerSorted[i].key] = frequentAnswerSorted[i].value
            } else {
                best4MeokType[frequentAnswerSorted[i+1].key] = frequentAnswerSorted[i+1].value
            }
        }
        
        // 4. 다시 알파벳 정렬
        let best4MeokTypeSorted = best4MeokType.sorted(by: <)
        
        print("frequentAnswerSorted",frequentAnswerSorted)
        print("Best4MeokTypeSorted",best4MeokTypeSorted)
        
        // 5. 정렬된 알파벳들을 하나에 문자(MeokBTI)로 만들어 줌.
        let rawMeokBTI = best4MeokTypeSorted.map { String($0.key) }.reduce("") { $0 + $1 }
        
        print("rawMeokBTI :",rawMeokBTI)
        return rawMeokBTI
        
    }
    
    func convertRefinedMeokBTI(rawMeokBTI: String) -> MeokBTI? {
        guard let refinedMeokBTI = MeokBTI(rawValue: rawMeokBTI) else { return nil }
        
        return refinedMeokBTI
    }

}

// 12 problems, 3 : 3 : 3 : 3 ,  A : 2 B : 1 / C: 2 D: 1 / E: 1 F: 2 / G: 2 H: 1
// 100 problems . 25: 25: 25: 25 A : 13 B : 12 / C: 23 D: 1 / E: 11 F: 14 / G: 20 H: 5
