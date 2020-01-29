//
//  RegisterViewController.swift
//  HBONEW
//
//  Created by Sasitha Dilshan on 1/29/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var FnameText: UITextField!
    @IBOutlet weak var LnameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var ConfirmPasswordText: UITextField!
    @IBOutlet weak var ZipCodeText: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func SignUp(_ sender: Any) {
    }
}
