//
//  CustomButton.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    func grayButton(nameBut: String) {
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.darkGray, for: .highlighted)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 2.0
//        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    func clearButton(nameBut: String){
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.borderColor =  UIColor.gray.cgColor
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }

}

extension CAGradientLayer {
    func gardientButton(w: CGFloat, h: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: w, height: h)
        self.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
       
    }
}

public class profileCustomButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        settingView()

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settingView()
    }
    func settingView(){
        shadow()
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
    }
    func shadow() {
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.9
        clipsToBounds = true
        layer.masksToBounds = false
        
    }
}
// Серая кнопка в окне авторизации и регистрации
public class grayButton: UIButton {
    
}
// Прозрачная кнопка в окне авторизации
public class clearButton: UIButton {
    
}
// изменяемая кнопка во всем приложении кроме окон авторизации и регистрации
public class customFutton: UIButton {
    
}
/*
 1. Первая кнопка будет использоваться только при запуске окна авторизации и регистрации так как пользователь ещ> не выбра для себя нужную тему оформления
 2. Вторая кнопка будет использоваться только в окне регистрации для разнообразия интерфейса авторизации. Больше нигде употребляться не будет!
 3. Настраиваемая кнопка. Цвет будет зависит от выбранного параметра оформления приложения( Темная, Светлая или системная(iOS >13) тема оформления)
 */
