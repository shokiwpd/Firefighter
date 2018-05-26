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
            nameLabel.font = UIFont(name: "signpainter-housescript", size: 47)
        }
    }
    @IBOutlet weak var authorizationButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    //MARK: Гардиент
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.gradientsColor()
        }
    }
    //MARK: Лайауты,фон
    override func viewDidLayoutSubviews() {
        authorizationButton.customButtonColor(radius: 10, nameBut: "Войти", titleColor: .black, shadowColors: UIColor.black.cgColor)
        registrationButton.customButtonClear(buttonColor: .clear, radius: 10, borderColors: UIColor.gray.cgColor, shadowColors: UIColor.black.cgColor, nameBut: "Зарегистрироваться")
        self.view.insertSubview(view.backgraundView(), at: 0)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: authorizationButton.frame.size.width, height: authorizationButton.frame.size.height)
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
