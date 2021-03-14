//
//  workEdithVC.swift
//  FireFighters
//
//  Created by Павел on 15.05.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import Foundation
import UIKit

class workEdithVC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, getTockenUser,UIPickerViewDelegate, UIPickerViewDataSource {
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
    var parthNumberEdith: profileEdithText = {
        let label = profileEdithText()
        label.keyboardType = .numberPad
        return label
    }()
    var changeNumberEdith = profileEdithText()
    var positionSelectEdith = profileEdithText()
    var unitTypeFieldEdith = profileEdithText()
    
    var volumeBallonsEdith: profileEdithText = {
        let label = profileEdithText()
        label.keyboardType = .decimalPad
        return label
    }()
    var airCompressionEdith: profileEdithText = {
        let label = profileEdithText()
        label.keyboardType = .decimalPad
        return label
    }()
    var airConsumption: profileEdithText = {
        let label = profileEdithText()
        label.keyboardType = .numberPad
        return label
    }()
    var gearOperationEdith: profileEdithText = {
        let label = profileEdithText()
        label.keyboardType = .numberPad
        return label
    }()
    let saveWorkData: profileCustomButton = {
       let button = profileCustomButton()
        button.addTarget(self, action: #selector(saveAndClose), for: .touchUpInside)
        return button
    }()
    var scrollViewWork: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.autoresizingMask = .flexibleHeight
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    let positionNumersInt = ["","1","2","3","4","5"]
    let PositionSel = ["","Пожарный","Ком.отделения","Нач.караула","Нач.части","ПНК","СПТ","Диспетчер","Водитель"]
    let UnitType = ["","ДАСВ","ДАСК"]
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
       
        layOutSettingUIkit()
        
        view.layoutIfNeeded()
    }
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(saveAndClose))
        title = ""
        let changeNumberPicker = UIPickerView()
            changeNumberPicker.delegate = self
            changeNumberPicker.tag = 0
        changeNumberEdith.inputView = changeNumberPicker
        let PositionPicker = UIPickerView()
            PositionPicker.delegate = self
            PositionPicker.tag = 1
        positionSelectEdith.inputView = PositionPicker
        let unitTypePicker = UIPickerView()
            unitTypePicker.delegate = self
            unitTypePicker.tag = 2
        unitTypeFieldEdith.inputView = unitTypePicker
        
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
        airCompressionEdith.placeholder = "Коэф.сжатия \(workDataLoadAndSave.userAspectRatio)"
        airConsumption.placeholder = "Средний расход \(workDataLoadAndSave.userAirFlow)"
        gearOperationEdith.placeholder = "Давление стаб.раб \(workDataLoadAndSave.userGearboxOperation)"

        saveWorkData.setTitle("Сохранить", for: .normal)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 0: return positionNumersInt.count
            case 1: return PositionSel.count
            case 2: return UnitType.count
            default: return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 0: return positionNumersInt[row]
            case 1: return PositionSel[row]
            case 2: return UnitType[row]
            default: return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: changeNumberEdith.text = positionNumersInt[row]
        case 1: positionSelectEdith.text = PositionSel[row]
        case 2: unitTypeFieldEdith.text = UnitType[row]
        default: print("nil")
        }
    }
    
    func editInform(part: String, Guard: Int,VBal: Double, Aspect: Double, Air: Double,GB: Int, posit: String, typeSel: String) {
        if workDataLoadAndSave.userPartNum != part {
            self.DataReference.child(userTocken!).updateChildValues(["partNumb": part])
            workDataLoadAndSave.userPartNum = part}
        if workDataLoadAndSave.userChange != Guard {
           self.DataReference.child(userTocken!).updateChildValues(["changeNum": Guard])
            workDataLoadAndSave.userChange = Guard}
        if workDataLoadAndSave.userVBallons != VBal {
            self.DataReference.child(userTocken!).updateChildValues(["vBallons": VBal])
            workDataLoadAndSave.userVBallons = VBal}
        if workDataLoadAndSave.userAspectRatio != Aspect{
            self.DataReference.child(userTocken!).updateChildValues(["aspectRatio": Aspect])
            workDataLoadAndSave.userAspectRatio = Aspect}
        if workDataLoadAndSave.userAirFlow != Air{
            self.DataReference.child(userTocken!).updateChildValues(["airFlow": Air])
            workDataLoadAndSave.userAirFlow = Air}
        if workDataLoadAndSave.userGearboxOperation != GB{
            self.DataReference.child(userTocken!).updateChildValues(["gearboxOperation": GB])
            workDataLoadAndSave.userGearboxOperation = GB}
        if workDataLoadAndSave.userPosition != posit {
            self.DataReference.child(userTocken!).updateChildValues(["position": posit])
            workDataLoadAndSave.userPosition = posit}
        if workDataLoadAndSave.userUnitType != typeSel {
            self.DataReference.child(userTocken!).updateChildValues(["unitType": typeSel])
            workDataLoadAndSave.userUnitType = typeSel}
    }
    @objc func saveAndClose(){
        if parthNumberEdith.text == "" { parthNumberEdith.text = String(workDataLoadAndSave.userPartNum)}
        if changeNumberEdith.text == "" {changeNumberEdith.text = String(workDataLoadAndSave.userChange)}
        if volumeBallonsEdith.text == "" {volumeBallonsEdith.text = String(workDataLoadAndSave.userVBallons)}
        if airCompressionEdith.text == "" {airCompressionEdith.text = String(workDataLoadAndSave.userAspectRatio)}
        if airConsumption.text == "" {airConsumption.text = String(workDataLoadAndSave.userAirFlow)}
        if gearOperationEdith.text == "" {gearOperationEdith.text = String(workDataLoadAndSave.userGearboxOperation)}
        if positionSelectEdith.text == "" {positionSelectEdith.text = workDataLoadAndSave.userPosition}
        if unitTypeFieldEdith.text == "" { unitTypeFieldEdith.text = workDataLoadAndSave.userUnitType}
        editInform(part: parthNumberEdith.text!, Guard:Int(changeNumberEdith.text!)!, VBal: Double(volumeBallonsEdith.text!.forrmated)!, Aspect: Double(airCompressionEdith.text!.forrmated)!, Air: Double(airConsumption.text!.forrmated)!, GB: Int(gearOperationEdith.text!)!, posit: positionSelectEdith.text!, typeSel: unitTypeFieldEdith.text!)
        self.dismiss(animated: true, completion: nil)
    }
    func layOutSettingUIkit() {
        //MARK: Parth Number constrint
        parthNumberEdith.layOutSettingTextField(scrollViewWork.topAnchor, 30,
                                                scrollViewWork.leadingAnchor, 30,
                                                scrollViewWork.trailingAnchor, -30,
                                                nil, 0)
        parthNumberEdith.heightTextField(40)
        parthNumberEdith.addLines(w: parthNumberEdith.frame.size.width)
        //MARK: Change Number constraint
        changeNumberEdith.layOutSettingTextField(parthNumberEdith.bottomAnchor, 30,
                                                 parthNumberEdith.leadingAnchor, 0,
                                                 parthNumberEdith.trailingAnchor, 0,
                                                 nil, 0)
        changeNumberEdith.heightTextField(40)
        changeNumberEdith.addLines(w: changeNumberEdith.frame.size.width)
        //MARK:positionSelectEdith
        positionSelectEdith.layOutSettingTextField(changeNumberEdith.bottomAnchor, 30,
                                                   changeNumberEdith.leadingAnchor, 0,
                                                   changeNumberEdith.trailingAnchor, 0,
                                                   nil, 0)
        positionSelectEdith.heightTextField(40)
        positionSelectEdith.centerXAnchor.constraint(equalTo: scrollViewWork.centerXAnchor).isActive = true
        positionSelectEdith.addLines(w: positionSelectEdith.frame.size.width)
        //MARK:unitTypeFieldEdith
        unitTypeFieldEdith.layOutSettingTextField(positionSelectEdith.bottomAnchor, 30,
                                                  positionSelectEdith.leadingAnchor, 0,
                                                  positionSelectEdith.trailingAnchor, 0,
                                                  nil, 0)
        unitTypeFieldEdith.heightTextField(40)
        unitTypeFieldEdith.addLines(w: unitTypeFieldEdith.frame.size.width)
        //MARK:volumeBallonsEdith
        volumeBallonsEdith.layOutSettingTextField(unitTypeFieldEdith.bottomAnchor, 30,
                                                  unitTypeFieldEdith.leadingAnchor, 0,
                                                  unitTypeFieldEdith.trailingAnchor, 0,
                                                  nil, 0)
        volumeBallonsEdith.heightTextField(40)
        volumeBallonsEdith.addLines(w: volumeBallonsEdith.frame.size.width)
        //MARK:airCompressionEdith
        airCompressionEdith.layOutSettingTextField(volumeBallonsEdith.bottomAnchor, 30,
                                                   volumeBallonsEdith.leadingAnchor, 0,
                                                   volumeBallonsEdith.trailingAnchor, 0,
                                                   nil, 0)
        airCompressionEdith.heightTextField(40)
        airCompressionEdith.addLines(w: airCompressionEdith.frame.size.width)
        //MARK:airConsumption
        airConsumption.layOutSettingTextField(airCompressionEdith.bottomAnchor, 30,
                                              airCompressionEdith.leadingAnchor, 0,
                                              airCompressionEdith.trailingAnchor, 0,
                                              nil, 0)
        airConsumption.heightTextField(40)
        airConsumption.addLines(w: airConsumption.frame.size.width)
        //MARK:gearOperationEdith
        gearOperationEdith.layOutSettingTextField(airConsumption.bottomAnchor, 30,
                                                  airConsumption.leadingAnchor, 0,
                                                  airConsumption.trailingAnchor, 0,
                                                  nil, 0)
        gearOperationEdith.heightTextField(40)
        gearOperationEdith.addLines(w: gearOperationEdith.frame.size.width)
        //MARK:saveWorkData
        saveWorkData.layOutSettingButton(gearOperationEdith.bottomAnchor, 30,
                                         gearOperationEdith.leadingAnchor, 0,
                                         gearOperationEdith.trailingAnchor, 0,
                                         nil, 0)
        saveWorkData.heightButton(50)
    }
}
