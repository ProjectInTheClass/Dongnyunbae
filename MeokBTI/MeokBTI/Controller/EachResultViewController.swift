//
//  HomeViewController.swift
//  MeokBTI
//
//  Created by 강윤아 on 2022/03/04.
//

import UIKit

class EachResultViewController: UIViewController {
    @IBOutlet weak var meokBTIImageView: UIImageView!
    @IBOutlet weak var meokBTIShortDefinition: UILabel!
    @IBOutlet weak var meokBTILongDescrpition: UITextView!
    
    var selectedResult: MeokBTIResult! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meokBTIImageView.image = selectedResult.image
        meokBTIShortDefinition.text = selectedResult.title
        meokBTILongDescrpition.text = selectedResult.text
    }
}
