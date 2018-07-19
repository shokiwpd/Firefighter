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
    var startButtonGardients = CAGradientLayer()
    var calculationButtonGardients = CAGradientLayer()
    var status = false
    let CalData = CalculationInfo.CalculationInform
    //MARK: Загрзка графической части
    let loadData = UserDefaults.standard
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        startButtonGardients.gardientButton(w: startButton.frame.size.width,h: startButton.frame.size.height)
        calculationButtonGardients.gardientButton(w: calculationButton.frame.size.width, h: calculationButton.frame.size.height)
            startButton.layer.insertSublayer(startButtonGardients, at: 0)
            calculationButton.layer.insertSublayer(calculationButtonGardients, at: 0)
        calculationButton.layer.cornerRadius = 10
        calculationButton.clipsToBounds = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
//       print(loadData.string(forKey: "OxyAirFlow"))
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
