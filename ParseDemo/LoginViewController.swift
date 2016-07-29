//
//  ViewController.swift
//  ParseDemo
//
//  Created by Rajiv Deshmukh on 7/28/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpAction(sender: AnyObject) {
        
        var newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextFiled.text
        newUser.email = emailTextField.text
        
        newUser.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.usernameTextField.text
        var password = self.passwordTextFiled.text
           
            PFUser.logInWithUsernameInBackground(username!, password: password!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    self.performSegueWithIdentifier("loginIdentifier", sender: self)

                } else {
                    // The login failed. Check error to see why.
                }
        }
    }

}

