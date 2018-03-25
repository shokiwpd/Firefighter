//
//  SelectTimeFireFighter.swift
//  FireFighters
//
//  Created by Павел on 24.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class SelectTimeFireFighter: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var FireFighter1: UITextField!
    @IBOutlet weak var FireFighter2: UITextField!
    @IBOutlet weak var FireFighter3: UITextField!
    @IBOutlet weak var FireFighter4: UITextField!
    @IBOutlet weak var FireFighter5: UITextField!
    @IBOutlet weak var FireFighterLabel3: UILabel!
    @IBOutlet weak var FireFighterLabel4: UILabel!
    @IBOutlet weak var FireFighterLabel5: UILabel!
    @IBOutlet weak var TimeOn: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    let CustomUI = UICustomClass()
    var status = false
    let CalData = CalculationInfo.CalculationInform
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(CustomUI.backgraundView(), at: 0)
        self.view.insertSubview(CustomUI.blurringScreen(view: view), at: 1)
        switch CalData.numberFireFighter{
        case 2:
            FireFighter3.isHidden = true
            FireFighter4.isHidden = true
            FireFighter5.isHidden = true
            FireFighterLabel3.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 3:
            FireFighter4.isHidden = true
            FireFighter5.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 4:
            FireFighter5.isHidden = true
            FireFighterLabel5.isHidden = true
        default:
            print("Error Select")
        }
        switch status {
        case true:
            CustomUI.CustomButton(nameBut: "Вход в НДДС", buttons: startButton)
            calculationButton.isHidden = true
        case false:
            startButton.isHidden = true
            CustomUI.CustomButton(nameBut: "Рассчитать", buttons: calculationButton)
        }
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CustomUI.keyboardStepAndHidden(viewVC: view, step: false)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomUI.keyboardStepAndHidden(viewVC: view, step: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
            CustomUI.keyboardStepAndHidden(viewVC: view, step: false)
        }
        super.touchesBegan(touches, with: event)
    }
    @IBAction func actionStartButton(_ sender: Any) { //Если на пожаре
//        saveData()
    }
 
    @IBAction func actionNoWork(_ sender: Any) { //простой расчет
        saveData()
    }
private func saveData() {
        let errorName = "Вы не указали давление пожарных"
        switch CalData.numberFireFighter {
        case 2:
            guard FireFighter1.text != "",FireFighter2.text != "" else {alertAction(errors: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
        case 3:
            guard FireFighter1.text != "",FireFighter2.text != "", FireFighter3.text != "" else {alertAction(errors: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
        case 4:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "" else {alertAction(errors: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.FireFighter4 = Int(FireFighter4.text!)!
        case 5:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "", FireFighter5.text != "" else {alertAction(errors:errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.FireFighter4 = Int(FireFighter4.text!)!
            CalData.FireFighter5 = Int(FireFighter5.text!)!
        default:
            print("No numb")
        }
    }
    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
    @IBAction func printTexts(_ sender: Any) {
        
        let x = 0.0
        let y = TimeOn.countDownDuration
        let Time = "test\(x+y) two test \(x)"
        print(Time)
        let z = 10.0
        let time2 = "test\(z+y)"
        print(time2)

    }
    
    @IBAction func testingS(_ sender: Any) {
    }
    
}
