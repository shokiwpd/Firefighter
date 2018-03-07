//
//  NoWorkHearthVC.swift
//  FireFighters
//
//  Created by Павел on 28.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class NoWorkHearthVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var HearthFF1: UITextField!
    @IBOutlet weak var HearthFF2: UITextField!
    @IBOutlet weak var HearthFF3: UITextField!
    @IBOutlet weak var HearthFF4: UITextField!
    @IBOutlet weak var HearthFF5: UITextField!
    @IBOutlet weak var FireFighterLabel3: UILabel!
    @IBOutlet weak var FireFighterLabel4: UILabel!
    @IBOutlet weak var FireFighterLabel5: UILabel!
    @IBOutlet weak var noHearth: UIButton!
    @IBOutlet weak var yesHearth: UIButton!
    let CustomUI = UICustomClass()
    let CalData = CalculationInfo.CalculationInform
    let numberFirefighter = 2
    var HeartViewSel: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch CalData.numberFireFighter {
        case 2:
            HearthFF3.isHidden = true
            HearthFF4.isHidden = true
            HearthFF5.isHidden = true
            FireFighterLabel3.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 3:
            HearthFF4.isHidden = true
            HearthFF5.isHidden = true
            FireFighterLabel4.isHidden = true
            FireFighterLabel5.isHidden = true
        case 4:
            HearthFF5.isHidden = true
            FireFighterLabel5.isHidden = true
        default:
            print("Error Select")
        }
        CustomUI.CustomButton(nameBut: "Без очага", buttons: noHearth)
        CustomUI.CustomButton(nameBut: "Очаг найден", buttons: yesHearth)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func noHearthCalculation(_ sender: Any) {
        HeartViewSel = false
    }
    @IBAction func yesHearthCalculation(_ sender: Any) {
        HeartViewSel = true
        saveData()
    }
    private func saveData() {
        let errorName = "Вы не указали давление пожарных"
        switch CalData.numberFireFighter {
        case 2:
            guard HearthFF1.text != "",HearthFF2.text != "" else {alertAction(errors: errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth  = Int(HearthFF2.text!)!
        case 3:
            guard HearthFF1.text != "",HearthFF2.text != "", HearthFF3.text != "" else {alertAction(errors: errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
        case 4:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "" else {alertAction(errors: errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.p4Hearth = Int(HearthFF4.text!)!
        case 5:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "", HearthFF5.text != "" else {alertAction(errors:errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.p4Hearth = Int(HearthFF4.text!)!
            CalData.p5Hearth = Int(HearthFF5.text!)!
        default:
            print("No numb")
        }
    }
private func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue"{
            let NextView = segue.destination as! ResultViewController
            NextView.HeartStatus = false
        } else if segue.identifier == "ResultsSegue" {
            let NextView = segue.destination as! ResultViewController
            NextView.HeartStatus = true
        }
    }
}
