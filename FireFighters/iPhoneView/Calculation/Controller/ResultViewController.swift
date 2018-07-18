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
    let CalcFunc = calculationAir()
    let resultTextClass = resultText()
    let textDecision = SettlementSolution()
    var HeartStatus = false
    var DecisionProgressText = ""
    var ballons: Double!
    var loadLocalData = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
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
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFunc.Pkexit!, delT: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!)
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)
            case true:
                CalcFunc.P1 = CalcData.FireFighter1
                CalcFunc.P2 = CalcData.FireFighter2
                CalcFunc.P1Hearth = CalcData.p1Hearth
                CalcFunc.P2Hearth = CalcData.p2Hearth
                CalcFunc.Complexity = CalcData.complexityStatus
                CalcFunc.Hearth = true
                CalcFunc.CalculationTwoFireFighter()
                resultView.text = resultTextClass.isFound(Pexit: CalcFunc.PkexitH, timeWork: CalcFunc.THearthWork, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork)!)
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter, ff1: CalcData.FireFighter1, ff2: CalcData.FireFighter2, ff3: CalcData.FireFighter3, ff4: CalcData.FireFighter4, ff5: CalcData.FireFighter5, ffp1: CalcData.p1Hearth, ffp2: CalcData.p2Hearth, ffp3: CalcData.p3Hearth, ffp4: CalcData.p4Hearth, ffp5: CalcData.p5Hearth)!)
                \(textDecision.ochag(booling: CalcFunc.Complexity, Pmax: CalcFunc.PPadMax, Pmin: CalcFunc.PminHearth, Vb: Int(CalcFunc.V), Q: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, StabilWork: CalcFunc.Pust, THearthWorks: CalcFunc.THearthWork, PmaxD: CalcFunc.PkexitH, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork))!)
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
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFunc.Pkexit!, delT: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!)
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)
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
                resultView.text = resultTextClass.isFound(Pexit: CalcFunc.PkexitH, timeWork: CalcFunc.THearthWork, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork)!)
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter, ff1: CalcData.FireFighter1, ff2: CalcData.FireFighter2, ff3: CalcData.FireFighter3, ff4: CalcData.FireFighter4, ff5: CalcData.FireFighter5, ffp1: CalcData.p1Hearth, ffp2: CalcData.p2Hearth, ffp3: CalcData.p3Hearth, ffp4: CalcData.p4Hearth, ffp5: CalcData.p5Hearth)!)
                \(textDecision.ochag(booling: CalcFunc.Complexity, Pmax: CalcFunc.PPadMax, Pmin: CalcFunc.PminHearth, Vb: Int(CalcFunc.V), Q: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, StabilWork: CalcFunc.Pust, THearthWorks: CalcFunc.THearthWork, PmaxD: CalcFunc.PkexitH, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork))!)
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
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFunc.Pkexit!, delT: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!)
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)
                
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
                resultView.text = resultTextClass.isFound(Pexit: CalcFunc.PkexitH, timeWork: CalcFunc.THearthWork, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork)!)
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter, ff1: CalcData.FireFighter1, ff2: CalcData.FireFighter2, ff3: CalcData.FireFighter3, ff4: CalcData.FireFighter4, ff5: CalcData.FireFighter5, ffp1: CalcData.p1Hearth, ffp2: CalcData.p2Hearth, ffp3: CalcData.p3Hearth, ffp4: CalcData.p4Hearth, ffp5: CalcData.p5Hearth)!)
                \(textDecision.ochag(booling: CalcFunc.Complexity, Pmax: CalcFunc.PPadMax, Pmin: CalcFunc.PminHearth, Vb: Int(CalcFunc.V), Q: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, StabilWork: CalcFunc.Pust, THearthWorks: CalcFunc.THearthWork, PmaxD: CalcFunc.PkexitH, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork))!)
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
                resultView.text = resultTextClass.isNoFound(Pexit: CalcFunc.Pkexit!, delT: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!)
                DecisionProgressText = textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)
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
                resultView.text = resultTextClass.isFound(Pexit: CalcFunc.PkexitH, timeWork: CalcFunc.THearthWork, approximateTimeExit: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork)!)
                DecisionProgressText = """
                \(textDecision.ifNoFoundHearth(Pmin: CalcFunc.Pmin, Pred: CalcFunc.Pust, Vbal: CalcFunc.V, Qair: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, Tall: CalcFunc.Tall, Pmax: CalcFunc.Pmax, Pexit: CalcFunc.Pkexit, Twork: CalcFunc.Twork, Compl: CalcFunc.Complexity, timeOn: CalcData.inputTime.TimeFormat, TimeExit: CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Tall)!, TimeExitWork:CalcFunc.calculationsTime(time: CalcData.inputTime, toTime: CalcFunc.Twork)!)!)
                \(textDecision.calculationOfAir(ffInt: CalcData.numberFireFighter, ff1: CalcData.FireFighter1, ff2: CalcData.FireFighter2, ff3: CalcData.FireFighter3, ff4: CalcData.FireFighter4, ff5: CalcData.FireFighter5, ffp1: CalcData.p1Hearth, ffp2: CalcData.p2Hearth, ffp3: CalcData.p3Hearth, ffp4: CalcData.p4Hearth, ffp5: CalcData.p5Hearth)!)
                \(textDecision.ochag(booling: CalcFunc.Complexity, Pmax: CalcFunc.PPadMax, Pmin: CalcFunc.PminHearth, Vb: Int(CalcFunc.V), Q: Int(CalcFunc.Q), Kzh: CalcFunc.Kszh, StabilWork: CalcFunc.Pust, THearthWorks: CalcFunc.THearthWork, PmaxD: CalcFunc.PkexitH, TimeHearts: CalcData.heartFoundTime.TimeFormat, TimeWork: CalcFunc.calculationsTime(time: CalcData.heartFoundTime, toTime: CalcFunc.THearthWork))!)
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


