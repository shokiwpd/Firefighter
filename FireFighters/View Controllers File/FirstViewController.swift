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
    
    //MARK: Var
    let CustomClass = UICustomClass()
    var nextView = false
    
    //MARK: Загрузка данных
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomClass.CustomButton(nameBut: "Продолжить", buttons: nextViewButton)
        userBirthdayPicker.datePickerMode = .date
        self.view.backgroundColor = UIColor.blue
    }
    //MARK: Уберает клавиатуру при нажатии на любое поле
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    //MARK: переход на следущий контроллер
    @IBAction func nextViewSelButton(_ sender: Any) {
        nextView = checkInfo(name: userNameView.text!, secName: userSecondNameView.text!, city: userCityView.text!)
        view.endEditing(true)
    }
    //MARK: Перенос данных на следущий контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch nextView {
        case true:
            if segue.identifier == "NextVC"{
                let NextView = segue.destination as! FirstNextViewController
                  NextView.name = userNameView.text!
                    NextView.secName = userSecondNameView.text!
                    NextView.city = userCityView.text!
            }
        case false:
            print("Errors")
        }
    }
    //MARK: Предупреждение
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
    }
    //MARK: ПРовера Данных
    func checkInfo(name: String!, secName: String!, city: String!) -> Bool! {
        var errorMassage = ""
        var nextViewC = false
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
                    nextViewC = true
                }
            }
        }
    if errorMassage != "" {
        errorsMassages(errors: errorMassage)
        }
        return nextViewC
    }
}

