//
//  workEdithVC.swift
//  FireFighters
//
//  Created by Павел on 15.05.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import Foundation
import UIKit

class workEdithVC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    //СПИСОК ФОРМ
    // Номер части
    // Караул
    // Должность
    // Тип аппарата
    // Объем баллона
    // коэф сжатия
    // средний расход
    // давление редуктора
    
    //MARK: UI element init
    var parthNumberEdith = profileEdithText()
    var changeNumberEdith = profileEdithText()
    var positionSelectEdith = profileEdithText()
    var unitTypeFieldEdith = profileEdithText()
    var volumeBallonsEdith = profileEdithText()
    var airCompressionEdith = profileEdithText()
    var airConsumption = profileEdithText()
    var gearOperationEdith = profileEdithText()
    let saveWorkData = profileCustomButton()
    var scrollViewWork: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.autoresizingMask = .flexibleHeight
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    //MARK: Add Data Base
    let workDataLoadAndSave = UserProfile.userInform
    
    override func viewWillLayoutSubviews() {
        self.saveWorkData.DarkThemeButton()
        self.navigationController?.navigatinDarkTheme()
        self.view.viewThemeColor()
        //MARK: Constraint UI element
        
        //MARK: Scroll view setting
        let contentScroll = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 400)
        scrollViewWork.contentSize = contentScroll
        scrollViewWork.frame = self.view.bounds

        //MARK:scroll view constraint
        scrollViewWork.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollViewWork.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollViewWork.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollViewWork.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 300).isActive = true
        //MARK: Parth Number constrint
        parthNumberEdith.topAnchor.constraint(equalTo: scrollViewWork.topAnchor, constant: 30).isActive = true
        parthNumberEdith.trailingAnchor.constraint(equalTo: scrollViewWork.trailingAnchor, constant: -30).isActive = true
        parthNumberEdith.leadingAnchor.constraint(equalTo: scrollViewWork.leadingAnchor,constant: 30).isActive = true
        parthNumberEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        parthNumberEdith.addLines(w: parthNumberEdith.frame.size.width)
        //MARK: Change Number constraint
        changeNumberEdith.topAnchor.constraint(equalTo: parthNumberEdith.bottomAnchor, constant: 30).isActive = true
        changeNumberEdith.trailingAnchor.constraint(equalTo: parthNumberEdith.trailingAnchor).isActive = true
        changeNumberEdith.leadingAnchor.constraint(equalTo: parthNumberEdith.leadingAnchor).isActive = true
        changeNumberEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        changeNumberEdith.addLines(w: changeNumberEdith.frame.size.width)
        //MARK:positionSelectEdith
        positionSelectEdith.topAnchor.constraint(equalTo: changeNumberEdith.bottomAnchor, constant: 30).isActive = true
        positionSelectEdith.trailingAnchor.constraint(equalTo: changeNumberEdith.trailingAnchor).isActive = true
        positionSelectEdith.leadingAnchor.constraint(equalTo: changeNumberEdith.leadingAnchor).isActive = true
        positionSelectEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        positionSelectEdith.centerXAnchor.constraint(equalTo: scrollViewWork.centerXAnchor).isActive = true
        positionSelectEdith.addLines(w: positionSelectEdith.frame.size.width)
        //MARK:unitTypeFieldEdith
        unitTypeFieldEdith.topAnchor.constraint(equalTo: positionSelectEdith.bottomAnchor, constant: 30).isActive = true
        unitTypeFieldEdith.trailingAnchor.constraint(equalTo: positionSelectEdith.trailingAnchor).isActive = true
        unitTypeFieldEdith.leadingAnchor.constraint(equalTo: positionSelectEdith.leadingAnchor).isActive = true
        unitTypeFieldEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        unitTypeFieldEdith.addLines(w: unitTypeFieldEdith.frame.size.width)
        //MARK:volumeBallonsEdith
        volumeBallonsEdith.topAnchor.constraint(equalTo: unitTypeFieldEdith.bottomAnchor, constant: 30).isActive = true
        volumeBallonsEdith.trailingAnchor.constraint(equalTo: unitTypeFieldEdith.trailingAnchor).isActive = true
        volumeBallonsEdith.leadingAnchor.constraint(equalTo: unitTypeFieldEdith.leadingAnchor).isActive = true
        volumeBallonsEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        volumeBallonsEdith.addLines(w: volumeBallonsEdith.frame.size.width)
        //MARK:airCompressionEdith
        airCompressionEdith.topAnchor.constraint(equalTo: volumeBallonsEdith.bottomAnchor, constant: 30).isActive = true
        airCompressionEdith.trailingAnchor.constraint(equalTo: volumeBallonsEdith.trailingAnchor).isActive = true
        airCompressionEdith.leadingAnchor.constraint(equalTo: volumeBallonsEdith.leadingAnchor).isActive = true
        airCompressionEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        airCompressionEdith.addLines(w: airCompressionEdith.frame.size.width)
        //MARK:airConsumption
        airConsumption.topAnchor.constraint(equalTo: airCompressionEdith.bottomAnchor, constant: 30).isActive = true
        airConsumption.trailingAnchor.constraint(equalTo: airCompressionEdith.trailingAnchor).isActive = true
        airConsumption.leadingAnchor.constraint(equalTo: airCompressionEdith.leadingAnchor).isActive = true
        airConsumption.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        airConsumption.addLines(w: airConsumption.frame.size.width)
        //MARK:gearOperationEdith
        gearOperationEdith.topAnchor.constraint(equalTo: airConsumption.bottomAnchor, constant: 30).isActive = true
        gearOperationEdith.trailingAnchor.constraint(equalTo: airConsumption.trailingAnchor).isActive = true
        gearOperationEdith.leadingAnchor.constraint(equalTo: airConsumption.leadingAnchor).isActive = true
        gearOperationEdith.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        gearOperationEdith.addLines(w: gearOperationEdith.frame.size.width)
        //MARK:saveWorkData
        saveWorkData.topAnchor.constraint(equalTo: gearOperationEdith.bottomAnchor, constant: 30).isActive = true
        saveWorkData.trailingAnchor.constraint(equalTo: gearOperationEdith.trailingAnchor).isActive = true
        saveWorkData.leadingAnchor.constraint(equalTo: gearOperationEdith.leadingAnchor).isActive = true
        saveWorkData.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        view.layoutIfNeeded()
    }
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(saveAndClose))
        title = ""
        //MARK: Init UI element to view
        self.view.addSubview(scrollViewWork)
        scrollViewWork.addSubview(parthNumberEdith)
        scrollViewWork.addSubview(changeNumberEdith)
        scrollViewWork.addSubview(positionSelectEdith)
        scrollViewWork.addSubview(unitTypeFieldEdith)
        scrollViewWork.addSubview(volumeBallonsEdith)
        scrollViewWork.addSubview(airCompressionEdith)
        scrollViewWork.addSubview(airConsumption)
        scrollViewWork.addSubview(gearOperationEdith)
        scrollViewWork.addSubview(saveWorkData)
        //MARK: Text field placeholder
        parthNumberEdith.placeholder = "Ваш номер части \(workDataLoadAndSave.userPartNum!)"
        changeNumberEdith.placeholder = "Ваша смена \(workDataLoadAndSave.userChange!)"
        positionSelectEdith.placeholder = "Ваша должность \(workDataLoadAndSave.userPosition!)"
        unitTypeFieldEdith.placeholder = "У Вас аппарат \(workDataLoadAndSave.userUnitType)"
        volumeBallonsEdith.placeholder = "Объем баллона \(workDataLoadAndSave.userVBallons)"
        airCompressionEdith.placeholder = "Коэфюсжатия \(workDataLoadAndSave.userAspectRatio)"
        airConsumption.placeholder = "Средний расход \(workDataLoadAndSave.userAirFlow)"
        gearOperationEdith.placeholder = "Давление стаб.раб \(workDataLoadAndSave.userGearboxOperation)"

        saveWorkData.setTitle("Save", for: .normal)
    }
    
    @objc func saveAndClose(){
        self.dismiss(animated: true, completion: nil)
    }
}
