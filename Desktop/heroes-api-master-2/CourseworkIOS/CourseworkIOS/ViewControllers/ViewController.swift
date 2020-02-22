//
//  ViewController.swift
//  CourseworkIOS
//
//  Created by Sasitha Dilshan on 2/6/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUicomponents()
    }
    
    func setupUicomponents(){
        Utilities.buttonStyles(btnLogin)
        Utilities.buttonStyles(btnSignUp)
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
//        Utilities.styleTextField(textfield)
    }


}

