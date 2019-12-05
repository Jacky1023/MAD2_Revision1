//
//  ViewController.swift
//  Revision1
//
//  Created by MAD2_P02 on 3/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func Loginbtn(_ sender: Any) {
        
        var account:[NSManagedObject]=[]
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        appDelegate.StoreTestAccount()
                   
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDAccount")
//        fetchRequest.predicate = NSPredicate (format: "email == %@", Email)
        do{
            account = try context.fetch(fetchRequest)
                       
            for a in account{
                let email = a.value(forKey: "email")as? String
                let pwd = a.value(forKey: "password") as? String
                
                if(txtEmail.text == email && txtPassword.text == pwd){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "grnavcontroller")
                    present(vc!,animated: true,completion: nil)
                }
            }
         }catch let error as NSError{
            print("Could not get email and password.\(error),")
        }
  
       
                
        
            
         
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

