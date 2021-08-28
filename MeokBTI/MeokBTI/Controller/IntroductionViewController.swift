//
//  IntroductionViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit
import FirebaseDatabase

class IntroductionViewController: UIViewController {
    

    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.ref.child("TEST cnt").setValue(1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToQuizIntroduction(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
    }


}

