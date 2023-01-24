//
//  LoginViewController.swift
//  Task Test
//
//  Created by Ali Wicca on 21/01/2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var passwoerd: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func log(_ sender: Any) {
        guard let email = email.text?.trimmed ,!email.isEmpty else{return}
        guard let passwoerd = passwoerd.text ,!passwoerd.isEmpty else{return}
        serves.login(email: email, password: passwoerd) { (error : Error?, success : Bool) in

        }
    }
}

