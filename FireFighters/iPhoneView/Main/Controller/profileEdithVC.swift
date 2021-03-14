//
//  profileEdithVC.swift
//  FireFighters
//
//  Created by Павел on 31.03.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class profileEdithVC: UIViewController, UITextFieldDelegate, getTockenUser {
    //MARK: Add UI element
    let photoUser: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.backgroundColor = .red
        return image
    }()
    let datePickerField:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.locale = Locale.init(identifier: "RU")
        date.maximumDate = Date()
        if #available(iOS 13.4, *) {
            date.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return date
    }()
    
    var nameUserEdith = profileEdithText()
    var patronymUserEdith = profileEdithText()
    var cityUserEdith = profileEdithText()
    let birthDayeUserEdith = profileEdithText()
    let saveEdithData = profileCustomButton()
    
    var scrollViewProfile: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.autoresizingMask = .flexibleHeight
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    //MARK: Add DataBase
    let profileDataLoadAndSave = UserProfile.userInform

    override func viewWillLayoutSubviews() {
        //MARK:load UI color theme
        self.saveEdithData.DarkThemeButton()
        self.navigationController?.navigatinDarkTheme()
        
        let contentScroll = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 200)
               scrollViewProfile.contentSize = contentScroll
               scrollViewProfile.frame = self.view.bounds

        //MARK:scroll view constraint
        scrollViewProfile.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollViewProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollViewProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollViewProfile.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 200).isActive = true
       
        //func setting layout
        layOutUIKitSetting()
        
        view.layoutIfNeeded()

    }
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Navigation setting
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(backButtom))
        title = ""
        //MARK: Add UI elements
        view.viewThemeColor()
        view.addSubview(scrollViewProfile)
        scrollViewProfile.addSubview(nameUserEdith)
        scrollViewProfile.addSubview(patronymUserEdith)
        scrollViewProfile.addSubview(cityUserEdith)
        scrollViewProfile.addSubview(birthDayeUserEdith)
        scrollViewProfile.addSubview(saveEdithData)
        
        //Setting Date Oicker TextField
        birthDayeUserEdith.delegate = self
        birthDayeUserEdith.inputView = datePickerField
        
        //MARK: Title and Action SaveButton/textField
        nameUserEdith.placeholder = profileDataLoadAndSave.userName
        patronymUserEdith.placeholder = profileDataLoadAndSave.userPatronymic
        cityUserEdith.placeholder = profileDataLoadAndSave.userCity
        birthDayeUserEdith.placeholder = profileDataLoadAndSave.userBirthday
        
        saveEdithData.setTitle("Сохранить", for: .normal)
        saveEdithData.addTarget(self, action: #selector(printAllAlert), for: .touchUpInside)
    }
    
    @objc func printAllAlert() {
        if nameUserEdith.text == "" {nameUserEdith.text = profileDataLoadAndSave.userName}
        if patronymUserEdith.text == "" {patronymUserEdith.text = profileDataLoadAndSave.userPatronymic}
        if cityUserEdith.text == "" {cityUserEdith.text = profileDataLoadAndSave.userCity}
        if birthDayeUserEdith.text == "" {cityUserEdith.text = profileDataLoadAndSave.userBirthday}
        edithProfileUser(nameUserEdith.text!, patronymUserEdith.text!, cityUserEdith.text!, birthDayeUserEdith.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    func edihtDateString(date: Date) -> String!{
            let Forrmated = DateFormatter()
            Forrmated.dateFormat = "dd:MM:YYYY"
            let formatedDate = Forrmated.string(from: date)
            return formatedDate
        }
    func textFieldDidEndEditing(_ textField: UITextField) {
        birthDayeUserEdith.text = edihtDateString(date: datePickerField.date)!
    }
    
    func edithProfileUser(_ name: String, _ patronymic: String, _ city: String, _ date: String ) {
        if name != profileDataLoadAndSave.userName{
            self.DataReference.child(userTocken!).updateChildValues(["name": name])
            profileDataLoadAndSave.userName = name
        }
        if patronymic != profileDataLoadAndSave.userPatronymic{
            self.DataReference.child(userTocken!).updateChildValues(["patronymic": patronymic])
            profileDataLoadAndSave.userPatronymic = patronymic
        }
        if city != profileDataLoadAndSave.userCity{
            self.DataReference.child(userTocken!).updateChildValues(["city": city])
            profileDataLoadAndSave.userCity = city
        }
        if date != profileDataLoadAndSave.userBirthday{
            self.DataReference.child(userTocken!).updateChildValues(["birthDay": date])
            profileDataLoadAndSave.userBirthday = date
        }
    }
    
    @objc func backButtom(){
        self.dismiss(animated: true, completion: nil)
    }
    func layOutUIKitSetting() {
        //MARK: Name User constraint
        nameUserEdith.layOutSettingTextField(scrollViewProfile.topAnchor, 30,
                                             scrollViewProfile.leadingAnchor, 30,
                                             scrollViewProfile.trailingAnchor, -30,
                                             nil, 0)
        nameUserEdith.heightTextField(40)
        nameUserEdith.addLines(w: nameUserEdith.frame.size.width)
        //MARK: Patronym User constraint
        patronymUserEdith.layOutSettingTextField(nameUserEdith.bottomAnchor, 30,
                                                 nameUserEdith.leadingAnchor, 0,
                                                 nameUserEdith.trailingAnchor, 0,
                                                 nil, 0)
        patronymUserEdith.heightTextField(40)
        patronymUserEdith.addLines(w: nameUserEdith.frame.size.width)
        patronymUserEdith.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //MARK: City User constraint
        cityUserEdith.layOutSettingTextField(patronymUserEdith.bottomAnchor, 30,
                                             patronymUserEdith.leadingAnchor, 0,
                                             patronymUserEdith.trailingAnchor, 0,
                                             nil, 0)
        cityUserEdith.heightTextField(40)
        cityUserEdith.addLines(w: nameUserEdith.frame.size.width)
        //MARK: Date Birthday field
        birthDayeUserEdith.layOutSettingTextField(cityUserEdith.bottomAnchor, 30,
                                                  patronymUserEdith.leadingAnchor, 0,
                                                  patronymUserEdith.trailingAnchor, 0,
                                                  nil, 0)
        birthDayeUserEdith.heightTextField(40)
        birthDayeUserEdith.addLines(w: birthDayeUserEdith.frame.size.width)
        //MARK: save button constraint
        saveEdithData.layOutSettingButton(birthDayeUserEdith.bottomAnchor, 40,
                                          birthDayeUserEdith.leadingAnchor, 0,
                                          birthDayeUserEdith.trailingAnchor, 0,
                                          nil, 0)
        saveEdithData.heightButton(50)
    }

}
