//
//  LoginPassVC.swift
//  FireFighters
//
//  Created by Павел on 19.01.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import Firebase

class LoginPassVC: UIViewController {
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var viewPass: UIButton!
    @IBOutlet weak var infoPass: UIButton!
    @IBOutlet weak var infoLogin: UIButton!
    @IBOutlet weak var customButton: UIButton!
    
    let customClass = UICustomClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        customClass.CustomButton(nameBut: "Далее", buttons: customButton)
        
    }
    @IBAction func createUsers(_ sender: Any) {
        Auth.auth().createUser(withEmail: createLogin.text!, password: createPassw.text!) {(user, error) in
            if error == nil {
                if user != nil{
                    print(1)
                } else {
                    print(2)
                }
            } else {
                print(3)
            }
        }
    }
}
