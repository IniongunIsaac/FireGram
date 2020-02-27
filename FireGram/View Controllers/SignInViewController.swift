//
//  ViewController.swift
//  FireGram
//
//  Created by Isaac Iniongun on 24/02/2020.
//  Copyright © 2020 Iniongun Group. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.backgroundColor = .clear
        emailTextfield.textColor = .white
        emailTextfield.tintColor = .white
        emailTextfield.borderStyle = .none
        emailTextfield.attributedPlaceholder = NSAttributedString(string: emailTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let emailBottomLayer = CALayer()
        emailBottomLayer.frame = CGRect(x: 0, y: 33, width: emailTextfield.frame.width, height: 0.6)
        emailBottomLayer.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextfield.layer.addSublayer(emailBottomLayer)
        
        passwordTextfield.backgroundColor = .clear
        passwordTextfield.textColor = .white
        passwordTextfield.tintColor = .white
        passwordTextfield.borderStyle = .none
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: passwordTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let passwordBottomLayer = CALayer()
        passwordBottomLayer.frame = CGRect(x: 0, y: 33, width: passwordTextfield.frame.width, height: 0.6)
        passwordBottomLayer.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        passwordTextfield.layer.addSublayer(passwordBottomLayer)
        
    }
    
    @IBAction func signinButtonTapped(_ sender: Any) {
    }
    
}

