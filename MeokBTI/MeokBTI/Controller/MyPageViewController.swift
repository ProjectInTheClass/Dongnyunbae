//
//  ViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/02/20.
//



import UIKit
import SafariServices

private let cellID = "Cell"

class MyPageViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .grouped)
    let user = User.loadFromFile()
    let myPageMenu =  ["테스트 결과 모아보기", "관심 식당", "공지사항", "건의 및 문의","버전 관리"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    func configureUI(){
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: cellID)
        
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
        tableView.register(UINib(nibName: "MyPageHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyPageHeaderView")
    }
    
    

}

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageTableViewCell
        

        cell.menuLabel.text = myPageMenu[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageHeaderView") as! MyPageHeaderView
        headerView.backgroundColor = .white
        headerView.layer.backgroundColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        headerView.meokBTIImageView.layer.cornerRadius = headerView.meokBTIImageView.frame.size.width / 2
        headerView.meokBTIImageView.layer.borderWidth = 1
        headerView.meokBTIImageView.layer.borderColor = CGColor(gray: 0.7, alpha: 1)
        headerView.meokBTIImageView.image = UIImage(named: User.shared.meokBTI!.meokBTI)
        headerView.meokBTILabel.text = User.shared.meokBTI!.meokBTI
        headerView.meokBTIShortDefinitionLabel.text = User.shared.meokBTI!.shortDefinition

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0{
        switch indexPath.row{
        case 0:
            print("테스트 모아보기")
            let uvc = self.storyboard!.instantiateViewController(withIdentifier: "CollectionViewController")
            navigationController?.pushViewController(uvc, animated: true)
                   
           
        case 1:
          let user = User.loadFromFile()
            print(user.meokBTI!)
          print("관심 식당")
            let uvc1 = self.storyboard!.instantiateViewController(withIdentifier: "LikeViewController")
            navigationController?.pushViewController(uvc1, animated: true)
             
            
            
        case 2:
            print("공지사항")
            
            guard let url = URL(string: "https://projectintheclass.github.io/Dongnyunbae/") else{
                    return
                }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
            
        case 3:
            print("건의 및 문의")
            let uvc3 = self.storyboard!.instantiateViewController(withIdentifier: "MailViewController")
            navigationController?.pushViewController(uvc3, animated: true)
            
           
        case 4:
            print("앱 버전 관리")
            
            let uvc4 = self.storyboard!.instantiateViewController(withIdentifier: "VersionViewController")
            navigationController?.pushViewController(uvc4, animated: true)
            
        default:
            print("wrong")

        }
    } else {
        }
    }
}





