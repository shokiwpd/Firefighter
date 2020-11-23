//
//  FirstViewController.swift
//  FireFighters
//
//  Created by Павел on 21.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//
import UIKit
import CoreData


class FirstViewController: UIViewController {
    @IBOutlet weak var userPhotoView: UIImageView!
    @IBOutlet weak var userNameView: UITextField!
    @IBOutlet weak var userSecondNameView: UITextField!
    @IBOutlet weak var userCityView: UITextField!
    @IBOutlet weak var userBirthdayPicker: UIDatePicker!
    @IBOutlet weak var nextViewButton: UIButton!
    let CustomClass = UICustomClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomClass.CustomButton(nameBut: "Продолжить", buttons: nextViewButton)
        userBirthdayPicker.datePickerMode = .date
        self.view.backgroundColor = UIColor.blue
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func nextViewSelButton(_ sender: Any) {
        let x = userBirthdayPicker.date
        checkInfo(name: userNameView.text!, secName: userSecondNameView.text!, city: userCityView.text!)
        print(x)
        view.endEditing(true)
    }
    
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
    }
    
private  func checkInfo(name: String!, secName: String!, city: String!) {
        var errorMassage = ""
        switch name {
        case "":
            errorMassage = "Вы не указали свое имя!"
        default:
            switch secName {
            case "":
                errorMassage = "Вы не указали свою фамилию!"
            default:
                switch city {
                case "":
                    errorMassage = "Вы не указали свой город!"
                default:
                    print(name, secName, city)
                }
            }
        }
    if errorMassage != "" {
        errorsMassages(errors: errorMassage)
        }
    }
}

