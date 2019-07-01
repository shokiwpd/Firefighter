//
//  ResultViewController.swift
//  FireFighters
//
//  Created by Павел on 28.02.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import iosMath


class ResultViewController: UIViewController {
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var viewResultCalc: UIButton!
    let CalcData = CalculationInfo.CalculationInform
    let CalcFuncNew = newCalc()
    let resultTextClass = resultText()
    let textDecision = SettlementSolution()
    var HeartStatus = false
    var DecisionProgressText = ""
    var ballons: Double!
    let mayh = MTMathUILabel()
    
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
    }
    var loadLocalData = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        resul()
    }


    func resul() {
        switch CalcData.numberFireFighter {
        case 2:
            switch HeartStatus {
            case false:

                //new
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                 DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)
                
                
            case true:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF1_h = CalcData.p1Hearth
                CalcFuncNew.FF2_h = CalcData.p2Hearth
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.hearth = true
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)

                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter)!)
                \(textDecision.ochag(booling: CalcFuncNew.complexity, Pmax: CalcFuncNew.pMaxDownHearth, Pmin: CalcFuncNew.pMinAirHearth, THearthWorks: CalcFuncNew.tWorkHearth, PmaxD: CalcFuncNew.pExitHearth, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFuncNew.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFuncNew.tWorkHearth))!)
                """
            }
        case 3:
            switch HeartStatus {
            case false:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)

            case true:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.FF1_h = CalcData.p1Hearth
                CalcFuncNew.FF2_h = CalcData.p2Hearth
                CalcFuncNew.FF3_h = CalcData.p3Hearth
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.hearth = true
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter)!)
                \(textDecision.ochag(booling: CalcFuncNew.complexity, Pmax: CalcFuncNew.pMaxDownHearth, Pmin: CalcFuncNew.pMinAirHearth, THearthWorks: CalcFuncNew.tWorkHearth, PmaxD: CalcFuncNew.pExitHearth, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFuncNew.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFuncNew.tWorkHearth))!)
                """
            }
        case 4:
            switch HeartStatus {
            case false:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.FF4 = CalcData.FireFighter4
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)

                
            case true:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.FF4 = CalcData.FireFighter4
                CalcFuncNew.FF1_h = CalcData.p1Hearth
                CalcFuncNew.FF2_h = CalcData.p2Hearth
                CalcFuncNew.FF3_h = CalcData.p3Hearth
                CalcFuncNew.FF4_h = CalcData.p4Hearth
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.hearth = true
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter)!)
                \(textDecision.ochag(booling: CalcFuncNew.complexity, Pmax: CalcFuncNew.pMaxDownHearth, Pmin: CalcFuncNew.pMinAirHearth, THearthWorks: CalcFuncNew.tWorkHearth, PmaxD: CalcFuncNew.pExitHearth, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFuncNew.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFuncNew.tWorkHearth))!)
                """
            }
        case 5:
            switch HeartStatus {
            case false:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.FF4 = CalcData.FireFighter4
                CalcFuncNew.FF5 = CalcData.FireFighter5
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)

            case true:
                CalcFuncNew.FF1 = CalcData.FireFighter1
                CalcFuncNew.FF2 = CalcData.FireFighter2
                CalcFuncNew.FF3 = CalcData.FireFighter3
                CalcFuncNew.FF4 = CalcData.FireFighter4
                CalcFuncNew.FF5 = CalcData.FireFighter5
                CalcFuncNew.FF1_h = CalcData.p1Hearth
                CalcFuncNew.FF2_h = CalcData.p2Hearth
                CalcFuncNew.FF3_h = CalcData.p3Hearth
                CalcFuncNew.FF4_h = CalcData.p4Hearth
                CalcFuncNew.FF5_h = CalcData.p5Hearth
                CalcFuncNew.complexity = CalcData.complexityStatus
                CalcFuncNew.hearth = true
                CalcFuncNew.calculationWork(FFint: CalcData.numberFireFighter)
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFuncNew.pExit, delT: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit), approximateTimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit))
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFuncNew.pMinAir, Tall: CalcFuncNew.tAllExit, Pmax: CalcFuncNew.pMaxDown, Pexit: CalcFuncNew.pExit, Twork: CalcFuncNew.tExit, Compl: CalcFuncNew.complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tAllExit)!, TimeExitWork: CalcFuncNew.calculationsTime(time: CalcData.inputTime, toTime: CalcFuncNew.tExit)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter)!)
                \(textDecision.ochag(booling: CalcFuncNew.complexity, Pmax: CalcFuncNew.pMaxDownHearth, Pmin: CalcFuncNew.pMinAirHearth, THearthWorks: CalcFuncNew.tWorkHearth, PmaxD: CalcFuncNew.pExitHearth, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFuncNew.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFuncNew.tWorkHearth))!)
                """
            }
        default:
            print("Test")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue"{
            let resultSeg = segue.destination as! DecisionProgressVC
            resultSeg.resultTextClass = DecisionProgressText
        }
    }
}


