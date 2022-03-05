

import UIKit

class VersionViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let button = UIButton(frame: CGRect(x: 20, y: 280, width: 220, height: 100))
       
        view.addSubview(button)
        button.setTitle("최신 버전은 1.1 입니다. ", for: .normal)
        
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        
        button.center = view.center
        
        let button2 = UIButton(frame: CGRect(x: 80, y: 260, width: 220, height: 100))
       
        view.addSubview(button2)
        button2.setTitle("현재의 버전은 1.0입니다. ", for: .normal)
        
        button2.backgroundColor = .link
        
        
        button2.setTitleColor(.white, for: .normal)
        
    }
 

}

    
    



