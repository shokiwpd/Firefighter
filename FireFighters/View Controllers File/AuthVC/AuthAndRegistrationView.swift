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
    //MARK: кастомные классы
    let customClass = UICustomClass()
    //MARK: Оутлеты и их настройки
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont(name: "signpainter-housescript", size: nameLabel.font.pointSize)
            nameLabel.text = "Огнеборцы"
            print(nameLabel.font.pointSize)
        }
    }
    @IBOutlet weak var authorizationButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    //MARK: Гардиент
    var buttonGardients = CAGradientLayer()
    //MARK: Лайауты,фон
    override func viewDidLayoutSubviews() {
        authorizationButton.customButtonColor(radius: authorizationButton.bounds.height / 2, nameBut: "Войти", titleColor: .black, shadowColors: UIColor.black.cgColor)
        registrationButton.customButtonClear(buttonColor: .clear, radius: 25, borderColors: UIColor.gray.cgColor, shadowColors: UIColor.black.cgColor, nameBut: "Регистрация")
        self.view.insertSubview(view.backgraundView(), at: 0)
        buttonGardients.gardientButton(w: authorizationButton.frame.size.width, h: authorizationButton.frame.size.height)
        authorizationButton.layer.insertSublayer(buttonGardients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: Переход на другой сториборд
    @IBAction func registrationButton(_ sender: Any) {
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
