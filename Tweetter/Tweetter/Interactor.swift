//
//  Interactor.swift
//  Tweetter
//
//  Created by Geert-Jan Kruijff on 15/02/17.
//  Copyright © 2017 Geert-Jan Kruijff. All rights reserved.
//

import Foundation

class Interactor {

    func registerUser (username: String, password: String, email: String, firstname: String, lastname: String) {
            // Set up the request
            // To get a secure connection, we need to edit info.plist
            // Add App Transport Security Settings, (+) Allow Arbitrary Loads > "Yes" 
            let url = URL(string: "http://localhost/Tweetter/TweetterBackend/register.php")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // Body for the request
            let body = "username=\(username)&password=\(password)&email=\(email)&fullname=\(firstname)%20\(lastname)"
            request.httpBody = body.data(using: String.Encoding.utf8)
            // Set up the URL session to post the user profile data, and get the response
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data:Data?, response: URLResponse?, error:Error?) in
                
                    if (error == nil) {
                        // dispatch the request to the server and get the response
                        DispatchQueue.main.async(execute: {
                            do {
                                // let json = try JSONSerialization.JSONObjectWithData(data!,options: []) as NSDictionary
                                // get the JSON result
                                // print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
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
    } // end func 

} // end class
