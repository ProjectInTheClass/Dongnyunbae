//
//  DetailRestaurantInfoViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/09/26.
//

import UIKit
import GooglePlaces

class DetailRestaurantInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailInfoWindowDelegate {
    
    @IBOutlet weak var detailInfoTableView: UITableView!
    
    var previousInfoWindow = MapMarkerWindow()
    var detailInfoWindow = DetailInfoWindow()
    
    var top3MeokBTI = NSDictionary()
    
    var placesClient: GMSPlacesClient!
    var addressAndPhoneNumber: [String?] = ["address","phone"]
    var showingRestaurantPlaceID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        placesClient = GMSPlacesClient.shared()
        
        initializeDetailInfoWindow()
        
//        fetchAddressAndPhoneNumber { data in
//            DispatchQueue.main.async {
//                self.addressAndPhoneNumber = data
//            }
//        }
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [] 마커를 디테일뷰 위로 갈 수 있게끔 디테일뷰 들어올때 카메라 조정
        self.view.frame.origin.y += 300
        
//        fetchAddressAndPhoneNumber { data in
//            DispatchQueue.main.async {
//                self.addressAndPhoneNumber = data
//                self.detailInfoTableView.reloadData()
//            }
//        }
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
        detailInfoWindow.setButtonImage()
        detailInfoWindow.rankingLabel.text = convertRankingText(top3MeokBTI)
        // TODO: [] 사진을 detailView 띄우기 전에 로드하기 : 현재는 첫 infowindow에서 로드중
        detailInfoWindow.spotPhotos = previousInfoWindow.spotPhotos
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
//            cell.textLabel?.text = "address"
            cell.textLabel?.text = addressAndPhoneNumber[0]
            cell.imageView?.image = UIImage(systemName: "mappin.and.ellipse")
        case 1:
//            cell.textLabel?.text = "phonenumber"
            cell.textLabel?.text = addressAndPhoneNumber[1]
            cell.imageView?.image = UIImage(systemName: "phone.fill")
        default:
            print("oops..! something wrong!")
        }
        
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
    
//    func fetchAddressAndPhoneNumber(completion: @escaping ([String]) -> Void ) {
//        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.formattedAddress.rawValue) |
//          UInt(GMSPlaceField.phoneNumber.rawValue))!
//
//        print("showingRestaurantPlaceID : ", showingRestaurantPlaceID)
//
//        placesClient?.fetchPlace(fromPlaceID: showingRestaurantPlaceID, placeFields: fields, sessionToken: nil, callback: {
//          (place: GMSPlace?, error: Error?) in
//          if let error = error {
//            print("An error occurred: \(error.localizedDescription)")
//            return
//          }
//          if let place = place {
//              let addressAndPhoneNumberArray = [place.formattedAddress!, place.phoneNumber!]
//              completion(addressAndPhoneNumberArray)
//              print("address : ",place.formattedAddress!,"phone : " ,place.phoneNumber!)
//          }
//
//        })
//    }
    
    
    @objc func dismissDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didTapLikeButton(_ sender: Bool) {
        print("didTapLikeButton in DetailRestaurantInfoViewController")
//        let mapVC = self.controll as! MapViewController
//        mapVC.didTapLikeButton(sender)
    }
    
}


