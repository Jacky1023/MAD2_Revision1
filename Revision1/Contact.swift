//
//  Contact.swift
//  Revision1
//
//  Created by MAD2_P02 on 5/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit

class Contact{
    
    var FirstName: String
    var LastName:String
    var Photo:UIImage
    var Telephone:String
    
    init(firstname:String,lastname:String,photo:UIImage,telephone:String) {
        FirstName = firstname
        LastName = lastname
        Photo = photo
        Telephone = telephone
    }
}
