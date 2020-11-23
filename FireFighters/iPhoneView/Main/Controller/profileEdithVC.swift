//
//  profileEdithVC.swift
//  FireFighters
//
//  Created by Павел on 31.03.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class profileEdithVC: UIViewController, UITextFieldDelegate {
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
        
        //MARK: Name User constraint
        nameUserEdith.topAnchor.constraint(equalTo: scrollViewProfile.topAnchor, constant: 30).isActive = true
        nameUserEdith.trailingAnchor.constraint(equalTo: scrollViewProfile.trailingAnchor, constant: -30).isActive = true
        nameUserEdith.leadingAnchor.constraint(equalTo: scrollViewProfile.leadingAnchor, constant: 30).isActive = true
        nameUserEdith.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameUserEdith.addLines(w: nameUserEdith.frame.size.width)
//        nameUserEdith.
        //MARK: Patronym User constraint
        patronymUserEdith.topAnchor.constraint(equalTo: nameUserEdith.bottomAnchor, constant: 30).isActive = true
        patronymUserEdith.trailingAnchor.constraint(equalTo: nameUserEdith.trailingAnchor).isActive = true
        patronymUserEdith.leadingAnchor.constraint(equalTo: nameUserEdith.leadingAnchor).isActive = true
        patronymUserEdith.heightAnchor.constraint(equalToConstant: 40).isActive = true
        patronymUserEdith.addLines(w: nameUserEdith.frame.size.width)
        //MARK: City User constraint
        cityUserEdith.topAnchor.constraint(equalTo: patronymUserEdith.bottomAnchor, constant: 30).isActive = true
        cityUserEdith.trailingAnchor.constraint(equalTo: patronymUserEdith.trailingAnchor).isActive = true
        cityUserEdith.leadingAnchor.constraint(equalTo: patronymUserEdith.leadingAnchor).isActive = true
        cityUserEdith.heightAnchor.constraint(equalToConstant: 40).isActive = true
        patronymUserEdith.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        cityUserEdith.addLines(w: nameUserEdith.frame.size.width)
        //MARK: Date Birthday field
        birthDayeUserEdith.topAnchor.constraint(equalTo: cityUserEdith.bottomAnchor, constant: 30).isActive = true
        birthDayeUserEdith.trailingAnchor.constraint(equalTo: patronymUserEdith.trailingAnchor).isActive = true
        birthDayeUserEdith.leadingAnchor.constraint(equalTo: patronymUserEdith.leadingAnchor).isActive = true
        birthDayeUserEdith.heightAnchor.constraint(equalToConstant: 40).isActive = true
        birthDayeUserEdith.addLines(w: birthDayeUserEdith.frame.size.width)
//        birthDayeUserEdith
        //MARK: save button constraint
        saveEdithData.topAnchor.constraint(equalTo: birthDayeUserEdith.bottomAnchor, constant: 40).isActive = true
        saveEdithData.trailingAnchor.constraint(equalTo: birthDayeUserEdith.trailingAnchor).isActive = true
        saveEdithData.leadingAnchor.constraint(equalTo: birthDayeUserEdith.leadingAnchor).isActive = true
        saveEdithData.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        
        saveEdithData.setTitle("Save", for: .normal)
        saveEdithData.addTarget(self, action: #selector(printAllAlert), for: .touchUpInside)
    }
    
    @objc func printAllAlert() {
        print("\(nameUserEdith.text!)\(patronymUserEdith.text!)\(cityUserEdith.text!)\(edihtDateString(date: datePickerField.date)!)")
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
    @objc func backButtom(){
        self.dismiss(animated: true, completion: nil)
    }


}
