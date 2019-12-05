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
    var contactList:[Contact]=[]
   
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
    }
    override func viewDidAppear(_ animated: Bool){

         self.tableView.reloadData()
     }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtTelephone: UILabel!
    
    //override number of section = 1
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
         return contactList.count
     }
     
     override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
         
         let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
         
         let contact = contactList[indexPath.row]
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
