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
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var alreadyAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

