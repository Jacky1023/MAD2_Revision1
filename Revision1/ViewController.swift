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
        
        var accountList:[NSManagedObject]=[]
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDAccount")
        do{
            accountList = try context.fetch(fetchRequest)
            
            for a in accountList{
                let email = a.value(forKey: "email")as? String
                let pwd = a.value(forKey: "password") as? String
                print("\(email),\(pwd)")
            }
        }catch let error as NSError{
            print("Could not fetch.\(error),")
        }
            if true{
                
                let storyboard = UIStoryboard(name: "Content", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "grnavcontroller") as UIViewController
                vc.modalPresentationStyle = .fullScreen // try without fullscreen
                present(vc,animated: true,completion: nil)
            }
         
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

