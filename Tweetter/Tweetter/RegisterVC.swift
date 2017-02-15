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
    let PRES = Presenter() // Presenter functions
    var inputFields = [UITextField : String]() // Dictionary of fields
    
    
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
        
    }

    // Trigger when the registration button gets clicked
    @IBAction func register_click(_ sender: Any) {
        // if any of the fields is empty, create a red placeholder
        if (PRES.inputFieldsEmpty(fields : inputFields))
        {
            VIEW_colorEmptyFields()
        } else {
            // let's add a lot of INTERACTOR application logic 
            // (long live VIPER-style modularization ... )
        }
    } // end register_click













    // VIEW 
    // Color any field that is empty
    // At the moment everything gets colored -- pretty dumb
    func VIEW_colorEmptyFields () {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName:UIColor.red])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName:UIColor.red])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSForegroundColorAttributeName:UIColor.red])
        firstnameTxt.attributedPlaceholder = NSAttributedString(string: "firstname", attributes: [NSForegroundColorAttributeName:UIColor.red])
        lastnameTxt.attributedPlaceholder = NSAttributedString(string: "lastname", attributes: [NSForegroundColorAttributeName:UIColor.red])
    }





}

