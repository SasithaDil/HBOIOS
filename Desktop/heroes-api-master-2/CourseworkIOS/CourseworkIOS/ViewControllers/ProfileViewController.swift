//
//  ProfileViewController.swift
//  CourseworkIOS
//
//  Created by Sasitha Dilshan on 2/13/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    func setupElements(){
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    


}
