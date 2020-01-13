//
//  ViewController.swift
//  HBO
//
//  Created by Sasitha Dilshan on 1/6/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textEmail.layer.cornerRadius = 10.0
        textEmail.clipsToBounds = true
        textEmail.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner ]
        
//        textPassword.layer.cornerRadius = 10.0
//        textPassword.clipsToBounds = true
//        textPassword.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner ]
    }


}

