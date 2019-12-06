//
//  NoWorkHearthVC.swift
//  FireFighters
//
//  Created by Павел on 28.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class NoWorkHearthVC: UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var HearthFF1: UITextField!
    let HearthFF1_PV = UIPickerView()
    @IBOutlet weak var HearthFF2: UITextField!
    let HearthFF2_PV = UIPickerView()
    @IBOutlet weak var HearthFF3: UITextField!
    let HearthFF3_PV = UIPickerView()
    @IBOutlet weak var HearthFF4: UITextField!
    let HearthFF4_PV = UIPickerView()
    @IBOutlet weak var HearthFF5: UITextField!
    let HearthFF5_PV = UIPickerView()
    @IBOutlet weak var FireFighterLabel3: UILabel!
    @IBOutlet weak var FireFighterLabel4: UILabel!
    @IBOutlet weak var FireFighterLabel5: UILabel!
    @IBOutlet weak var noHearth: UIButton!
    @IBOutlet weak var yesHearth: UIButton!
    @IBOutlet weak var ArrivalTimeHearth: UIDatePicker!
    let CalData = CalculationInfo.CalculationInform
    let numberFirefighter = 2
    let barSelect = ["","300","295","290","285","280","275","270","265","260","255","250","245","240","235","230","225","220","215","210","205","200","195","190","185","180","175","170","165","160","155","150","145","140","135","130","125","120","115","110","105","100"]
    var HeartViewSel: Bool!
    var noHearthButtonGardients: CAGradientLayer! {
        didSet {
            noHearthButtonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            noHearthButtonGardients.startPoint = CGPoint(x: 0, y: 0)
            noHearthButtonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    var yesHearthButtonGardients: CAGradientLayer! {
        didSet {
            yesHearthButtonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            yesHearthButtonGardients.startPoint = CGPoint(x: 0, y: 0)
            yesHearthButtonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
        noHearthButtonGardients = CAGradientLayer()
        yesHearthButtonGardients = CAGradientLayer()
        noHearthButtonGardients.frame = CGRect(x: 0, y: 0, width: noHearth.frame.size.width, height: noHearth.frame.size.height)
        yesHearthButtonGardients.frame = CGRect(x: 0, y: 0, width: yesHearth.frame.size.width, height: yesHearth.frame.size.height)
        noHearth.layer.insertSublayer(noHearthButtonGardients, at: 0)
        yesHearth.layer.insertSublayer(yesHearthButtonGardients, at: 0)
        yesHearth.layer.cornerRadius = 10
        yesHearth.clipsToBounds = true
        noHearth.layer.cornerRadius = 10
        noHearth.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HearthFF1.delegate = self
//        HearthFF1.inputView = HearthFF1_PV
        HearthFF1.placeholder = String(CalData.FireFighter1)
//        HearthFF1_PV.delegate = self
//        HearthFF1_PV.tag = 0

        
        HearthFF2.delegate = self
//        HearthFF2.inputView = HearthFF2_PV
//        HearthFF2_PV.delegate = self
//        HearthFF2_PV.tag = 1
        HearthFF2.placeholder = String(CalData.FireFighter2)

        HearthFF3.delegate = self
//        HearthFF3.inputView = HearthFF3_PV
//        HearthFF3_PV.tag = 2
//        HearthFF3_PV.delegate = self
        HearthFF3.placeholder = String(CalData.FireFighter3)

        HearthFF4.delegate = self
//        HearthFF4.inputView = HearthFF4_PV
//        HearthFF4_PV.tag = 3
//        HearthFF4_PV.delegate = self
        HearthFF4.placeholder = String(CalData.FireFighter4)

        HearthFF5.delegate = self
//        HearthFF5.inputView = HearthFF5_PV
//        HearthFF5_PV.tag = 4
//        HearthFF5_PV.delegate = self
        HearthFF5.placeholder = String(CalData.FireFighter5)

        ArrivalTimeHearth.date = CalData.inputTime
        switch CalData.numberFireFighter {
        case 2:
            HearthFF1.delegate = self
            HearthFF2.delegate = self
            HearthFF3.isHidden = true
            HearthFF4.isHidden = true
            HearthFF5.isHidden = true
            FireFighterLabel3.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 3:
            HearthFF1.delegate = self
            HearthFF2.delegate = self
            HearthFF3.delegate = self
            HearthFF4.isHidden = true
            HearthFF5.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 4:
            HearthFF1.delegate = self
            HearthFF2.delegate = self
            HearthFF3.delegate = self
            HearthFF4.delegate = self
            HearthFF5.isHidden = true
            FireFighterLabel5.isHidden = true
        default:
            HearthFF1.delegate = self
            HearthFF2.delegate = self
            HearthFF3.delegate = self
            HearthFF4.delegate = self
            HearthFF5.delegate = self
            print("All form view")
        }
        noHearth.grayButton(nameBut: "Очаг не найден")
        yesHearth.grayButton(nameBut: "Очаг найден")
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 0: return barSelect.count
            case 1: return barSelect.count
            case 2: return barSelect.count
            case 3: return barSelect.count
            case 4: return barSelect.count
        default: return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 0: return barSelect[row]
            case 1: return barSelect[row]
            case 2: return barSelect[row]
            case 3: return barSelect[row]
            case 4: return barSelect[row]
        default: return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 0: HearthFF1.text = barSelect[row]
            case 1: HearthFF2.text =  barSelect[row]
            case 2: HearthFF3.text =  barSelect[row]
            case 3: HearthFF4.text =  barSelect[row]
            case 4: HearthFF5.text =  barSelect[row]
        default: print("nil")
        }
    }

    @IBAction func heartSearchResult(result: UIButton){
        switch result.tag {
        case 0:
            HeartViewSel = false
        case 1:
            HeartViewSel = true
            saveData()
        default:
            print("All form view")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if HearthFF1.text != "" {
            noHearth.isHidden = true
            yesHearth.isHidden = false
        } else if HearthFF1.text == "" {
            noHearth.isHidden = false
            yesHearth.isHidden = true
        }
       
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    private func saveData() {
        let errorName = "Вы не указали давление пожарных"

        switch CalData.numberFireFighter {
        case 2:
            guard HearthFF1.text != "",HearthFF2.text != "" else {return AlertView(text: errorName)}
            if CalData.FireFighter1 < Int(HearthFF1.text!)! {AlertView(text: "Давление Пожарного 1 выше давления включения!")}
            if CalData.FireFighter2 < Int(HearthFF2.text!)! {AlertView(text: "Давление Пожарного 2 выше давления включения!")}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth  = Int(HearthFF2.text!)!
            
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 3:
            guard HearthFF1.text != "",HearthFF2.text != "", HearthFF3.text != "" else {return AlertView(text: errorName)}
            if CalData.FireFighter1 < Int(HearthFF1.text!)! {AlertView(text: "Давление Пожарного 1 выше давления включения!")}
            if CalData.FireFighter2 < Int(HearthFF2.text!)! {AlertView(text: "Давление Пожарного 2 выше давления включения!")}
            if CalData.FireFighter3 < Int(HearthFF3.text!)! {AlertView(text: "Давление Пожарного 3 выше давления включения!")}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 4:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "" else {return AlertView(text: errorName)}
            if CalData.FireFighter1 < Int(HearthFF1.text!)! {AlertView(text: "Давление Пожарного 1 выше давления включения!")}
            if CalData.FireFighter2 < Int(HearthFF2.text!)! {AlertView(text: "Давление Пожарного 2 выше давления включения!")}
            if CalData.FireFighter3 < Int(HearthFF3.text!)! {AlertView(text: "Давление Пожарного 3 выше давления включения!")}
            if CalData.FireFighter4 < Int(HearthFF4.text!)! {AlertView(text: "Давление Пожарного 4 выше давления включения!")}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.p4Hearth = Int(HearthFF4.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 5:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "", HearthFF5.text != "" else {return AlertView(text: errorName)}
            if CalData.FireFighter1 < Int(HearthFF1.text!)! {AlertView(text: "Давление Пожарного 1 выше давления включения!")}
            if CalData.FireFighter2 < Int(HearthFF2.text!)! {AlertView(text: "Давление Пожарного 2 выше давления включения!")}
            if CalData.FireFighter3 < Int(HearthFF3.text!)! {AlertView(text: "Давление Пожарного 3 выше давления включения!")}
            if CalData.FireFighter4 < Int(HearthFF4.text!)! {AlertView(text: "Давление Пожарного 4 выше давления включения!")}
            if CalData.FireFighter5 < Int(HearthFF5.text!)! {AlertView(text: "Давление Пожарного 5 выше давления включения!")}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.p4Hearth = Int(HearthFF4.text!)!
            CalData.p5Hearth = Int(HearthFF5.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        default:
            print("No numb")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoHearth"{
            let NextView = segue.destination as! ResultViewController
            NextView.HeartStatus = false
        } else if segue.identifier == "YesHearth" {
            let NextView = segue.destination as! ResultViewController
            NextView.HeartStatus = true
        }
    }
}
