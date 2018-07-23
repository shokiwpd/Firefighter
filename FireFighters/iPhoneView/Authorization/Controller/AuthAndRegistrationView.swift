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
            nameLabel.text = "Огнеборцы"
        }
    }
    @IBOutlet weak var authorizationButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    //MARK: Гардиент
    var buttonGardients = CAGradientLayer()
    //MARK: Лайауты,фон
    override func viewDidLayoutSubviews() {
        //Настройка внешнего вида кнопки
        authorizationButton.grayButton(nameBut: "Войти")
        registrationButton.clearButton(nameBut: "Регистрация")
        
        nameLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        //Фон без эффекта размытия
        self.view.insertSubview(view.backgraundView(), at: 0)
        //гардиент для кнопок
        buttonGardients.gardientButton(w: authorizationButton.frame.size.width, h: authorizationButton.frame.size.height)
        authorizationButton.layer.insertSublayer(buttonGardients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("iPhoneHeight \(view.bounds.height)")
    }
    //Кнопа на случай если возникли ошибки
    @IBAction func VKgroupURL(_ sender: Any) {
        AlertView(text: "Если у Вас Возникли проблемы ждем Вас в нашей группе в VK.Ссылку вы можете найти в <Отзывы -> Поддержка ПО>")
    }
    
    //MARK: Переход на другой сториборд
    @IBAction func registrationButton(_ sender: Any) {
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
