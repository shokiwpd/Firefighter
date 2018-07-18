//
//  Firebase_Errors.swift
//  FireFighters
//
//  Created by Павел on 21.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import Firebase

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "Данная электронная почта уже занята!"
        case .userNotFound:
            return "Данная учетная запись не найдена! Проверьте и повторите ещё раз"
        case .userDisabled:
            return "Ваша учетная запись отключена. Обратитесь в службу поддержки"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Пожалуйста, введите действительный адрес электронной почты"
        case .networkError:
            return "Ошибка подключения.Проверьте связь и попробуйте еще раз."
        case .weakPassword:
            return "Ваш пароль слишком слаб. Пароль должен содержать не менее 6 символов."
        case .wrongPassword:
            return "Неверный пароль. Пожалуйста, попробуйте еще раз или Обратитесь в службу поддержки"
        default:
            return "Unknown error occurred"
        }
    }
}


extension UIViewController{
    func fetchError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: "Ошибка!", message: errorCode.errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
