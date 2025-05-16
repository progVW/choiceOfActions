//
//  SecondViewController.swift
//  choiceOfActions
//
//  Created by Sergey Sukharev on 15.05.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var hideFirstButton: UIButton!
    @IBOutlet weak var hideSecondButton: UIButton!
    @IBOutlet weak var hideThirdButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second screen"
    }


    
    @IBAction func showAllAction(_ sender: Any) {
        firstImage.isHidden = false
        secondImage.isHidden = false
        thirdImage.isHidden = false
    }
    
    
    
    @IBAction func hideAndShowFirstAction(_ sender: Any) {
        firstImage.isHidden = !firstImage.isHidden
        
    }
    
    
    @IBAction func hideAndShowSecondAction(_ sender: Any) {
        secondImage.isHidden = !secondImage.isHidden
    }
    
    
    @IBAction func hideAndShowThirdAction(_ sender: Any) {
        thirdImage.isHidden = !thirdImage.isHidden
    }
}
