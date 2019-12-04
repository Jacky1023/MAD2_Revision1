//
//  AccountController.swift
//  Revision1
//
//  Created by MAD2_P02 on 4/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AccountController{
    func AddAccount(newAccount:Account)
       {
           let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
           let context = appDelegate.persistentContainer.viewContext
                  
           let Accentity = NSEntityDescription.entity(forEntityName:"CDAccount", in: context)!
           
           let account = NSManagedObject(entity: Accentity, insertInto: context)
           account.setValue(newAccount.Email,forKeyPath: "email")
           account.setValue(newAccount.Password,forKeyPath: "password")
           
           do{
               try context.save()
           } catch let error as NSError {
               print("Could not save. \(error), \(error.userInfo)")
           }
       }
       
       func RetrieveAllAccount()->[Account]
       {
           var account:[NSManagedObject]=[]
           let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
           let context = appDelegate.persistentContainer.viewContext
           var accountList:[Account]=[]

           let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDAccount")
           do{
                account = try context.fetch(fetchRequest)
                
                for c in account{
                    let email = c.value(forKeyPath: "email") as? String
                    let password = c.value(forKeyPath: "password") as? String
                    accountList.append( Account(email: email!, password: password!))
                }
            } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            }
            return accountList
       }
}
