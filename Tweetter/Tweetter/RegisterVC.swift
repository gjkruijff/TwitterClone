
//
//  ViewController.swift
//  Tweetter
//
//  Created by Geert-Jan Kruijff on 14/02/17.
//  Copyright © 2017 Geert-Jan Kruijff. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var firstnameTxt: UITextField!
    @IBOutlet weak var lastnameTxt: UITextField!
    

    // initialize VIPER classes
    let VIEW = View() // VIEW functions
    let PRES = Presenter() // PRESENTER functions
    var inputFields = [UITextField : String]() // Dictionary of fields in VIEW
    let INTR = Interactor() // INTERACTOR functions


    // first initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize VIEW structures
        inputFields = [
            usernameTxt  : "username",
            passwordTxt  : "password",
            emailTxt     : "email",
            firstnameTxt : "firstname",
            lastnameTxt  : "lastname"]
    } // end func

    // Trigger when the registration button gets clicked
    @IBAction func register_click(_ sender: Any) {
        if (PRES.inputFieldsEmpty(fields : inputFields))
        {
            // Request the VIEW to color the empty fields
            VIEW.colorEmptyFields(fields: inputFields)
            print("Sorry fields are considered empty")
            
        } else {
            // Register the user given the information from the individual fields
            INTR.registerUser(username: usernameTxt.text!,
                              password: passwordTxt.text!,
                              email: emailTxt.text!,
                              firstname: firstnameTxt.text!,
                              lastname: lastnameTxt.text!)
            
        }
    } // end register_click


















}

