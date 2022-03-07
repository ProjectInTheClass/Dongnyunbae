
import MessageUI
import UIKit
import SafariServices

class MailViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
       
        view.addSubview(button)
        button.setTitle("Contact Us", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(){
        if MFMailComposeViewController.canSendMail(){
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Contact Us / Feedback")
            vc.setToRecipients(["MeokBTI@gmail.com"])
            vc.setMessageBody("<h1> 안녕하세요! 먹비티아이 개발자에게 질문이 있습니다. <h1>", isHTML: true)
            
            present(vc, animated: true)
        }
        else{
           print("Email error")
        }
        
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

  

}
