//
//  ViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/02/20.
//



import UIKit

private let cellID = "Cell"

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let myPageMenu = ["내 동네 설정", "테스트 결과 모아보기", "관심 식당", "건의 및 문의"]
    
    
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
    
        tableView.register(UINib(nibName: "MyPageHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyPageHeaderView")
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

extension ViewController: UITableViewDelegate {
    
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
    }

}





