//
//  Presenter.swift
//  Tweetter
//
//  Main PRESENTER class, to modularize different levels of functionality
//
//
//  Created by Geert-Jan Kruijff on 15/02/17.
//  Copyright © 2017 Geert-Jan Kruijff. All rights reserved.
//

import Foundation
import UIKit

class Presenter {

    // PRESENTER
    // Check whether any of the fields are empty
    func inputFieldsEmpty (fields : [UITextField : String]) ->  Bool {
        var thereIsAnEmptyInput = false
        for (field, placeholder) in fields {
            if inputFieldEmpty(field : field, placeholder : placeholder) { thereIsAnEmptyInput = true }
        } // end for
        return thereIsAnEmptyInput
    } // end inputFieldsEmpty

    // Check whether a specific field is empty
    func inputFieldEmpty (field : UITextField, placeholder : String) -> Bool {
        let fieldEmpty = field.text!.isEmpty || field.text! == placeholder
        return fieldEmpty
    } // end check individual field empty

} // end class
