//
//  FirstNextViewController.swift
//  FireFighters
//
//  Created by Павел Уланов on 27.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import UIKit
import CoreData

class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var partNumb: UITextField!
    @IBOutlet weak var ChangeNum: UITextField!
    @IBOutlet weak var Position: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    //MARK: Var
    let userInformSave = UserProfile.userInform
    let CustomClass = UICustomClass()
    let PositionSel = ["Пожарный","Командир отделения","Нач.караула","ПНЧ"]
    var PositionName = "Пожарный"
    var name: String!
    var Patronymic: String!
    var city: String!
    var birthDay: String!
    var userPhoto: UIImage!
    //MARK:Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomClass.CustomButton(nameBut: "Сохранить", buttons: saveButton)
        self.view.backgroundColor = UIColor.blue
        
    }
    //MARK: PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PositionSel.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PositionSel[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PositionName = PositionSel[row]
    }

    //MARK: Предупреждение
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
    }
    
    func checkInfoWork(changeNum: String, partNumb: String, position: String){
        switch partNumb{
        case "":
                errorsMassages(errors: "Вы не указали номер своей части!")
        default:
            switch changeNum{
            case "":
                errorsMassages(errors: "Вы не указали свою дежурную смену(Караул)!")
            default:
                switch position {
                    case "":
                    errorsMassages(errors: "Ошибка выбора!")
                    default:
                    userInformSave.userName = name
                    userInformSave.userPatronymic = Patronymic
                    userInformSave.userCity = city
                    userInformSave.userPosition = position
                    userInformSave.userPartNum = partNumb
                    userInformSave.userChange = changeNum
                    userInformSave.userBirthday = birthDay
                    userInformSave.userPhoto = userPhoto
                    nextVC()
                }
            }
        }
    }

    @IBAction func acceptSaveButton(_ sender: Any) {
        checkInfoWork(changeNum: ChangeNum.text!, partNumb: partNumb.text!, position: PositionName)
    }
    private func nextVC() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
