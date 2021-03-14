//
//  ResultOfCalculationViewController.swift
//  FireFighters
//
//  Created by Павел on 27.11.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class ResultOfCalculationViewController: UIViewController {
    let coreCalculation = newCalc() // Calculation
    let coreDataCalculation = CalculationInfo.CalculationInform // Data in coreData
    var numberFireFighters = 2
    
    var heartsStatus = false
    
    let pressureExitLabel: UILabel = { //Контрольное давление или П Пути
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timeAllWorkLabel: UILabel = { //Общее время работы
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let expectedTimeBack: UILabel = { //Ожидаемое время возвращения
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var timeWorkatHerth: UILabel = { //время работы у очага
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var feedingTime: UILabel = { // время подачи команды
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deteilResulButton: profileCustomButton = {
        let button = profileCustomButton()
        button.setTitle("Просмотр решения", for: .normal)
        button.addTarget(self, action: #selector(detailResultViewOpen), for: .touchUpInside)
        return button
    }()
    
    override func viewWillLayoutSubviews() {
        navigationController?.navigationBar.prefersLargeTitles = false
        layoutSettingUIElements()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculationFunction(numberFireFighters)
        addElements()
        
    }
    
    
    func addElements() {
        view.addSubview(pressureExitLabel)
        view.addSubview(timeAllWorkLabel)
        view.addSubview(expectedTimeBack)
        view.addSubview(timeWorkatHerth)
        view.addSubview(feedingTime)
        view.addSubview(deteilResulButton)
    }
    
    func layoutSettingUIElements() {
        self.view.viewThemeColor()
        pressureExitLabel.darkThemeLabel()
        timeAllWorkLabel.darkThemeLabel()
        expectedTimeBack.darkThemeLabel()
        timeWorkatHerth.darkThemeLabel()
        feedingTime.darkThemeLabel()
        deteilResulButton.DarkThemeButton()
        
        pressureExitLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        pressureExitLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        pressureExitLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        timeAllWorkLabel.topAnchor.constraint(equalTo: pressureExitLabel.bottomAnchor, constant: 20).isActive = true
        timeAllWorkLabel.leadingAnchor.constraint(equalTo: pressureExitLabel.leadingAnchor).isActive = true
        timeAllWorkLabel.trailingAnchor.constraint(equalTo: pressureExitLabel.trailingAnchor).isActive = true
        
        expectedTimeBack.topAnchor.constraint(equalTo: timeAllWorkLabel.bottomAnchor, constant: 20).isActive = true
        expectedTimeBack.leadingAnchor.constraint(equalTo: pressureExitLabel.leadingAnchor).isActive = true
        expectedTimeBack.trailingAnchor.constraint(equalTo: pressureExitLabel.trailingAnchor).isActive = true
        
        timeWorkatHerth.topAnchor.constraint(equalTo: expectedTimeBack.bottomAnchor, constant: 20).isActive = true
        timeWorkatHerth.leadingAnchor.constraint(equalTo: pressureExitLabel.leadingAnchor).isActive = true
        timeWorkatHerth.trailingAnchor.constraint(equalTo: pressureExitLabel.trailingAnchor).isActive = true
        
        feedingTime.topAnchor.constraint(equalTo: timeWorkatHerth.bottomAnchor, constant: 20).isActive = true
        feedingTime.leadingAnchor.constraint(equalTo: pressureExitLabel.leadingAnchor).isActive = true
        feedingTime.trailingAnchor.constraint(equalTo: pressureExitLabel.trailingAnchor).isActive = true
        
        switch heartsStatus {
            case false: deteilResulButton.topAnchor.constraint(equalTo: expectedTimeBack.bottomAnchor, constant: 20).isActive = true
            case true: deteilResulButton.topAnchor.constraint(equalTo: feedingTime.bottomAnchor, constant: 20).isActive = true
        }
        deteilResulButton.leadingAnchor.constraint(equalTo: feedingTime.leadingAnchor).isActive = true
        deteilResulButton.trailingAnchor.constraint(equalTo: feedingTime.trailingAnchor).isActive = true
        deteilResulButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    
    func calculationFunction(_ int: Int) {
        switch int {
        case 2:
            switch heartsStatus {
            case false:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExit) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "Через \(coreCalculation.tAllExit) мин должен подать команду на возвращение (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 13)"
            case true:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF1_h = coreDataCalculation.p1Hearth
                coreCalculation.FF2_h = coreDataCalculation.p2Hearth
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExitHearth) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "\(coreCalculation.tAllExit) мин максимальное время пребывания звена в НДДС (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 12)"
                timeWorkatHerth.text = "Звено может работать \(coreCalculation.tWorkHearth) мин у очага"
                feedingTime.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.heartFoundTime, toTime: coreCalculation.tWorkHearth)!) постовой должен подать команду на возврашение звена (Столбец № 14)"
                
            }
        case 3:
            switch heartsStatus {
            case false:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExit) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "Через \(coreCalculation.tAllExit) мин должен подать команду на возвращение (Столбец №  11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 13)"
            case true:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.FF1_h = coreDataCalculation.p1Hearth
                coreCalculation.FF2_h = coreDataCalculation.p2Hearth
                coreCalculation.FF3_h = coreDataCalculation.p3Hearth
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExitHearth) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "\(coreCalculation.tAllExit) мин максимальное время пребывания звена в НДДС (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 12)"
                timeWorkatHerth.text = "Звено может работать \(coreCalculation.tWorkHearth) мин у очага"
                feedingTime.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.heartFoundTime, toTime: coreCalculation.tWorkHearth)!) постовой должен подать команду на возврашение звена (Столбец № 14)"
                
            }
        case 4:
            switch heartsStatus {
            case false:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.FF4 = coreDataCalculation.FireFighter4
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExit) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "Через \(coreCalculation.tAllExit) мин должен подать команду на возвращение (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 13)"
            case true:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.FF4 = coreDataCalculation.FireFighter4
                coreCalculation.FF1_h = coreDataCalculation.p1Hearth
                coreCalculation.FF2_h = coreDataCalculation.p2Hearth
                coreCalculation.FF3_h = coreDataCalculation.p3Hearth
                coreCalculation.FF4_h = coreDataCalculation.p4Hearth
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExitHearth) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "\(coreCalculation.tAllExit) мин максимальное время пребывания звена в НДДС (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 12)"
                timeWorkatHerth.text = "Звено может работать \(coreCalculation.tWorkHearth) мин у очага"
                feedingTime.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.heartFoundTime, toTime: coreCalculation.tWorkHearth)!) постовой должен подать команду на возврашение звена (Столбец № 14)"
                
            }
        case 5:
            switch heartsStatus {
            case false:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.FF4 = coreDataCalculation.FireFighter4
                coreCalculation.FF5 = coreDataCalculation.FireFighter5
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExit) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "Через \(coreCalculation.tAllExit) мин должен подать команду на возвращение (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец № 13)"
            case true:
                coreCalculation.FF1 = coreDataCalculation.FireFighter1
                coreCalculation.FF2 = coreDataCalculation.FireFighter2
                coreCalculation.FF3 = coreDataCalculation.FireFighter3
                coreCalculation.FF4 = coreDataCalculation.FireFighter4
                coreCalculation.FF5 = coreDataCalculation.FireFighter5
                coreCalculation.FF1_h = coreDataCalculation.p1Hearth
                coreCalculation.FF2_h = coreDataCalculation.p2Hearth
                coreCalculation.FF3_h = coreDataCalculation.p3Hearth
                coreCalculation.FF4_h = coreDataCalculation.p4Hearth
                coreCalculation.FF5_h = coreDataCalculation.p5Hearth
                coreCalculation.complexity = coreDataCalculation.complexityStatus
                coreCalculation.calculationWork(FFint: int)
                //result
                pressureExitLabel.text = "При \(coreCalculation.pExitHearth) Бар звено должно покинуть НДДС (Столбец № 10)"
                timeAllWorkLabel.text = "\(coreCalculation.tAllExit) мин максимальное время пребывания звена в НДДС (Столбец № 11)"
                expectedTimeBack.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.inputTime, toTime: coreCalculation.tAllExit)!) звено должно выйти из НДДС (Столбец 12)"
                timeWorkatHerth.text = "Звено может работать \(coreCalculation.tWorkHearth) мин у очага"
                feedingTime.text = "В \(coreCalculation.calculationsTime(time: coreDataCalculation.heartFoundTime, toTime: coreCalculation.tWorkHearth)!) постовой должен подать команду на возврашение звена (Столбец № 14)"
            }
        default: break
        }
    }
    @objc func detailResultViewOpen() {
        let nextView = detailsResultVC()
        nextView.heartsStatusDetail = heartsStatus
        nextView.numbersFireFightersDetails = numberFireFighters
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
