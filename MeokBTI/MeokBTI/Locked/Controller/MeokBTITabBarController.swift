//
//  MeokBTITabBarController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/18.
//

import UIKit
import GoogleMaps

class MeokBTITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item) else { return }
//        print("tapbar idx: ",idx)
        
            if idx == 1 {
                
            print("It's me MapView")
            let vc = self.viewControllers![1] as! MapViewController
            // 맵뷰 함수호출
            vc.setDefaultCameraZoom()
            }
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if let segue = segue.destination as? MapViewController {
//            print("prepare and load")
//            segue.loadMapView()
    }
    
    

}
