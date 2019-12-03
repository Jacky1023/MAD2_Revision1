//
//  ViewController.swift
//  Revision1
//
//  Created by MAD2_P02 on 3/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func Loginbtn(_ sender: Any) {
        if true{
                  
                  let storyboard = UIStoryboard(name: "Content", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
                  vc.modalPresentationStyle = .fullScreen // try without fullscreen
                  present(vc,animated: true,completion: nil)
              }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

