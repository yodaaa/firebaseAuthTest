//
//  ViewController.swift
//  firebaseAuthTest
//
//  Created by yodaaa on 2018/06/29.
//  Copyright © 2018年 yodaaa. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //textfield keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.emailTextField.isFirstResponder) {
            self.emailTextField.resignFirstResponder()
        }
        if (self.passwordTextField.isFirstResponder) {
            self.passwordTextField.resignFirstResponder()
        }
    }

    @IBAction func CreateAccount(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error {
                print("Creating the user failed! \(error)")
                return
            }
            
            if let user = user {
                print("user : \(user.user) has been created successfully.")
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
            }
        }
    }
}

