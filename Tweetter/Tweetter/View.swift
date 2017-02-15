//
//  View.swift
//  Tweetter
//
//  Main VIEW class, to modularize different levels of functionality

//  Created by Geert-Jan Kruijff on 15/02/17.
//  Copyright © 2017 Geert-Jan Kruijff. All rights reserved.
//

import Foundation
import UIKit

class View {

    // Color any field that is empty
    // At the moment everything gets colored -- pretty dumb
    func colorEmptyFields (fields : [UITextField : String]) {
        for (field, placeholder) in fields {
            if (field.text! == placeholder || field.text!.isEmpty) {
                field.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [ NSForegroundColorAttributeName: UIColor.red])
                
            } // end if
        } // end for
    } // end func

} // end class
