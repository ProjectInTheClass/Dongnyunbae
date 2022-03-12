//
//  IntroductionViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit
// 첫 테스트화면일 때만 탭바를 가림
class IntroductionViewController: UIViewController {
        
    @IBOutlet weak var testStartButton: UIButton!
    
    let user = User.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideTabBar(when: isFirstStart())
        testStartButton.layer.cornerRadius = 5
        testStartButton.flash()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        testStartButton.flash()
    }
    
    func isFirstStart() -> Bool {
        return user.meokBTI == nil
    }
    
    func hideTabBar(when isFirst: Bool) {
        self.tabBarController?.tabBar.isHidden = isFirst
    }

    @IBAction func unwindToQuizIntroduction(_ unwindSegue: UIStoryboardSegue) {
        hideTabBar(when: false)
    }


}

