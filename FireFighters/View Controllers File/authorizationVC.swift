//
//  authorizationVC.swift
//  FireFighters
//
//  Created by Павел on 19.01.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class authorizationVC: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var loginView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    @IBOutlet weak var authButtonStyle: UIButton!
    let offlineAuth = false
    let customClass = UICustomClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        passwordView.delegate = self
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
//        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
//            if user != nil{
//                self?.nextViewContr(nameVC: "MainStoryboard")
//            }
//        }
    }
    @IBAction func authorizationButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, error) in
            if error != nil {
                self?.alertAction(errors: error?.localizedDescription)
                return
            }
            if user != nil {
                self?.nextViewContr(nameVC: "MainStoryboard")
            }
        }
    }
    @IBAction func registrationButton(_ sender: Any) {
        nextViewContr(nameVC: "firstStoryBoards")
    }
    func nextViewContr(nameVC: String) {
        let Vc = UIStoryboard(name: nameVC, bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }

    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }

}
