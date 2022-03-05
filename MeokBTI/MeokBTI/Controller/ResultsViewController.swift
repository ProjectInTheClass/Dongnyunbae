//
//  ResultsViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit
import KakaoSDKLink
import KakaoSDKTemplate
import KakaoSDKCommon
import SafariServices

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    var resultTableView: ResultTableViewController!
    var meokBTI: MeokBTI!
    
    let user = User.shared
    
    var safariViewController : SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = false
        meokBTI = MeokBTI(rawValue: calculatePersonalityResult())
        print("Look! meokBTI :",meokBTI!)
        resultTableView = self.children[0] as? ResultTableViewController
        
        if User.loadFromFile().meokBTI == nil {
            user.meokBTI = meokBTI
            User.saveToFile(user: user)
            print("save MeokBTI success")
        } else {
            print("Stored MeokBTI :",User.loadFromFile().meokBTI!)
            print("still stored ID :",User.loadFromFile().id!)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultTableView.definitionLabel.text = "\(meokBTI.shortDefinition)\n\(meokBTI.meokBTI)"
        resultTableView.meokBTIImageView.image = UIImage(named: "\(meokBTI.meokBTI).png")
        resultTableView.shortDesriptionLabel.text = "\"\(meokBTI.shortDescription)\""
        resultTableView.descriptionLabel.text = meokBTI.longDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func calculatePersonalityResult() -> String {
        // 1차 수정 : 기존의 로직은 질문수에 영향을 받아 오류가 남 -> 질문수와 관련없이(but,질문갯수 홀수 필수) 값을 일정하게 뽑아낼 수 있게 변경
        // 2차 수정 : 한 쪽으로 답변이 쏠렸을 경우 기본값이 없기에 기존의 로직에서 오류 -> default 값을 지정해줌으로, 해당 답변이 안나와도 갯수 비교 가능

        var frequencyOfAnswers: [Character : Int] = ["A": 0, "B": 0, "C": 0, "D": 0, "E": 0, "F":0, "G": 0, "H": 0]
        let responseTypes = responses.map { $0.type.rawValue }

        // 1.타입들의 빈도수를 구함
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
    
        // 2.알파벳 순서로 정렬
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.key < pair2.key
        })
        
        // 3. 상반되는 타입 중 하나만 남김 (ex A,B -> A)
        var best4MeokType = [Character: Int]()
        for i in stride(from: 0, through: 6, by: 2) {
            if frequentAnswerSorted[i].value > frequentAnswerSorted[i+1].value {
                best4MeokType[frequentAnswerSorted[i].key] = frequentAnswerSorted[i].value
            } else {
                best4MeokType[frequentAnswerSorted[i+1].key] = frequentAnswerSorted[i+1].value
            }
        }
        
        // 4. 다시 알파벳 정렬
        let best4MeokTypeSorted = best4MeokType.sorted(by: <)
        
        print("frequentAnswerSorted",frequentAnswerSorted)
        print("Best4MeokTypeSorted",best4MeokTypeSorted)
        
        // 5. 정렬된 알파벳들을 하나에 문자(MeokBTI)로 만들어 줌.
        let rawMeokBTI = best4MeokTypeSorted.map { String($0.key) }.reduce("") { $0 + $1 }
        
        print("rawMeokBTI :",rawMeokBTI)
        return rawMeokBTI
        
    }
    
    func convertRefinedMeokBTI(rawMeokBTI: String) -> MeokBTI? {
        guard let refinedMeokBTI = MeokBTI(rawValue: rawMeokBTI) else { return nil }
        
        return refinedMeokBTI
    }
    
    @IBAction func shareImageTap(_ sender: UITapGestureRecognizer) {
        
    }
    
    
    @IBAction func shareResultKakaotalk(_ sender: Any) {
        print("Kakaotalk shared!")
        
        var meokBTIImageUrl: URL?
        let meokBTIImage = resultTableView.imageToShare
        
        // 이미지를 카카오 서버에 임시로 업로드
        LinkApi.shared.imageUpload(image: meokBTIImage) { [weak self] (imageUploadResult, error) in
            if let error = error {
                print(error)
            }
            else {
                print("imageUpload() success.")


                if let imageUploadResult = imageUploadResult {
                    meokBTIImageUrl = imageUploadResult.infos.original.url

                    print(meokBTIImageUrl)

                }


                let link = Link(webUrl: URL(string:"https://developers.kakao.com"),
                                mobileWebUrl: URL(string:"https://developers.kakao.com"))
                let appLink = Link(androidExecutionParams: ["key1": "value1", "key2": "value2"],
                                    iosExecutionParams: ["key1": "value1", "key2": "value2"])

                let button = Button(title: "앱으로 보기", link: appLink)
                let content = Content(title: "먹BTI",
                                        imageUrl: meokBTIImageUrl!,
                                        description: "당신의 식당취향도 알아보세요!",
                                        link: link)

                let feedTemplate = FeedTemplate(content: content, buttons: [button])
                let feedTemplateJsonData = try? SdkJSONEncoder.custom.encode(feedTemplate)
                let templateJsonObject = SdkUtils.toJsonObject(feedTemplateJsonData!)

                // 카카오톡 설치 여부 확인
                if LinkApi.isKakaoLinkAvailable() {
                    // 카카오톡으로 카카오링크 공유 가능
                    //메시지 템플릿 encode
                    if let feedTemplateJsonData = (try? SdkJSONEncoder.custom.encode(feedTemplate)) {

                    //생성한 메시지 템플릿 객체를 jsonObject로 변환
                        if let templateJsonObject = SdkUtils.toJsonObject(feedTemplateJsonData) {
                            LinkApi.shared.defaultLink(templateObject: templateJsonObject) {(linkResult, error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                                else {
                                    print("defaultLink(templateObject:templateJsonObject) success.")

                                    //do something
                                    guard let linkResult = linkResult else { return }
                                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                                }
                            }
                        }
                    }

                } else {
                    // 카카오톡 미설치: 웹 공유 사용 권장
                    // Custom WebView 또는 디폴트 브라우져 사용 가능
                    // 웹 공유 예시 코드
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject!) {
                        self!.safariViewController = SFSafariViewController(url: url)
                        self!.safariViewController?.modalTransitionStyle = .crossDissolve
                        self!.safariViewController?.modalPresentationStyle = .overCurrentContext
                        self!.present(self!.safariViewController!, animated: true) {
                            print("웹 present success")
                        }
                    }
                }
            }
        }

    }
    
    @IBAction func shareResultInstagramstory(_ sender: Any) {
        print("Instagram shared!")
        
        if let storyShareURL = URL(string: "instagram-stories://share") {
            
            if UIApplication.shared.canOpenURL(storyShareURL) {
                guard let imageData = resultTableView.imageToShare.pngData() else { return }
                
                let pasteboardItems : [String:Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor" : "#636e72",
                    "com.instagram.sharedSticker.backgroundBottomColor" : "#b2bec3"]
                // 사진 만료시간 잡아주기
                let pasteboardOptions = [ UIPasteboard.OptionsKey.expirationDate : Date().addingTimeInterval(300) ]
                
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storyShareURL, options: [:], completionHandler: nil)
            } else {
                let alert = UIAlertController(title: "알림", message: "인스타그램이 필요합니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func shareResultOthers(_ sender: Any) {
        print("share!")
        // [x] 결과화면 전체 캡처후 이미지 변환
//        var resultToShare = UIImage()
//        if let text = textField.text {
//            objectsToShare.append(text)
//            print("[INFO] textField's Text : ", text)
//        }
        
//        resultToShare = UIImage()
//        resultToShare = resultTableView.view.transformToImage()!
        let resultToShare = resultTableView.imageToShare
        let activityVC = UIActivityViewController(activityItems: [resultToShare], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        // 공유하기 기능 중 제외할 기능이 있을 때 사용
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    

}

// 12 problems, 3 : 3 : 3 : 3 ,  A : 2 B : 1 / C: 2 D: 1 / E: 1 F: 2 / G: 2 H: 1
// 100 problems . 25: 25: 25: 25 A : 13 B : 12 / C: 23 D: 1 / E: 11 F: 14 / G: 20 H: 5
