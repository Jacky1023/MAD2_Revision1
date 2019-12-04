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

class ShowAccountViewController : UITableViewController{
    var accountList:[Account]=[]
    var accountController:AccountController = AccountController()

    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
    }
    override func viewDidAppear(_ animated: Bool){
         let accountController = AccountController()
        accountList = accountController.RetrieveAllAccount();
         self.tableView.reloadData()
     }
     
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int{
         return accountList.count
     }
     
     override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
         
         let cell = self.tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath)
         
         let account = accountList[indexPath.row]
        cell.textLabel!.text = "\(account.Email) "
        cell.detailTextLabel!.text = "\(account.Password)"

         
         return cell
     }
     
     /*Exercise 2*/
     //delete the row selected
      override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         print(accountList.count)
         print(indexPath.row)
         if editingStyle == UITableViewCell.EditingStyle.delete{
            accountList.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.middle)

        }

    }
     
}
