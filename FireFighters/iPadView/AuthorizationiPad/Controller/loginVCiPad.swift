//
//  loginVC.swift
//  FireFighters
//
//  Created by Павел on 30/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MBProgressHUD

class loginVCiPad: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var appNameLabel: UILabel! {
        didSet {
            appNameLabel.text = "Огнеборцы"
        }
    }
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authButtonStyle: UIButton!
    
    var loginLine = CAShapeLayer()
    var passwordLine = CAShapeLayer()
    var buttonGardients = CAGradientLayer()
    
    var userInfo = UserProfile.userInform
    let receivingData = loadFirebaseData()
    
    override func viewDidLayoutSubviews() {
        appNameLabel.LoginLabel(viewHeight: Double(view.bounds.height))
        buttonGardients.gardientButton(w: authButtonStyle.frame.size.width, h: authButtonStyle.frame.size.height)
        authButtonStyle.grayButton(nameBut: "Авторизироваться")
        authButtonStyle.layer.insertSublayer(buttonGardients, at: 0)
        //Прорисовка линий в поле ввода текста
        loginLine.layerLine(strokeColors: UIColor.gray.cgColor)
        passwordLine.layerLine(strokeColors: UIColor.gray.cgColor)
        loginField.lineToTextField(shape: loginLine)
        passwordField.lineToTextField(shape: passwordLine)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
        passwordField.delegate = self
        title = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func chekingAndAuthButton(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
