//
//  ResultViewController.swift
//  FireFighters
//
//  Created by Павел on 28.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var viewResultCalc: UIButton!
    let CalcData = CalculationInfo.CalculationInform
    let CalcFunc = calculations()
    var HeartStatus = false
    override func viewDidLoad() {
        super.viewDidLoad()
        resul()
    }
    func resul() {
        switch CalcData.numberFireFighter {
        case 2:
            switch HeartStatus {
            case false:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.CalculationTwoFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                """
            case true:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P1Hearth = CalcData.p1Hearth
                CalcFunc.P2Hearth = CalcData.p2Hearth
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.Hearth = true
                CalcFunc.CalculationTwoFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                Время работы:\(CalcFunc.Twork!) Мин
                Время работы у очага:\(CalcFunc.THearthWork!) Мин
                Контрольное давление при котором надо выходить при котором надо выходить:\(CalcFunc.PkexitH!) Бар
                """
            }
        case 3:
            switch HeartStatus {
            case false:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.CalculationThreeFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                """
            case true:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.P1Hearth = CalcData.p1Hearth
                CalcFunc.P2Hearth = CalcData.p2Hearth
                CalcFunc.P3Hearth = CalcData.p3Hearth
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.Hearth = true
                CalcFunc.CalculationThreeFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                Время работы:\(CalcFunc.Twork!) Мин
                Время работы у очага:\(CalcFunc.THearthWork!) Мин
                Контрольное давление при котором надо выходить при котором надо выходить:\(CalcFunc.PkexitH!) Бар
                """
            }
        case 4:
            switch HeartStatus {
            case false:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.P4 = CalcData.FireFighter4
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.CalculationFourFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                """
            case true:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.P4 = CalcData.FireFighter4
                CalcFunc.P1Hearth = CalcData.p1Hearth
                CalcFunc.P2Hearth = CalcData.p2Hearth
                CalcFunc.P3Hearth = CalcData.p3Hearth
                CalcFunc.P4Hearth = CalcData.p4Hearth
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.Hearth = true
                CalcFunc.CalculationFourFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                Время работы:\(CalcFunc.Twork!) Мин
                Время работы у очага:\(CalcFunc.THearthWork!) Мин
                Контрольное давление при котором надо выходить при котором надо выходить:\(CalcFunc.PkexitH!) Бар
                """
            }
        case 5:
            switch HeartStatus {
            case false:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.P4 = CalcData.FireFighter4
                CalcFunc.P5 = CalcData.FireFighter5
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.CalculationFiveFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                """
            case true:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P3 = CalcData.FireFighter3
                CalcFunc.P4 = CalcData.FireFighter4
                CalcFunc.P5 = CalcData.FireFighter5
                CalcFunc.P1Hearth = CalcData.p1Hearth
                CalcFunc.P2Hearth = CalcData.p2Hearth
                CalcFunc.P3Hearth = CalcData.p3Hearth
                CalcFunc.P4Hearth = CalcData.p4Hearth
                CalcFunc.P5Hearth = CalcData.p5Hearth
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.Hearth = true
                CalcFunc.CalculationFiveFireFighter()
                resultView.text = """
                Максимальное падение воздуха:\(CalcFunc.Pmax!) Бар
                Общее время работы:\(CalcFunc.Tall!) Мин
                Давление при котором надо выходить:\(CalcFunc.Pkexit!) Бар
                Время работы:\(CalcFunc.Twork!) Мин
                Время работы у очага:\(CalcFunc.THearthWork!) Мин
                Контрольное давление при котором надо выходить при котором надо выходить:\(CalcFunc.PkexitH!) Бар
                """
            }
        default:
            print("Test")
        }
        
        
        
        
    }
    
    
}


