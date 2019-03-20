//
//  ViewController.swift
//  CommunalTable
//
//  Created by Rahul Bonnerjee on 3/19/19.
//  Copyright © 2019 Rahbjee. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        //TO DO:Form validation
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            //Check segmented control if it's set to "Sign In" or "Register"
            if isSignIn {
                //Sign in user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    if let u = user {
                        //User is found and go home
                        
                    } else {
                        //Check error & display
                    }
                }
            } else {
                //Register the user in Firebase
                Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                    if let r = result {
                        //User is registered & found, go to homescreen
                        self.performSegue(withIdentifier: "goHome", sender: self)
                    } else {
                        //Else error is thrown, display it
                    }
                }
            }
        }


    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        //Flip the Boolean variable
        isSignIn = !isSignIn
        
        //Check the bool and set the buttons and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            loginButton.setTitle("Log In", for: .normal)
        } else {
            signInLabel.text = "Register"
            loginButton.setTitle("Register", for: .normal)
        }
    }
    
    
}
