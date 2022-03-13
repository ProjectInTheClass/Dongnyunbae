//
//  MeokBTITabBarController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/08/18.
//

import UIKit
import GoogleMaps

class MeokBTITabBarController: UITabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item) else { return }
        
        if idx == 1 {
            let vc = self.viewControllers![1] as! MapViewController
            // 맵뷰 함수호출
            vc.setDefaultCameraZoom()
        }
    }
}
