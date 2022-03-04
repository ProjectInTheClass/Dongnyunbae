//
//  ViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/02/20.
//



import UIKit
import SafariServices
private let cellID = "Cell"

class ViewController: UIViewController {

    
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let myPageMenu = ["테스트 결과 모아보기", "관심 식당", "공지사항", "건의 및 문의","버전 관리"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    func configureUI(){
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(MyPageCell.self, forCellReuseIdentifier: cellID)
        
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
        
    }
    
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPageCell
        

        cell.menuLabel.text = myPageMenu[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
        switch indexPath.row{
        case 0:
            print("테스트 모아보기")
            let uvc = self.storyboard!.instantiateViewController(withIdentifier: "CollectionViewController")
           
           // uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical//
           // self.present(uvc, animated: true)
          
          //  let controller0 = CollectionViewController()
          navigationController?.pushViewController(uvc, animated: true)
                   
           
        case 1:
            
          print("관심 식당")
            
            
            
        case 2:
            print("공지사항")
            
            guard let url = URL(string: "https://projectintheclass.github.io/Dongnyunbae/") else{
                    return
                }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
            
        case 3:
            print("건의 및 문의")
            
           
        case 4:
            print("앱 버전 관리")
            
            let controller4 = VersionViewController()
            navigationController?.pushViewController(controller4, animated: true)
            
            
        default:
            print("wrong")
            
            
        }
        
    }else{
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
       
            
            
           
        
        
    }

}





