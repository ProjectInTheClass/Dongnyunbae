//
//  IntroductionViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit

class IntroductionViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("첫화면 로드성공!")
        // Do any additional setup after loading the view.
    }
    
    // [] 애니메이션 넣기
//    func updateGradation() -> () {
//        print("alpha down!")
//        Thread.sleep(forTimeInterval: 1)
//        self.gradationView.alpha -= 0.1
//
//        if self.gradationView.alpha == 0 {
//            return
//        }
//
//        return updateGradation()
//    }

    @IBAction func unwindToQuizIntroduction(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
    }


}

