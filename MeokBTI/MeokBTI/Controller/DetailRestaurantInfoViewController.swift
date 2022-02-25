//
//  DetailRestaurantInfoViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/09/26.
//

import UIKit
import GooglePlaces

class DetailRestaurantInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailInfoTableView: UITableView!
    var dismissButton: UIButton!
    var paddingView: UILabel!
    var verticalStackView: UIStackView!
    
    let user = User.shared
    
    var previousInfoWindow = MapMarkerWindow()
    var detailInfoWindow = DetailInfoWindow()
    var likeButtonTapped = Bool()
    var showingRestaurant: Restaurant!
    
    var top3MeokBTI = NSDictionary()
    
    var placesClient: GMSPlacesClient!
    var addressAndPhoneNumber = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: 마커를 디테일뷰 위로 갈 수 있게끔 디테일뷰 들어올때 카메라 조정
        let deviceHeight = view.frame.height
        let se1Height: CGFloat = 528.0
        if deviceHeight > se1Height {
            self.view.frame.origin.y += deviceHeight * 0.4
        }
        
    }
    
    func loadNiB() -> DetailInfoWindow {
        let detailInfoWindow = DetailInfoWindow.instanceFromNib() as! DetailInfoWindow
        return detailInfoWindow
    }
    
    func configureUI() {
        makeVerticalStackView()
        makeDismissButton()
        configureDetailInfoWindow()
        makePaddingView()
    }
    
    func makeVerticalStackView() {
        verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
    }
    
    func makeDismissButton() {
        dismissButton = UIButton()
        dismissButton.addTarget(self, action: #selector(dismissDetailView), for: .touchUpInside)
        dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    
    func makePaddingView() {
        paddingView = UILabel()
        paddingView.text = "\n\n\n"
    }
    
    func configureDetailInfoWindow() {
        self.detailInfoWindow = loadNiB()
        detailInfoWindow.initCollectionView()
        
        detailInfoWindow.layer.cornerRadius = 15
        
        detailInfoWindow.nameLabel.text = previousInfoWindow.nameLabel.text
        detailInfoWindow.rankingLabel.text = convertRankingText(top3MeokBTI)
        // TODO: [] 사진을 detailView 띄우기 전에 로드하기 : 현재는 첫 infowindow에서 로드중
        detailInfoWindow.spotPhotos = previousInfoWindow.spotPhotos
        
    }
    
    func initializeHeaderView() {
        verticalStackView.addArrangedSubview(dismissButton)
        verticalStackView.addArrangedSubview(detailInfoWindow)
        verticalStackView.addArrangedSubview(paddingView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = addressAndPhoneNumber[0]
            cell.imageView?.image = UIImage(systemName: "mappin.and.ellipse")
            
        case 1:
            cell.textLabel?.text = addressAndPhoneNumber[1].pretty()
            cell.imageView?.image = UIImage(systemName: "phone.fill")
            
        default:
            print("oops..! something wrong!")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = verticalStackView
        initializeHeaderView()
        
        return headerView
    }
    
    func getHeaderView() {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let padding = detailInfoWindow.frame.height
        return 50 + padding
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
}


