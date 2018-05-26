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
    //MARK: Гардиенты для кнопок
    var startButtonGardients: CAGradientLayer! {
        didSet {
            startButtonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            startButtonGardients.startPoint = CGPoint(x: 0, y: 0)
            startButtonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    var calculationButtonGardients: CAGradientLayer! {
        didSet {
            calculationButtonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            calculationButtonGardients.startPoint = CGPoint(x: 0, y: 0)
            calculationButtonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    let CustomUI = UICustomClass()
    var status = false
    let CalData = CalculationInfo.CalculationInform
    //MARK: Загрзка графической части
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        startButtonGardients = CAGradientLayer()
        startButtonGardients.frame = CGRect(x: 0, y: 0, width: startButton.frame.size.width, height: startButton.frame.size.height)
        startButton.layer.insertSublayer(startButtonGardients, at: 0)
            calculationButtonGardients = CAGradientLayer()
            calculationButtonGardients.frame = CGRect(x: 0, y: 0, width: calculationButton.frame.size.width, height: calculationButton.frame.size.height)
            calculationButton.layer.insertSublayer(calculationButtonGardients, at: 0)
        calculationButton.layer.cornerRadius = 10
        calculationButton.clipsToBounds = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isHidden = true
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
            print("All form view")
        }
        switch status {
        case true:
           // CustomUI.CustomButton(nameBut: "Вход в НДДС", buttons: startButton)
            
            calculationButton.isHidden = true
        case false:
            startButton.isHidden = true
            calculationButton.setTitle("Рассчитать", for: .normal)
            calculationButton.setTitleColor(UIColor.black, for: .normal)
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
            CalData.inputTime = TimeOn.date
        case 3:
            guard FireFighter1.text != "",FireFighter2.text != "", FireFighter3.text != "" else {alertAction(errors: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.inputTime = TimeOn.date
        case 4:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "" else {alertAction(errors: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.FireFighter4 = Int(FireFighter4.text!)!
            CalData.inputTime = TimeOn.date
        case 5:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "", FireFighter5.text != "" else {alertAction(errors:errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.FireFighter4 = Int(FireFighter4.text!)!
            CalData.FireFighter5 = Int(FireFighter5.text!)!
            CalData.inputTime = TimeOn.date
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
}
