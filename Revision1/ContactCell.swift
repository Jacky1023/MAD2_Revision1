//
//  ContactCell.swift
//  Revision1
//
//  Created by MAD2_P02 on 5/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit

class ContactCell : UITableViewCell{
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var NameFld: UITextView!
    
    @IBOutlet weak var MessageFld: UITextField!
    
    func setContact(contact:Contact){
        image.image=contact.image
        NameFld.text = contact.title
    }
    
    
}
