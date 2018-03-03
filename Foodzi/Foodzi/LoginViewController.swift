//
//  LoginViewController.swift
//  Foodzi
//
//  Created by Kelly Chen on 3/3/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
//    var userEmail = " "
//    var userPassword = " "
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didLogin(_ sender: UIButton) {
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        if(userEmail.isEmpty || userPassword.isEmpty) {
            //Display alert msg
            return;
        }
    }
    
//    func textFieldShouldReturn(_ textFieldA: UITextField, textFieldB: UITextField) -> Bool {
//        // Hide keyboard
//        textFieldA.resignFirstResponder()
//        textFieldB.resignFirstResponder()
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textFieldA: UITextField, textFieldB: UITextField) {
//        userEmail = textFieldA.text!
//        userPassword = textFieldB.text!
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
