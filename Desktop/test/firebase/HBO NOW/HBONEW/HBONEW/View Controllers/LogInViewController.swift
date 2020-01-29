//
//  ViewController.swift
//  HBONEW
//
//  Created by Sasitha Dilshan on 1/28/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: NSLayoutConstraint!
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   navigationController?.navigationBar.barTintColor = UIColor.black
        
        setupElements()
    }

    @IBAction func Login(_ sender: Any) {
    }
    func setupElements(){
        ErrorLabel.alpha = 0
    }
    
}

