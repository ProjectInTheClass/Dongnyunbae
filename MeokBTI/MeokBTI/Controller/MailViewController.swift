
import MessageUI
import UIKit
import SafariServices

class MailViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "건의 및 문의"
        
        if MFMailComposeViewController.canSendMail(){
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Contact Us / Feedback")
            vc.setToRecipients(["MeokBTI@gmail.com"])
            vc.setMessageBody("<h3> 안녕하세요! 먹비티아이 개발자에게 질문이 있습니다. <h3>", isHTML: true)
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
