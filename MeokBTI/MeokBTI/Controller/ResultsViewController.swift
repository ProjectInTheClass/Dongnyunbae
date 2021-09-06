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
    
    let user = User.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        meokBTI = MeokBTI(rawValue: calculatePersonalityResult())
        resultTableView = self.children[0] as? ResultTableViewController
        
        if User.loadFromFile().meokBTI == nil {
            user.meokBTI = meokBTI
            User.saveToFile(user: user)
            print("save MeokBTI success")
        } else {
            print("Stored MeokBTI :",User.loadFromFile().meokBTI)
            print("still stored ID :",User.loadFromFile().id)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultTableView.definitionLabel.text = "\(meokBTI.shortDefinition)\n\(meokBTI.meokBTI)"
        resultTableView.meokBTIImageView.image = UIImage(named: "\(meokBTI.meokBTI).png")
        resultTableView.shortDesriptionLabel.text = "\"\(meokBTI.shortDescription)\""
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
        // 1차 수정 : 기존의 로직은 질문수에 영향을 받아 오류가 남 -> 질문수와 관련없이(but,질문갯수 홀수 필수) 값을 일정하게 뽑아낼 수 있게 변경
        // 2차 수정 : 한 쪽으로 답변이 쏠렸을 경우 기본값이 없기에 기존의 로직에서 오류 -> default 값을 지정해줌으로, 해당 답변이 안나와도 갯수 비교 가능

        var frequencyOfAnswers: [Character : Int] = ["A": 0, "B": 0, "C": 0, "D": 0, "E": 0, "F":0, "G": 0, "H": 0]
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
    
    @IBAction func shareImageTap(_ sender: UITapGestureRecognizer) {
        print("share!")
        // [] 결과화면 전체 캡처후 이미지 변환
        // [] Extension (카카오톡, 인스타, 페북, 트위터, 공유) 추가
        var resultToShare = UIImage()
//        if let text = textField.text {
//            objectsToShare.append(text)
//            print("[INFO] textField's Text : ", text)
//        }
        
        resultToShare = UIImage()
        
        let activityVC = UIActivityViewController(activityItems: [resultToShare], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        // 공유하기 기능 중 제외할 기능이 있을 때 사용
//        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
    }
    

}

// 12 problems, 3 : 3 : 3 : 3 ,  A : 2 B : 1 / C: 2 D: 1 / E: 1 F: 2 / G: 2 H: 1
// 100 problems . 25: 25: 25: 25 A : 13 B : 12 / C: 23 D: 1 / E: 11 F: 14 / G: 20 H: 5
