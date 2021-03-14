//
//  detailsResultVC.swift
//  FireFighters
//
//  Created by Павел on 01.12.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit
import iosMath

class detailsResultVC: UIViewController {
    //scroll view
    var scrollViewDetails: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.autoresizingMask = .flexibleHeight
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    //All labels to deteil
    let pMaxDownLabel = calculationMTMlabel()// 1
    let pExitLabel = calculationMTMlabel() // 2
    let tExitLabel = calculationMTMlabel() // 3
    let tComandExitLabel = calculationMTMlabel()// 4
    let tAllWorkLabel = calculationMTMlabel()// 5
    let tFactExitLabel = calculationMTMlabel() // 6
    let pWayLabel = calculationLabel()// 7
    let pControlExitLabel = calculationMTMlabel()// 8
    let timeWorkToHearthLabel = calculationMTMlabel()// 9
    lazy var infoLabelHearth: UILabel = {
        let text = UILabel()
        text.text = "При Р.к.вых менее 55 Bar звено\n должно выходит при 55 Bar!"
        text.textAlignment = .center
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    let timeExitFromHearthLabel = calculationMTMlabel()// 10
    
    //All Button deteil and jper info alert
    let pMaxDownButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Р max. пад = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // максимальное падение давления
    let pExitButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Р вых = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }()// давление при котором щвену надо выходить если очаг не найден
    let tExitButton: calculationButton = {
        let button = calculationButton()
        button.setTitle(" ∆Т = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Время работы если очаг не найден
    let tComandExitButton: calculationButton = {
        let button = calculationButton()
        button.setTitle(" Т вых = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Время во сколько должна быть подана команда на возвращение звена
    let tAllWorkButton: calculationButton = {
        let button = calculationButton()
        button.setTitle(" Т общ = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Общее время работы звена
    let tFactExitButton: calculationButton = {
        let button = calculationButton()
        button.setTitle(" Т возвр = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Время при котором звено должно находиться на свежем воздухе
    let pWayButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Р пути = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // давление затраченное к очагу
    let pControlExitButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Р.к.вых = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Давление при котором звену необходимо прекратить работу у очага
    let timeWorkToHearthButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Т раб = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }() // Время работы звена у очага
    let timeExitFromHearthButton: calculationButton = {
        let button = calculationButton()
        button.setTitle("Т.к.вых = ", for: .normal)
        button.addTarget(self, action: #selector(InfoFunc), for: .touchUpInside)
        return button
    }()// Время подачи команды на выход при найденом очаге
    
    //------------
    let coreDataCalculation = newCalc()
    let coreDataInfo = CalculationInfo.CalculationInform
    var heartsStatusDetail = false
    var numbersFireFightersDetails = 2
    
    override func viewDidLayoutSubviews() {
        self.view.viewThemeColor()
        layoutSettingElements()
        let contentScroll = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 50)
        scrollViewDetails.contentSize = contentScroll
        scrollViewDetails.frame = self.view.bounds
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calculsationResultDetails(numbersFireFightersDetails, heartsStatusDetail)
        addUIElements()
        
    }
    private func addUIElements() {
        view.addSubview(scrollViewDetails)
        scrollViewDetails.addSubview(pMaxDownLabel)
        scrollViewDetails.addSubview(pMaxDownButton)
        scrollViewDetails.addSubview(pExitButton)
        scrollViewDetails.addSubview(pExitLabel)
        scrollViewDetails.addSubview(tExitLabel)
        scrollViewDetails.addSubview(tExitButton)
        scrollViewDetails.addSubview(tComandExitLabel)
        scrollViewDetails.addSubview(tComandExitButton)
        scrollViewDetails.addSubview(tAllWorkLabel)
        scrollViewDetails.addSubview(tAllWorkButton)
        scrollViewDetails.addSubview(tFactExitLabel)
        scrollViewDetails.addSubview(tFactExitButton)
        //---Hearth
        if heartsStatusDetail == true {
            scrollViewDetails.addSubview(pWayLabel)
            scrollViewDetails.addSubview(pWayButton)
            scrollViewDetails.addSubview(pControlExitLabel)
            scrollViewDetails.addSubview(pControlExitButton)
                if coreDataCalculation.pExitHearth < 55 {
                    scrollViewDetails.addSubview(infoLabelHearth)
                }
            scrollViewDetails.addSubview(timeWorkToHearthLabel)
            scrollViewDetails.addSubview(timeWorkToHearthButton)
            scrollViewDetails.addSubview(timeExitFromHearthLabel)
            scrollViewDetails.addSubview(timeExitFromHearthButton)
        }
    }
    private func labelText(_ ffNum: Int) {
        pMaxDownLabel.latex = " \\frac{\(coreDataCalculation.pMinAir)-\(coreDataCalculation.reducerPressure)}{\(coreDataCalculation.complexity ?   "3" :"2.5")} = \(coreDataCalculation.pMaxDown) bar (Kg/Cm^2)"
        pExitLabel.latex = " {\(coreDataCalculation.pMinAir)-\(coreDataCalculation.pMaxDown)} = \(coreDataCalculation.pExit) bar (Kg/Cm^2)"
        tExitLabel.latex = " \\frac{\(coreDataCalculation.pMaxDown) * \(coreDataCalculation.vBallons)}{\(coreDataCalculation.airFlow) * \(coreDataCalculation.compressionFactor)} = \(coreDataCalculation.tExit) Min."
        tComandExitLabel.latex = "{\(coreDataInfo.inputTime.TimeFormat)+\(coreDataCalculation.tExit)} = \(coreDataCalculation.calculationsTime(time: coreDataInfo.inputTime, toTime: coreDataCalculation.tExit)!)"
        tAllWorkLabel.latex = " \\frac{({\(coreDataCalculation.pMinAir)-\(coreDataCalculation.reducerPressure)}) * \(coreDataCalculation.vBallons)}{\(coreDataCalculation.airFlow) * \(coreDataCalculation.compressionFactor)} = \(coreDataCalculation.tAllExit) Min."
        tFactExitLabel.latex = "{\(coreDataInfo.inputTime.TimeFormat) + \(coreDataCalculation.tAllExit)} = {\(coreDataCalculation.calculationsTime(time: coreDataInfo.inputTime, toTime: coreDataCalculation.tAllExit)!)}"
        if heartsStatusDetail == true {
        switch ffNum {
        case 2: pWayLabel.text =
            """
            P1пути = (\(coreDataCalculation.FF1) - \(coreDataCalculation.FF1_h)) = \(coreDataCalculation.FF1 - coreDataCalculation.FF1_h)
            P2пути = (\(coreDataCalculation.FF2) - \(coreDataCalculation.FF2_h)) = \(coreDataCalculation.FF2 - coreDataCalculation.FF2_h)
            """
        case 3: pWayLabel.text =
            """
            P1пути = (\(coreDataCalculation.FF1) - \(coreDataCalculation.FF1_h)) = \(coreDataCalculation.FF1 - coreDataCalculation.FF1_h)
            P2пути = (\(coreDataCalculation.FF2) - \(coreDataCalculation.FF2_h)) = \(coreDataCalculation.FF2 - coreDataCalculation.FF2_h)
            P3пути = (\(coreDataCalculation.FF3) - \(coreDataCalculation.FF3_h)) = \(coreDataCalculation.FF3 - coreDataCalculation.FF3_h)
            """
        case 4: pWayLabel.text =
            """
            P1пути = (\(coreDataCalculation.FF1) - \(coreDataCalculation.FF1_h)) = \(coreDataCalculation.FF1 - coreDataCalculation.FF1_h)
            P2пути = (\(coreDataCalculation.FF2) - \(coreDataCalculation.FF2_h)) = \(coreDataCalculation.FF2 - coreDataCalculation.FF2_h)
            P3пути = (\(coreDataCalculation.FF3) - \(coreDataCalculation.FF3_h)) = \(coreDataCalculation.FF3 - coreDataCalculation.FF3_h)
            P4пути = (\(coreDataCalculation.FF4) - \(coreDataCalculation.FF4_h)) = \(coreDataCalculation.FF4 - coreDataCalculation.FF4_h)
            """
        case 5: pWayLabel.text =
            """
            P1пути = (\(coreDataCalculation.FF1) - \(coreDataCalculation.FF1_h)) = \(coreDataCalculation.FF1 - coreDataCalculation.FF1_h)
            P2пути = (\(coreDataCalculation.FF2) - \(coreDataCalculation.FF2_h)) = \(coreDataCalculation.FF2 - coreDataCalculation.FF2_h)
            P3пути = (\(coreDataCalculation.FF3) - \(coreDataCalculation.FF3_h)) = \(coreDataCalculation.FF3 - coreDataCalculation.FF3_h)
            P4пути = (\(coreDataCalculation.FF4) - \(coreDataCalculation.FF4_h)) = \(coreDataCalculation.FF4 - coreDataCalculation.FF4_h)
            P5пути = (\(coreDataCalculation.FF5) - \(coreDataCalculation.FF5_h)) = \(coreDataCalculation.FF5 - coreDataCalculation.FF5_h)
            """
        default: break
        }
            if coreDataInfo.complexityStatus == false {
                pControlExitLabel.latex = "\(coreDataCalculation.pMaxDownHearth/2) + \(coreDataCalculation.pMaxDownHearth) + \(coreDataCalculation.reducerPressure) = \(coreDataCalculation.pExitHearth)"
            } else {
                pControlExitLabel.latex = "\(coreDataCalculation.pMaxDownHearth) + \(coreDataCalculation.pMaxDownHearth) + \(coreDataCalculation.reducerPressure) = \(coreDataCalculation.pExitHearth)"
            }
            timeWorkToHearthLabel.latex = " \\frac{({\(coreDataCalculation.pMinAirHearth)-\(coreDataCalculation.pExitHearth)}) * \(coreDataCalculation.vBallons)}{\(coreDataCalculation.airFlow) * \(coreDataCalculation.compressionFactor)} = \(coreDataCalculation.tWorkHearth)"
            timeExitFromHearthLabel.latex = "{\(coreDataInfo.heartFoundTime.TimeFormat)+\(coreDataCalculation.tWorkHearth)} = \(coreDataCalculation.calculationsTime(time: coreDataInfo.heartFoundTime, toTime: coreDataCalculation.tWorkHearth)!)"
        }
        
    }
    
    private func calculsationResultDetails(_ ff: Int, _ hearts: Bool) {
        switch ff {
        case 5:
            switch hearts {
            case true:
                coreDataCalculation.FF5_h = coreDataInfo.p5Hearth
                fallthrough
            case false:
                coreDataCalculation.FF5 = coreDataInfo.FireFighter5
            }
            fallthrough
        case 4:
            switch hearts {
            case true:
                coreDataCalculation.FF4_h = coreDataInfo.p4Hearth
                fallthrough
            case false:
                coreDataCalculation.FF4 = coreDataInfo.FireFighter4
            }
            fallthrough
        case 3:
            switch hearts {
            case true:
                coreDataCalculation.FF3_h = coreDataInfo.p3Hearth
                fallthrough
            case false:
                coreDataCalculation.FF3 = coreDataInfo.FireFighter3
            }
            fallthrough
        case 2:
            switch hearts {
            case true:
                coreDataCalculation.FF1_h = coreDataInfo.p1Hearth
                coreDataCalculation.FF2_h = coreDataInfo.p2Hearth
                fallthrough
            case false:
                coreDataCalculation.FF1 = coreDataInfo.FireFighter1
                coreDataCalculation.FF2 = coreDataInfo.FireFighter2
            }
        default: break
        }
        coreDataCalculation.complexity = coreDataInfo.complexityStatus
        coreDataCalculation.calculationWork(FFint: ff)
        labelText(ff)
    }
    
    private func layoutSettingElements() {
        scrollViewDetails.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollViewDetails.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollViewDetails.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollViewDetails.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //----
        pMaxDownButton.layOutSettingButton(scrollViewDetails.topAnchor, 20,
                                           scrollViewDetails.leadingAnchor, 20,
                                           pMaxDownLabel.leadingAnchor, 0,
                                           pMaxDownLabel.bottomAnchor, 0)
        pMaxDownLabel.topAnchor.constraint(equalTo: pMaxDownButton.topAnchor).isActive = true
        pMaxDownLabel.fontSettingMTM(Double(view.bounds.height))
        //----
        pExitButton.layOutSettingButton(pMaxDownLabel.bottomAnchor, 20,
                                        pMaxDownButton.leadingAnchor, 0,
                                        pExitLabel.leadingAnchor, 0,
                                        pExitLabel.bottomAnchor, 0)
        pExitLabel.topAnchor.constraint(equalTo: pExitButton.topAnchor).isActive = true
        // -+-
        pExitLabel.fontSettingMTM(Double(view.bounds.height))
        //----
        tExitButton.layOutSettingButton(pExitButton.bottomAnchor, 20,
                                        pMaxDownButton.leadingAnchor, 0,
                                        tExitLabel.leadingAnchor, 0,
                                        tExitLabel.bottomAnchor, 0)
        tExitLabel.topAnchor.constraint(equalTo: tExitButton.topAnchor).isActive = true
        // -+-
        tExitLabel.fontSettingMTM(Double(view.bounds.height))
        //-----
        tComandExitButton.layOutSettingButton(tExitButton.bottomAnchor, 20,
                                              pMaxDownButton.leadingAnchor, 0,
                                              tComandExitLabel.leadingAnchor, 0,
                                              tComandExitLabel.bottomAnchor, 0)
        tComandExitLabel.topAnchor.constraint(equalTo: tComandExitButton.topAnchor).isActive = true
        // -+-
        tComandExitLabel.fontSettingMTM(Double(view.bounds.height))
        //-----
        tAllWorkButton.layOutSettingButton(tComandExitButton.bottomAnchor, 20,
                                           pMaxDownButton.leadingAnchor, 0,
                                           tAllWorkLabel.leadingAnchor, 0,
                                           tAllWorkLabel.bottomAnchor, 0)
        tAllWorkLabel.topAnchor.constraint(equalTo: tAllWorkButton.topAnchor).isActive = true
        // -+-
        tAllWorkLabel.fontSettingMTM(Double(view.bounds.height))
        //-----
        tFactExitButton.layOutSettingButton(tAllWorkButton.bottomAnchor, 20,
                                            pMaxDownButton.leadingAnchor, 0,
                                            tFactExitLabel.leadingAnchor, 0,
                                            tFactExitLabel.bottomAnchor, 0)
        tFactExitLabel.topAnchor.constraint(equalTo: tFactExitButton.topAnchor).isActive = true
        // -+-
        tAllWorkLabel.fontSettingMTM(Double(view.bounds.height))
        //------
        if heartsStatusDetail == true {
            pWayButton.layOutSettingButton(tFactExitButton.bottomAnchor, 20,
                                           pMaxDownButton.leadingAnchor, 0,
                                           pWayLabel.leadingAnchor, 0,
                                           pWayLabel.bottomAnchor, 0)
            pWayLabel.topAnchor.constraint(equalTo: pWayButton.topAnchor).isActive = true
            //------
            pControlExitButton.layOutSettingButton(pWayButton.bottomAnchor, 20,
                                                   pMaxDownButton.leadingAnchor, 0,
                                                   pControlExitLabel.leadingAnchor, 0,
                                                   pControlExitLabel.bottomAnchor, 0)
            pControlExitLabel.topAnchor.constraint(equalTo: pControlExitButton.topAnchor).isActive = true
            pControlExitLabel.fontSettingMTM(Double(view.bounds.height))
            //------
            if coreDataCalculation.pExitHearth < 55 {
                infoLabelHearth.layOutSettingLabel(pControlExitButton.bottomAnchor, 20,
                                                   pControlExitButton.leadingAnchor, 0,
                                                   pControlExitLabel.trailingAnchor, 0,
                                                   nil, 0)
                timeWorkToHearthButton.topAnchor.constraint(equalTo: infoLabelHearth.bottomAnchor, constant: 20).isActive = true
            } else {
                timeWorkToHearthButton.topAnchor.constraint(equalTo: pControlExitButton.bottomAnchor, constant: 20).isActive = true
            }
            timeWorkToHearthButton.leadingAnchor.constraint(equalTo: pMaxDownButton.leadingAnchor).isActive = true
            timeWorkToHearthButton.trailingAnchor.constraint(equalTo: timeWorkToHearthLabel.leadingAnchor).isActive = true
            timeWorkToHearthButton.bottomAnchor.constraint(equalTo: timeWorkToHearthLabel.bottomAnchor).isActive = true
            timeWorkToHearthLabel.topAnchor.constraint(equalTo: timeWorkToHearthButton.topAnchor).isActive = true
            // -+-
            timeWorkToHearthLabel.fontSettingMTM(Double(view.bounds.height))
            //------
            timeExitFromHearthButton.layOutSettingButton(timeWorkToHearthButton.bottomAnchor, 20,
                                                         pMaxDownButton.leadingAnchor, 0,
                                                         timeExitFromHearthLabel.leadingAnchor, 0,
                                                         timeExitFromHearthLabel.bottomAnchor, 0)
            timeExitFromHearthLabel.topAnchor.constraint(equalTo: timeExitFromHearthButton.topAnchor).isActive = true
            // -+-
            timeExitFromHearthLabel.fontSettingMTM(Double(view.bounds.height))
        }
        //------
    }
    @objc func InfoFunc() {
        
    }
}
