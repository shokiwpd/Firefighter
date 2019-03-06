//
//  AuthAndRegistrationView.swift
//  FireFighters
//
//  Created by Павел on 17.03.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class AuthAndRegistrationView: UIViewController {
    //MARK: Оутлеты и их настройки
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "Огнеборцы" // Название приложения
        }
    }
    @IBOutlet weak var authorizationButton: UIButton! // Кнопка авторизации
    @IBOutlet weak var registrationButton: UIButton! //Кнопка регистрации
    //MARK: Гардиент
    var buttonGardients = CAGradientLayer()//Гардиент
    //MARK: Лайауты,фон
    override func viewDidLayoutSubviews() {
        //MARK: Настройка внешнего вида кнопок
        authorizationButton.grayButton(nameBut: "Войти")
        registrationButton.clearButton(nameBut: "Регистрация")
        nameLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        //MARK: Фон без эффекта размытия
        let userDef = UserDefaults.standard.bool(forKey: "DarkMode")
        self.view.insertSubview(view.backgraundView(blur: false, darkMode: userDef), at: 0)
        //MARK: гардиент для кнопок
        buttonGardients.gardientButton(w: authorizationButton.frame.size.width, h: authorizationButton.frame.size.height)
        authorizationButton.layer.insertSublayer(buttonGardients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("iPhoneHeight \(view.bounds.height)")
    }
    //Кнопа на случай если возникли ошибки
    @IBAction func VKgroupURL(_ sender: Any) {
        let URL_VK = URL(string: "https://vk.com/firefighterapp")
        UIApplication.shared.open(URL_VK!)
    }
    
    //MARK: Переход на другой сториборд
    @IBAction func registrationButton(_ sender: Any) {
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
