//
//  LoginViewController.swift
//  
//
//  Created by Alexander Chen on 3/2/18.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorTextView: UITextView!
    
    var isSignIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        errorTextView.backgroundColor = UIColor.white.withAlphaComponent(0)
        errorTextView.text = ""
        
        isSignIn = !isSignIn
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            if isSignIn {
                // sign in user
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    // check that user is not nil
                    if user != nil {
                        // user is valid, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else {
                        // error
                        print("Error from sign in.")
                        self.errorTextView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
                        self.errorTextView.text = "Invalid email or password."
                    }
                })
            }
            else {
                // register user
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    // check that user is not nil
                    if user != nil {
                        // user is valid, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else {
                        // error
                        print("Error from registration.")
                        print(error)
                        self.errorTextView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
                        self.errorTextView.text = "Email already registered."
                    }
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}
