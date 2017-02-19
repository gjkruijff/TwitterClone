
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
        // if any of the fields is empty, create a red placeholder
        print("CLICK CLICK CLICK!!")
        
        
        if (PRES.inputFieldsEmpty(fields : inputFields))
        {
            // Request the VIEW to color the empty fields
            VIEW.colorEmptyFields(fields: inputFields)
            print("Sorry fields are considered empty")
            
        } else {
        
        
            // Set up the request
            // To get a secure connection, we need to edit info.plist
            // Add App Transport Security Settings, (+) Allow Arbitrary Loads > "Yes" 
            let url = URL(string: "http://localhost/Tweetter/TweetterBackend/register.php")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print("Request: \(request)")
            // Body for the request
            let body = "username=\(usernameTxt.text!)&password=\(passwordTxt.text!)&email=\(emailTxt.text!)&fullname=\(firstnameTxt.text!)%20\(lastnameTxt.text!)"
            request.httpBody = body.data(using: String.Encoding.utf8)
            
            print("Request: \(request)")
            print("RequestBody: \(request.httpBody)")
            //
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data:Data?, response: URLResponse?, error:Error?) in
                
                    if (error == nil) {
                        // send the request to the server
                        print("Going to send the request to the server")
                        // communicate back to UI
                        DispatchQueue.main.async(execute: {
                            do {
                                // let json = try JSONSerialization.JSONObjectWithData(data!,options: []) as NSDictionary
                                // get the JSON result
                                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
                                let json  = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                                // assign the JSON result
                                // if..then combination with try/catch
                                guard let parseJSON = json else {
                                    print ("Error while parsing JSON")
                                    return
                                }
                                // Get the ID from the JSON struct
                                let id = parseJSON["id"]
                                // if there is an ID then print the JSON
                                if (id != nil) {
                                    print(parseJSON)
                                } // end if
                            } catch {
                                print("Caught an error: \(error)")
                            }
                           
                        } )
                    } else {
                        print("Error in sending request: \(error)")
                    }
            // launch prepared session
            }).resume()
            
            
            
        }
    } // end register_click


















}

