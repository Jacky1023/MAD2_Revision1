//
//  ShowAccountViewController.swift
//  Revision1
//
//  Created by MAD2_P02 on 3/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GRTableViewController : UITableViewController{
    var contacts:[Contact]=[]
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
    }
    override func viewDidAppear(_ animated: Bool){

         self.tableView.reloadData()
     }

    func createArray()->[Contact]{
        var contactList:[Contact] = []
        
        let contact1 = Contact(firstname: "Alan", lastname: "hayes", photo: alanhayes, telephone: "88221122")
        let contact2 = Contact(firstname: "Jean", lastname: "Yip", photo: jeanyip, telephone: "55115522")
        
        contactList.append(contact1)
        contactList.append(contact2)
        return contactList
    }
   
    
    //override number of section = 1
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
         return contacts.count
     }
     
     override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
         
         let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
         
         let contact = contacts[indexPath.row]
        cell.textLabel!.text = "\(contact.FirstName)\(contact.LastName)\(contact.Photo) "
        cell.detailTextLabel!.text = "\(contact.Telephone)"

         
         return cell
     }
     
     /*Exercise 2*/
     //delete the row selected
      override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(contactList.count)
         print(indexPath.row)
         if editingStyle == UITableViewCell.EditingStyle.delete{
            contactList.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.middle)

        }

    }
     
}
