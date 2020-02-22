//
//  LoginViewController.swift
//  CourseworkIOS
//
//  Created by Sasitha Dilshan on 2/11/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    func setupElements(){
        lblError.alpha = 0
        
        Utilities.buttonStyles(btnLogin)
        Utilities.textFieldStyles(txtEmail)
        Utilities.textFieldStyles(txtPassword)
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func LOgin(_ sender: Any) {
        
      //  let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       // let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (result, error) in
            
            if error != nil{
                self.lblError.text = error!.localizedDescription
                self.lblError.alpha  = 1
            }
            else{
//                let homeViewController =  self.storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController
//
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
                
                self.performSegue(withIdentifier: "HomeVC", sender: nil)
            }
        }
    }
    
}
