//
//  SelectTimeFireFighter.swift
//  FireFighters
//
//  Created by Павел on 24.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class SelectTimeFireFighter: UIViewController {
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
    let calculationsClass = calculations()
    var status = false //На пожаре или нет
    var numberFirefighter = 3// число пожарных
    override func viewDidLoad() {
        super.viewDidLoad()
        print(status)
        switch numberFirefighter {
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
            startButton.setTitle("Вход в НДДС", for: .normal)
            calculationButton.isHidden = true
        case false:
            startButton.isHidden = true
            calculationButton.setTitle("Рассчитать", for: .normal)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionStartButton(_ sender: Any) { //Если на пожаре
//        switch numberFirefighter {
//        case 2:
//            calculationsClass.P1 = Int(FireFighter1.text!)!
//            calculationsClass.P2 = Int(FireFighter2.text!)!
//        case 3:
//            calculationsClass.P1 = Int(FireFighter1.text!)!
//            calculationsClass.P2 = Int(FireFighter2.text!)!
//            calculationsClass.P3 = Int(FireFighter3.text!)!
//        case 4:
//            calculationsClass.P1 = Int(FireFighter1.text!)!
//            calculationsClass.P2 = Int(FireFighter2.text!)!
//            calculationsClass.P3 = Int(FireFighter3.text!)!
//            calculationsClass.P4 = Int(FireFighter4.text!)!
//        case 5:
//            calculationsClass.P1 = Int(FireFighter1.text!)!
//            calculationsClass.P2 = Int(FireFighter2.text!)!
//            calculationsClass.P3 = Int(FireFighter3.text!)!
//            calculationsClass.P4 = Int(FireFighter4.text!)!
//            calculationsClass.P5 = Int(FireFighter5.text!)!
//        default:
//            print("No numb")
//        }
    }
 
    @IBAction func actionNoWork(_ sender: Any) { //простой расчет
            let errorName = "Вы не указали давление пожарных"
                switch numberFirefighter {
                case 2:
                    guard FireFighter1.text != "",FireFighter2.text != "" else {alertAction(errors: errorName)
                        return}
                    calculationsClass.P1 = Int(FireFighter1.text!)!
                    calculationsClass.P2 = Int(FireFighter2.text!)!
                case 3:
                    guard FireFighter1.text != "",FireFighter2.text != "", FireFighter3.text != "" else {alertAction(errors: errorName)
                        return}
                    calculationsClass.P1 = Int(FireFighter1.text!)!
                    calculationsClass.P2 = Int(FireFighter2.text!)!
                    calculationsClass.P3 = Int(FireFighter3.text!)!
                case 4:
                    guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "" else {alertAction(errors: errorName)
                        return}
                    calculationsClass.P1 = Int(FireFighter1.text!)!
                    calculationsClass.P2 = Int(FireFighter2.text!)!
                    calculationsClass.P3 = Int(FireFighter3.text!)!
                    calculationsClass.P4 = Int(FireFighter4.text!)!
                case 5:
                    guard FireFighter1.text != "",FireFighter2.text != "",FireFighter3.text != "",FireFighter4.text != "", FireFighter5.text != "" else {alertAction(errors:errorName)
                        return}
                    calculationsClass.P1 = Int(FireFighter1.text!)!
                    calculationsClass.P2 = Int(FireFighter2.text!)!
                    calculationsClass.P3 = Int(FireFighter3.text!)!
                    calculationsClass.P4 = Int(FireFighter4.text!)!
                    calculationsClass.P5 = Int(FireFighter5.text!)!
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
