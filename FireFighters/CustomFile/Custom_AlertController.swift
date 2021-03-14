//
//  Custom_AlertController.swift
//  FireFighters
//
//  Created by Павел on 24.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func AlertView(text: String!) {
            let alert = UIAlertController(title: "Внимание!", message: text, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

