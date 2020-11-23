//
//  SelectTimeFireFighter.swift
//  FireFighters
//
//  Created by Павел on 24.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class SelectTimeFireFighter: UIViewController,UITextFieldDelegate {//, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var FireFighter1: UITextField!
    @IBOutlet weak var FireFighter2: UITextField!
    @IBOutlet weak var FireFighter3: UITextField!
    @IBOutlet weak var FireFighter4: UITextField!
    @IBOutlet weak var FireFighter5: UITextField!
    let FireFighter1_PV = UIPickerView()
    let FireFighter2_PV = UIPickerView()
    let FireFighter3_PV = UIPickerView()
    let FireFighter4_PV = UIPickerView()
    let FireFighter5_PV = UIPickerView()
    @IBOutlet weak var FireFighterLabel2: UILabel!
    @IBOutlet weak var FireFighterLabel3: UILabel!
    @IBOutlet weak var FireFighterLabel4: UILabel!
    @IBOutlet weak var FireFighterLabel5: UILabel!
    @IBOutlet weak var timeLabel: UIDatePicker! 
    @IBOutlet weak var TimeOn: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    //MARK: Гардиенты для кнопок
    var startButtonGardients = CAGradientLayer()
    var calculationButtonGardients = CAGradientLayer()
    var status = false
    let CalData = CalculationInfo.CalculationInform
    let loadData = UserDefaults.standard
    let barSelect = ["","300","295","290","285","280","275","270","265","260","255","250","245","240","235","230","225","220","215","210","205","200","195","190","185","180","175","170","165","160","155","150","145","140","135","130","125","120","115","110","105","100"]
    //MARK: Загрзка графической части
    
    
    
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
        startButtonGardients.gardientButton(w: startButton.frame.size.width,h: startButton.frame.size.height)
        calculationButtonGardients.gardientButton(w: calculationButton.frame.size.width, h: calculationButton.frame.size.height)
            startButton.layer.insertSublayer(startButtonGardients, at: 0)
            calculationButton.layer.insertSublayer(calculationButtonGardients, at: 0)
        calculationButton.layer.cornerRadius = 10
        calculationButton.clipsToBounds = true
        //timePicker setting   
    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        switch pickerView.tag {
//            case 0: return barSelect.count
//            case 1: return barSelect.count
//            case 2: return barSelect.count
//            case 3: return barSelect.count
//            case 4: return barSelect.count
//        default: return 0
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch pickerView.tag {
//            case 0: return barSelect[row]
//            case 1: return barSelect[row]
//            case 2: return barSelect[row]
//            case 3: return barSelect[row]
//            case 4: return barSelect[row]
//        default: return nil
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch pickerView.tag {
//            case 0: FireFighter1.text = barSelect[row]
//            case 1: FireFighter2.text =  barSelect[row]
//            case 2: FireFighter3.text =  barSelect[row]
//            case 3: FireFighter4.text =  barSelect[row]
//            case 4: FireFighter5.text =  barSelect[row]
//        default: print("nil")
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FireFighter1.delegate = self
//        FireFighter1.inputView = FireFighter1_PV
//        FireFighter1_PV.delegate = self
//        FireFighter1_PV.tag = 0
        
        FireFighter2.delegate = self
//        FireFighter2.inputView = FireFighter2_PV
//        FireFighter2_PV.delegate = self
//        FireFighter2_PV.tag = 1
        
        FireFighter3.delegate = self
//        FireFighter3.inputView = FireFighter3_PV
//        FireFighter3_PV.delegate = self
//        FireFighter3_PV.tag = 2
        
        FireFighter4.delegate = self
//        FireFighter4.inputView = FireFighter4_PV
//        FireFighter4_PV.delegate = self
//        FireFighter4_PV.tag = 3
        
        FireFighter5.delegate = self
//        FireFighter5.inputView = FireFighter5_PV
//        FireFighter5_PV.delegate = self
//        FireFighter5_PV.tag = 4
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
            guard FireFighter1.text != "",FireFighter2.text != "" else {AlertView(text: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.inputTime = TimeOn.date
        case 3:
            guard FireFighter1.text != "",FireFighter2.text != "", FireFighter3.text != "" else {AlertView(text: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.inputTime = TimeOn.date
        case 4:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "" else {AlertView(text: errorName)
                return}
            CalData.FireFighter1 = Int(FireFighter1.text!)!
            CalData.FireFighter2 = Int(FireFighter2.text!)!
            CalData.FireFighter3 = Int(FireFighter3.text!)!
            CalData.FireFighter4 = Int(FireFighter4.text!)!
            CalData.inputTime = TimeOn.date
        case 5:
            guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "", FireFighter5.text != "" else {AlertView(text: errorName)
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
}
//pod 'Firebase/Core'
//pod 'Firebase/Database'
//pod 'Firebase/Auth'
//pod 'Firebase/Storage'
//pod 'Firebase/Messaging'
//pod 'MBProgressHUD'
//pod 'ReachabilitySwift'
//pod 'iosMath'
//pod 'IQKeyboardManagerSwift'
//
//post_install do |pi|
//    pi.pods_project.targets.each do |t|
//      t.build_configurations.each do |config|
//        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
//      end
//    end
//end
