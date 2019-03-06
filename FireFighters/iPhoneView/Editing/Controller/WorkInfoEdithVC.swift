//
//  WorkInfoEdithVC.swift
//  FireFighters
//
//  Created by Павел on 11.05.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import Firebase

class WorkInfoEdithVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, getTockenUser {
    @IBOutlet weak var PartNumberEdit: UITextField!
    @IBOutlet weak var GuardEdit: UITextField!
    @IBOutlet weak var VballonsEdit: UITextField!
    @IBOutlet weak var coefficientEdit: UITextField!
    @IBOutlet weak var AirFlowEdith: UITextField!
    @IBOutlet weak var GearBoxEdit: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var positionField: UITextField!
    @IBOutlet weak var unitType: UITextField!
    let CoreDataInfo = UserProfile()
    let PositionSel = ["Пожарный","Ком.отделения","Нач.караула","Нач.части","ПНК","СПТ","Диспетчер","Водитель"]
    let UnitType = ["ДАСВ","ДАСК"]
    var PositionName: String!    
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.gradientsColor()
        }
    }
    //---Загрузка контроллера
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: saveButton.frame.size.width, height: saveButton.frame.size.height)
        saveButton.layer.insertSublayer(buttonGardients, at: 0)
        saveButton.grayButton(nameBut: "Сохранить изменения")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard userTocken != "" else { return }
        //----UIPickerField----
        let positionPicker = UIPickerView()
        let typeUnitPicker = UIPickerView()
        //----Тэг 1 на Выбор должности
        positionPicker.delegate = self
        positionPicker.tag = 1
        positionField.inputView = positionPicker
        //----Тэг 2 на Выбор типа аппарата
        typeUnitPicker.delegate = self
        typeUnitPicker.tag = 2
        unitType.inputView = typeUnitPicker
        //----Поля ввода текста
            PartNumberEdit.text = CoreDataInfo.userPartNum  // Номер части
            GuardEdit.text = String(CoreDataInfo.userChange) //Номер караула
            unitType.text = CoreDataInfo.userUnitType   //Тип аппарата
            positionField.text = CoreDataInfo.userPosition // Должность
            VballonsEdit.text = String(CoreDataInfo.userVBallons)//Объем баллона
            coefficientEdit.text = String(CoreDataInfo.userAspectRatio)//Коэф.сжатия
            AirFlowEdith.text = String(CoreDataInfo.userAirFlow)//Расход воздуха
            GearBoxEdit.text = String(CoreDataInfo.userGearboxOperation)//Давление редуктора
        }
    //-----НАстройка UIPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return PositionSel.count
        case 2: return UnitType.count
        default: return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return PositionSel[row]
        case 2: return UnitType[row]
        default: return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1: positionField.text = PositionSel[row]
        case 2: unitType.text = UnitType[row]
        default: print("nil")
        }
    }
    //-----Сохранение данных--Этап 1---Проверка и возвращение к предидущему контроллеру
    @IBAction func saveEditInfo(_ sender: Any) {
        guard PartNumberEdit.text! != "" else { return AlertView(text: "Вы не указали номер части!")}
        guard GuardEdit.text! != "" else { return AlertView(text: "Вы не указали номер Караула(Дежурной смены)")}
        guard VballonsEdit.text! != "" else { return AlertView(text: "Вы не указали  объем баллона(ов)!")}
        guard coefficientEdit.text! != "" else { return AlertView(text: "Вы не указали коэффециент сжатия!")}
        guard AirFlowEdith.text! != "" else { return AlertView(text: "Вы не указали средний расход воздуха!")}
        guard GearBoxEdit.text! != "" else { return AlertView(text: "Вы не указали давления для стабильной работы редуктора!")}
        editInform(part: PartNumberEdit.text!, Guard: Int(GuardEdit.text!)!,VBal: Double(VballonsEdit.text!)!, Aspect: Double(coefficientEdit.text!)!, Air: Double(AirFlowEdith.text!)!, GB: Int(GearBoxEdit.text!)!,posit: positionField.text!, typeSel: unitType.text!)
        dismiss(animated: true, completion: nil)
    }
    //-----Сохранение данных--Этап 2---Сохранение в БД и на сервер
    func editInform(part: String, Guard: Int,VBal: Double, Aspect: Double, Air: Double,GB: Int, posit: String, typeSel: String) {
        if CoreDataInfo.userPartNum != part {
            self.DataReference.child(userTocken!).updateChildValues(["partNumb": part])
            CoreDataInfo.userPartNum = part}
        if CoreDataInfo.userChange != Guard {
           self.DataReference.child(userTocken!).updateChildValues(["changeNum": Guard])
            CoreDataInfo.userChange = Guard}
        if CoreDataInfo.userVBallons != VBal {
            self.DataReference.child(userTocken!).updateChildValues(["vBallons": VBal])
            CoreDataInfo.userVBallons = VBal}
        if CoreDataInfo.userAspectRatio != Aspect{
            self.DataReference.child(userTocken!).updateChildValues(["aspectRatio": Aspect])
            CoreDataInfo.userAspectRatio = Aspect}
        if CoreDataInfo.userAirFlow != Air{
            self.DataReference.child(userTocken!).updateChildValues(["airFlow": Air])
            CoreDataInfo.userAirFlow = Air}
        if CoreDataInfo.userGearboxOperation != GB{
            self.DataReference.child(userTocken!).updateChildValues(["gearboxOperation": GB])
            CoreDataInfo.userGearboxOperation = GB}
        if CoreDataInfo.userPosition != posit {
            self.DataReference.child(userTocken!).updateChildValues(["position": posit])
            CoreDataInfo.userPosition = posit}
        if CoreDataInfo.userUnitType != typeSel {
            self.DataReference.child(userTocken!).updateChildValues(["unitType": typeSel])
            CoreDataInfo.userUnitType = typeSel}
    }
}

