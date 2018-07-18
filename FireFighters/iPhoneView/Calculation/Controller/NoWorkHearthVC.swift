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
    @IBOutlet weak var ArrivalTimeHearth: UIDatePicker!
    let CalData = CalculationInfo.CalculationInform
    let numberFirefighter = 2
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
        ArrivalTimeHearth.date = CalData.inputTime
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
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
            print("All form view")
        }
        noHearth.grayButton(nameBut: "Без очага")
        yesHearth.grayButton(nameBut: "Очаг найден")
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
    private func saveData() {
        let errorName = "Вы не указали давление пожарных"
        switch CalData.numberFireFighter {
        case 2:
            guard HearthFF1.text != "",HearthFF2.text != "" else {return alertAction(errors: errorName)}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth  = Int(HearthFF2.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 3:
            guard HearthFF1.text != "",HearthFF2.text != "", HearthFF3.text != "" else {alertAction(errors: errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 4:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "" else {alertAction(errors: errorName)
                return}
            CalData.p1Hearth = Int(HearthFF1.text!)!
            CalData.p2Hearth = Int(HearthFF2.text!)!
            CalData.p3Hearth = Int(HearthFF3.text!)!
            CalData.p4Hearth = Int(HearthFF4.text!)!
            CalData.heartFoundTime = ArrivalTimeHearth.date
        case 5:
            guard HearthFF1.text != "",HearthFF2.text != "",HearthFF3.text != "",HearthFF4.text != "", HearthFF5.text != "" else {alertAction(errors:errorName)
                return}
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
private func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
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
