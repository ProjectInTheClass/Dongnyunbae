//
//  PopUpViewController.swift
//  MeokBTI
//
//  Created by 박대호 on 2021/08/25.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var Label: UILabel!
    var strText = "nil"

    // 팝업창 관련 코드
    
    @IBAction func gotoTest(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "MeokBTIStoryboard") as! IntroductionViewController
        // 맵뷰 함수호출
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = strText

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

}
