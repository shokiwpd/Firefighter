//
//  FirstViewController.swift
//  FireFighters
//
//  Created by Павел on 21.11.17.
//  Copyright © 2017 Павел. All rights reserved.
//
import UIKit
import CoreData


class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var userPhotoView: UIImageView!
    @IBOutlet weak var userNameView: UITextField!
    @IBOutlet weak var userPatronymicView: UITextField!
    @IBOutlet weak var userCityView: UITextField!
    @IBOutlet weak var userBirthdayPicker: UIDatePicker!
    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var selPhotoButton: UIButton!
    
    //MARK: Var
    let CustomClass = UICustomClass()
    var nextView = false
    let userInformSave = UserProfile.userInform
    //MARK: Загрузка данных
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        userPatronymicView.delegate = self//фамилия
        userCityView.delegate = self
        CustomClass.CustomButton(nameBut: "Продолжить", buttons: nextViewButton)
        CustomClass.customDataPicker(dataPicker: userBirthdayPicker)
        CustomClass.CustomTextField(textField: userNameView, nextBut: true)
        CustomClass.CustomTextField(textField: userPatronymicView, nextBut: true)
        CustomClass.CustomTextField(textField: userCityView, nextBut: false)
        userPhotoView.layer.cornerRadius = 10
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let mainViewHeight = self.view.bounds.size.height
        let mainViewWidth = self.view.bounds.size.width
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.view.center = CGPoint(x: mainViewWidth / 2, y: mainViewHeight / 2)
        }, completion: nil)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let mainViewHeight = self.view.bounds.size.height
        let mainViewWidth = self.view.bounds.size.width
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.view.center = CGPoint(x: mainViewWidth / 2, y: mainViewHeight / 2 - 40)
        }, completion: nil)
    }
    //MARK: Уберает клавиатуру при нажатии на любое поле
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
            let mainViewHeight = self.view.bounds.size.height
            let mainViewWidth = self.view.bounds.size.width
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { () -> Void in
                self.view.center = CGPoint(x: mainViewWidth / 2, y: mainViewHeight / 2)
            }, completion: nil)
        }
        super.touchesBegan(touches, with: event)
    }
    //MARK: переход на следущий контроллер
    @IBAction func nextViewSelButton(_ sender: Any) {
        nextView = checkInfo(name: userNameView.text!, Patronymic: userPatronymicView.text!, city: userCityView.text!)
        print(getUserBirthday(date: userBirthdayPicker.date))
        view.endEditing(true)
    }
    //MARK: Перенос данных на следущий контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch nextView {
        case true:
            if segue.identifier == "NextVC"{
                let NextView = segue.destination as! FirstNextViewController
                    NextView.name = userNameView.text!
                    NextView.Patronymic = userPatronymicView.text!
                    NextView.city = userCityView.text!
                    NextView.birthDay = getUserBirthday(date: userBirthdayPicker.date)
                    NextView.userPhoto = userPhotoView.image!
            }
        case false:
            print("Errors")
        }
    }
    //MARK: Получаем дату рождения пользователя
    func getUserBirthday(date: Date) -> String!{
        let Forrmated = DateFormatter()
        Forrmated.dateFormat = "dd:MM:YYYY"
        let formatedDate = Forrmated.string(from: date)
        return formatedDate
    }
    //MARK: Предупреждение
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
    }
    //MARK: Выбор фотографии из альбома или с камеры
    @IBAction func selectPhoto(_ sender: Any) {
        selectPhotoAlert()
    }
    
    func selectPhotoAlert(){
        let SelPhoto = UIAlertController(title: "Добавить Фото", message: nil, preferredStyle: .actionSheet)
        SelPhoto.addAction(UIAlertAction(title: "Камера", style: .default) { (action) in
            self.selPhotoSource(source: .camera)
        })
        SelPhoto.addAction(UIAlertAction(title: "Альбом", style: .default) { (action) in
            self.selPhotoSource(source: .photoLibrary)
        })
        SelPhoto.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(SelPhoto, animated: true, completion: nil)
    }
    func pr(){
        print("Yes")
    }
    func selPhotoSource(source: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        userPhotoView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        userPhotoView.contentMode = .scaleAspectFill
        userPhotoView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Провера Данных
    func checkInfo(name: String!, Patronymic: String!, city: String!) -> Bool! {
        var errorMassage = ""
        var nextViewC = false
        switch name {
        case "":
            errorMassage = "Вы не указали свое имя!"
        default:
            switch Patronymic {
            case "":
                errorMassage = "Вы не указали своё Отчество!"
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

