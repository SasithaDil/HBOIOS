//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func textFieldStyles(_ textfield:UITextField) {
        

        let bottomLine = CALayer()

        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)

        bottomLine.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 51/255, alpha: 1).cgColor

        textfield.borderStyle = .none

        textfield.layer.addSublayer(bottomLine)
        textfield.layer.cornerRadius = 10
        textfield.tintColor = UIColor.gray
        
       
        
    }
    
    static func buttonStyles(_ button:UIButton) {
        
        button.backgroundColor = UIColor.init(red: 42/255, green: 157/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.white
        
        
    }
    

    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
