//
//  HomeViewController.swift
//  CourseworkIOS
//
//  Created by Sasitha Dilshan on 2/12/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    func setupElements(){
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }


}
