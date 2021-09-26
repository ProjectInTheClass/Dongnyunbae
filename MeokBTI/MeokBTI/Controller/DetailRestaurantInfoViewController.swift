//
//  DetailRestaurantInfoViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/09/26.
//

import UIKit

class DetailRestaurantInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailInfoWindowDelegate {

    var previousInfoWindow = MapMarkerWindow()
    var detailInfoWindow = DetailInfoWindow()
    
    var top3MeokBTI = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDetailInfoWindow()

        // Do any additional setup after loading the view.
    }
    
    func loadNiB() -> DetailInfoWindow {
        let detailInfoWindow = DetailInfoWindow.instanceFromNib() as! DetailInfoWindow
        return detailInfoWindow
    }
    
    func initializeDetailInfoWindow() {
        self.detailInfoWindow = loadNiB()
        detailInfoWindow.initCollectionView()
        
        detailInfoWindow.delegate = self
        detailInfoWindow.layer.cornerRadius = 15
        
        detailInfoWindow.nameLabel.text = previousInfoWindow.nameLabel.text
        detailInfoWindow.setButtonImage(previousInfoWindow.buttonTapped)
        detailInfoWindow.rankingLabel.text = convertRankingText(top3MeokBTI)
        // MARK: [] 사진을 detailView 띄우기 전에 로드하기 : 현재는 첫 infowindow에서 로드중
        detailInfoWindow.spotPhotos = previousInfoWindow.spotPhotos
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hi"
        cell.imageView?.image = UIImage(systemName: "mappin.and.ellipse")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tempView = UIStackView()
        tempView.axis = .horizontal
        
        let dismissButton = UIButton()
        dismissButton.addTarget(self, action: #selector(dismissDetailView), for: .touchUpInside)
        dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        let tempLabel = UILabel()
        tempLabel.text = "hey! Im headerView"
        
        tempView.addArrangedSubview(dismissButton)
        tempView.addArrangedSubview(tempLabel)
        tempView.distribution = .fillProportionally
        
        let tempView2 = UIStackView()
        tempView2.axis = .vertical
        
        let paddingView = UILabel()
        paddingView.text = "\n\n"
        tempView2.addArrangedSubview(tempView)
        tempView2.addArrangedSubview(detailInfoWindow)
        tempView2.addArrangedSubview(paddingView)
        
        return tempView2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let padding = detailInfoWindow.frame.height
        return 20 + padding
    }
    
    func convertRankingText(_ top3MeokBTI: NSDictionary) -> String {
        var totalRankText = ""
        for (idx, meokBTI) in top3MeokBTI.enumerated() {
            
            var medal: String
            
            switch idx {
            case 0:
                medal = Ranking.first.medal
                
            case 1:
                medal = Ranking.second.medal
                
            case 2:
                medal = Ranking.third.medal

            default:
                print("Not a medalist more")
                return ""
            }
            
            let eachRankText = "\(medal)\(meokBTI.key) \(meokBTI.value)명이 식당을 좋아합니다.\n"
            totalRankText += eachRankText
        }
        
        return totalRankText
    }
    
    @objc func dismissDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didTapLikeButton(_ sender: Bool) {
        print("didTapLikeButton in DetailRestaurantInfoViewController")
//        let mapVC = self.controll as! MapViewController
//        mapVC.didTapLikeButton(sender)
    }
    
}
