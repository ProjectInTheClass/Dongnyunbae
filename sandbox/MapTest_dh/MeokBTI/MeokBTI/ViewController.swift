//
//  ViewController.swift
//  MeokBTI
//
//  Created by 박대호 on 2021/07/31.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    var authState: NMFAuthState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nmapFView = NMFMapView(frame: view.frame)
        view.addSubview(nmapFView)
    }


}

