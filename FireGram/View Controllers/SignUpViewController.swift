//
//  SignUpViewController.swift
//  FireGram
//
//  Created by Isaac Iniongun on 24/02/2020.
//  Copyright © 2020 Iniongun Group. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.backgroundColor = .clear
        usernameTextField.textColor = .white
        usernameTextField.tintColor = .white
        usernameTextField.borderStyle = .none
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let usernameBottomLayer = CALayer()
        usernameBottomLayer.frame = CGRect(x: 0, y: 29, width: usernameTextField.frame.width, height: 0.6)
        usernameBottomLayer.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        usernameTextField.layer.addSublayer(usernameBottomLayer)
        
        emailTextfield.backgroundColor = .clear
        emailTextfield.textColor = .white
        emailTextfield.tintColor = .white
        emailTextfield.borderStyle = .none
        emailTextfield.attributedPlaceholder = NSAttributedString(string: emailTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let emailBottomLayer = CALayer()
        emailBottomLayer.frame = CGRect(x: 0, y: 29, width: emailTextfield.frame.width, height: 0.6)
        emailBottomLayer.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextfield.layer.addSublayer(emailBottomLayer)
        
        passwordTextfield.backgroundColor = .clear
        passwordTextfield.textColor = .white
        passwordTextfield.tintColor = .white
        passwordTextfield.borderStyle = .none
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: passwordTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let passwordBottomLayer = CALayer()
        passwordBottomLayer.frame = CGRect(x: 0, y: 29, width: passwordTextfield.frame.width, height: 0.6)
        passwordBottomLayer.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        passwordTextfield.layer.addSublayer(passwordBottomLayer)
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2.0
        profileImageView.clipsToBounds = true
    
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
            if error != nil {
                debugPrint("An error occurred: \(error!.localizedDescription)")
                return
            }
            let ref = Database.database().reference()
            let usersRef = ref.child("users")
            let uid = authResult!.user.uid
            let newUserRef = usersRef.child(uid)
            newUserRef.setValue(["username": self.usernameTextField.text!, "email": self.emailTextfield.text!])
            
        }
    }
    
}
