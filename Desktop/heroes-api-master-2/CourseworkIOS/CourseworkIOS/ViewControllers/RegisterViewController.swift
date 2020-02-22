//
//  RegisterViewController.swift
//  CourseworkIOS
//
//  Created by Sasitha Dilshan on 2/12/20.
//  Copyright © 2020 Sasitha Dilshan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtFname: UITextField!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        uploadProfilePic()
    }
    func setUpElements(){
        lblError.alpha = 0
        
        Utilities.textFieldStyles(txtFname)
        Utilities.textFieldStyles(txtLname)
        Utilities.textFieldStyles(txtEmail)
        Utilities.textFieldStyles(txtContact)
        Utilities.textFieldStyles(txtPassword)
        Utilities.textFieldStyles(txtConfirmPassword)
        Utilities.buttonStyles(btnRegister)
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    func validateFields() -> String?{
        
        if txtFname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtLname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtContact.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Fill in all fields."
        }
        
        let cleanPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanPassword) == false {
            return"please make sure your passwoed is atleast 8 characters, containd a special characters and a number"
        }
        
        return nil
    }
    
    
    
    @IBAction func Register(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else{
            
            let firstName = txtFname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = txtLname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let contact = txtContact.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
           
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                
                if err != nil{
                    self.showError("Error creating user.")
                }
                else{
                    let db = Firestore.firestore()
                    
                    let storageRef = Storage.storage().reference(forURL: "gs://coursework-ios-730cb.appspot.com/profilePics").child("profile_image").child(result!.user.uid)
                    if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1){
                        storageRef.putData(imageData, metadata: nil, completion: { (metadata, error ) in
                            if error != nil{
                                self.showError("Error in uploading profile photo.")
                            }
//                            let profileImgURL = metadata?.size
//                            storageRef.downloadURL(completion: { (profileImgURL, err) in
//                                guard profileImgURL != nil else{
//                                    return
//                                }
//                            })
                            
                        })
                    }
                    
                    db.collection("users").addDocument(data: ["FirstName" : firstName, "LastName": lastName,"Email": email,"ContactNumber": contact, "uid":  result!.user.uid]) { (error) in
                        
                        if  error != nil{
                            self.showError("Error saving user data")
                        }
                    }
                    self.transitionToHome()
                    
                }
            }
        }
    }
    
    
    func showError(_ message:String){
        
        lblError.text = message
        lblError.alpha = 1
    }
    func transitionToHome(){
        
//        let homeViewController =  storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController
//
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
        
        self.performSegue(withIdentifier: "HomeVC", sender: nil)
    }
    
    func uploadProfilePic(){
        
        profileImage.layer.cornerRadius = 10
        profileImage.clipsToBounds = true
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGuesture)
        profileImage.isUserInteractionEnabled = true
    }
    @objc func handleSelectProfileImageView(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
}
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       if let image = info[.originalImage] as? UIImage {
            selectedImage = image
           profileImage.image = image
        }
        print(info)

        dismiss(animated: true, completion: nil)
    }
}
