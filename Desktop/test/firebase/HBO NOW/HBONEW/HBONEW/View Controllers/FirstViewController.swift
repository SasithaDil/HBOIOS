//
//  FirstViewController.swift
//  HBONEW
//
//  Created by Sasitha Dilshan on 1/29/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupElements()
    }
    
    func setupElements(){
        Utilities.styleFilledButton(LoginButton)
        Utilities.styleFilledButton(SignUpButton)
    }

   

}
