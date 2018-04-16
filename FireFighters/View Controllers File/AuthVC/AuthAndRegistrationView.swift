//
//  AuthAndRegistrationView.swift
//  FireFighters
//
//  Created by Павел on 17.03.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import CoreGraphics
class AuthAndRegistrationView: UIViewController {
    let customClass = UICustomClass()

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont(name: "signpainter-housescript", size: 47)
        }
    }
    @IBOutlet weak var authorizationButton: UIButton! {
        didSet {
            authorizationButton.layer.cornerRadius = authorizationButton.frame.height / 2
            authorizationButton.setTitle("Войти", for: .normal)
            authorizationButton.setTitleColor(UIColor.black, for: .normal)
            authorizationButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var registrationButton: UIButton!{
        didSet {
            registrationButton.backgroundColor = UIColor.clear
            registrationButton.layer.borderWidth = 2
            registrationButton.layer.borderColor = UIColor.gray.cgColor
            registrationButton.layer.cornerRadius = 35
            registrationButton.setTitle("Зарегистрироваться", for: .normal)
        }
    }
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            buttonGardients.startPoint = CGPoint(x: 0, y: 0)
            buttonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    var imageView: UIImage = UIImage(named: "launchScreen")!

    override func viewDidLoad() {
        super.viewDidLoad()
        authorizationButton.layer.cornerRadius = authorizationButton.frame.height / 2
        registrationButton.layer.cornerRadius = registrationButton.frame.size.height / 2
        authorizationButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 70)
        registrationButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 70)
        self.view.insertSubview(customClass.backgraundView(), at: 0)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: authorizationButton.frame.size.width, height: authorizationButton.frame.size.height)
        authorizationButton.layer.insertSublayer(buttonGardients, at: 0)
        print("x\(view.frame.width) x/2\(view.frame.width / 2)")
        print("y\(view.frame.height)")
    }


    @IBAction func registrationButton(_ sender: Any) {
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
