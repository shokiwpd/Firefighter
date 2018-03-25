//
//  UIAlertCustom.swift
//  FireFighters
//
//  Created by Павел on 24.03.18.
//  Copyright © 2018 Павел. All rights reserved.
//
import UIKit
extension UIAlertController {
    func alertAction(name: String, twoName: String){
        let alertView = UIAlertController(title: "\(name)", message: "\(twoName)", preferredStyle: .alert)
        //     let AC = UIAlertAction(title: "", style: .default, handler: nil)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
   return present(alertView, animated: true, completion: nil)
    }
}
