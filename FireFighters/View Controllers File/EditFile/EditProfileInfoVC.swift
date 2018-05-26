//
//  EditProfileInfoVC.swift
//  FireFighters
//
//  Created by Павел on 11.05.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import Firebase

class EditProfileInfoVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var patronymicUser: UILabel!
    @IBOutlet weak var BirthdayDay: UILabel!
    @IBOutlet weak var cityUser: UILabel!
    @IBOutlet weak var editCity: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var user: Users!
    let CustomClass = UICustomClass()
    var ref: DatabaseReference! {
        return Database.database().reference(withPath: "firefighter")
    }
    let CoreDataInfo = UserProfile()
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.gradientsColor()
        }
    }
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: saveButton.frame.size.width, height: saveButton.frame.size.height)
        saveButton.layer.insertSublayer(buttonGardients, at: 0)
        saveButton.customButtonColor(radius: 10, nameBut: "Сохранить изменения", titleColor: UIColor.black, shadowColors: UIColor.black.cgColor)
        self.profileImage.layer.cornerRadius = self.profileImage.layer.frame.width / 2
        self.profileImage.clipsToBounds = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Auth.auth().currentUser else { return }
        user = Users(user: currentUser)
        profileImage.image = CoreDataInfo.userPhoto
        nameUser.text = CoreDataInfo.userName
        patronymicUser.text = CoreDataInfo.userPatronymic
        BirthdayDay.text = CoreDataInfo.userBirthday
        editCity.text = CoreDataInfo.userCity
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            
            view.endEditing(true)
            CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        }
        super.touchesBegan(touches, with: event)
    }
    

    @IBAction func saveEdithButton(_ sender: Any) {
        editFileSave(editString: editCity.text!)
        dismiss(animated: true, completion: nil)
    }
    func editFileSave(editString: String!) {
        if editString != CoreDataInfo.userCity{
            self.ref?.child(user.uid).updateChildValues(["city": editString])
            CoreDataInfo.userCity = editString
        } else {
            print("error")
        }
    }

}
