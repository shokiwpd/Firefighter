//
//  CalculationAtHearthVC.swift
//  FireFighters
//
//  Created by Павел on 27.11.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class CalculationAtHearthVC: UIViewController {
    //MARK: UIlabel page
    let infolabel: UILabel = {
        let text = UILabel()
        text.text = "Если без очага, То нажите (Без очага)"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let HearthFireFightersLabel1: UILabel = {
        let text = UILabel()
        text.text = "Пожарный 1(Р1):"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    let HearthFireFightersLabel2: UILabel = {
        let text = UILabel()
        text.text = "Пожарный 2(Р2):"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
   lazy var HearthFireFightersLabel3: UILabel = {
        let text = UILabel()
        text.text = "Пожарный 3(Р3):"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    lazy var HearthFireFightersLabel4: UILabel = {
        let text = UILabel()
        text.text = "Пожарный 4(Р4):"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    lazy var HearthFireFightersLabel5: UILabel = {
        let text = UILabel()
        text.text = "Пожарный 5(Р5):"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    //MARK: UITextField page
    let HearthFireFightersTextField1: profileEdithText = {
        let text = profileEdithText()
        text.keyboardType = .numberPad
        text.tag = 0
        return text
    }()
    let HearthFireFightersTextField2: profileEdithText = {
        let text = profileEdithText()
        text.keyboardType = .numberPad
        text.tag = 1
        return text
    }()
    lazy var HearthFireFightersTextField3: profileEdithText = {
        let text = profileEdithText()
        text.keyboardType = .numberPad
        text.tag = 2
        return text
    }()
    lazy var HearthFireFightersTextField4: profileEdithText = {
        let text = profileEdithText()
        text.keyboardType = .numberPad
        text.tag = 3
        return text
    }()
    lazy var HearthFireFightersTextField5: profileEdithText = {
        let text = profileEdithText()
        text.keyboardType = .numberPad
        text.tag = 4
        return text
    }()
    
    //MARK: timePicker
    var timeHearth: UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .time
        
        if #available(iOS 13.4, *) {
            time.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()

    let openResulView: profileCustomButton = {
        let button = profileCustomButton()
        button.setTitle("Без очага", for: .normal)
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        return button
    }()
    //MARK: Option page
    var numberFireFightersHearth = 2
    var typeInfoHearth = "" // Fire || no Frie
    var complexityInfoHearth = false // SL || No SL
    let coreHearthCalculation = CalculationInfo.CalculationInform
    let chekingInteger = "^(?=.*\\d)[\\d]{0,3}$"

    
    override func viewWillLayoutSubviews() {
        themeColorUIkitHearts(numberFireFightersHearth)
        layOutSettingUIkit(numberFireFightersHearth)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        addElementUIKit(numberFireFightersHearth)
        timeHearth.date = coreHearthCalculation.inputTime
        HearthFireFightersTextField1.delegate = self
        HearthFireFightersTextField2.delegate = self
        HearthFireFightersTextField3.delegate = self
        HearthFireFightersTextField4.delegate = self
        HearthFireFightersTextField5.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
// создание объкутов в зависимости от числа пожарных
        func addElementUIKit(_ num: Int){
            switch num {
            case 5:
                view.addSubview(HearthFireFightersLabel5)
                view.addSubview(HearthFireFightersTextField5)
                    HearthFireFightersTextField5.placeholder = String(coreHearthCalculation.FireFighter5)
                fallthrough
            case 4:
                view.addSubview(HearthFireFightersLabel4)
                view.addSubview(HearthFireFightersTextField4)
                    HearthFireFightersTextField4.placeholder = String(coreHearthCalculation.FireFighter4)
                fallthrough
            case 3:
                view.addSubview(HearthFireFightersLabel3)
                view.addSubview(HearthFireFightersTextField3)
                    HearthFireFightersTextField3.placeholder = String(coreHearthCalculation.FireFighter3)
                fallthrough
            case 2:
                view.addSubview(infolabel)
                view.addSubview(HearthFireFightersLabel1)
                view.addSubview(HearthFireFightersTextField1)
                    HearthFireFightersTextField1.placeholder = String(coreHearthCalculation.FireFighter1)
                view.addSubview(HearthFireFightersLabel2)
                view.addSubview(HearthFireFightersTextField2)
                    HearthFireFightersTextField2.placeholder = String(coreHearthCalculation.FireFighter2)
                view.addSubview(timeHearth)
                view.addSubview(openResulView)
            default: break
            }
        }
    
    
    
    //Layout setting
    
    func layOutSettingUIkit(_ ff: Int){
        switch ff {
        case 5:
        //Hearth FF5
            HearthFireFightersLabel5.layOutSettingLabel(self.HearthFireFightersLabel4.bottomAnchor, 20,
                                                        self.HearthFireFightersLabel4.leadingAnchor, 0,
                                                        nil, 0,
                                                        nil, 0)
            HearthFireFightersLabel5.heightLabel(30)
            HearthFireFightersTextField5.layOutSettingTextField(self.HearthFireFightersLabel5.topAnchor, 0,
                                                                nil, 0,
                                                                self.HearthFireFightersTextField1.trailingAnchor, 0,
                                                                nil, 0)
            HearthFireFightersTextField5.heightTextField(30)
            HearthFireFightersTextField5.widthTextField(100)
            if ff == 5 {
                timeHearth.topAnchor.constraint(equalTo: self.HearthFireFightersLabel5.bottomAnchor, constant: 20).isActive = true
            }
            fallthrough
        case 4:
        //Hearth FF4
            HearthFireFightersLabel4.layOutSettingLabel(self.HearthFireFightersLabel3.bottomAnchor, 20,
                                                        self.HearthFireFightersLabel3.leadingAnchor, 0,
                                                        nil, 0,
                                                        nil, 0)
            HearthFireFightersLabel4.heightLabel(30)
            HearthFireFightersTextField4.layOutSettingTextField(self.HearthFireFightersLabel4.topAnchor, 0,
                                                                nil, 0,
                                                                self.HearthFireFightersTextField1.trailingAnchor, 0,
                                                                nil, 0)
            HearthFireFightersTextField4.heightTextField(30)
            HearthFireFightersTextField4.widthTextField(100)
            if ff == 4 {
                timeHearth.topAnchor.constraint(equalTo: self.HearthFireFightersLabel4.bottomAnchor, constant: 20).isActive = true
            }
            fallthrough
        case 3:
            //Hearth FF3
            HearthFireFightersLabel3.layOutSettingLabel(self.HearthFireFightersLabel2.bottomAnchor, 20,
                                                        self.HearthFireFightersLabel2.leadingAnchor, 0,
                                                        nil, 0,
                                                        nil, 0)
            HearthFireFightersLabel3.heightLabel(30)
            HearthFireFightersTextField3.layOutSettingTextField(self.HearthFireFightersLabel3.topAnchor, 0,
                                                                nil, 0,
                                                                self.HearthFireFightersTextField1.trailingAnchor, 0,
                                                                nil, 0)
            HearthFireFightersTextField3.heightTextField(30)
            HearthFireFightersTextField3.widthTextField(100)
            if ff == 3 {
                timeHearth.topAnchor.constraint(equalTo: self.HearthFireFightersLabel3.bottomAnchor, constant: 20).isActive = true
            }
            fallthrough
        case 2:
            infolabel.layOutSettingLabel(self.view.safeAreaLayoutGuide.topAnchor, 20,
                                         self.view.leadingAnchor, 20,
                                         self.view.trailingAnchor, -20,
                                         nil, 0)
            //Hearth FF1
            HearthFireFightersLabel1.layOutSettingLabel(self.infolabel.bottomAnchor, 10,
                                                        self.infolabel.leadingAnchor, 0,
                                                        nil, 0,
                                                        nil, 0)
            HearthFireFightersLabel1.heightLabel(30)
            HearthFireFightersTextField1.layOutSettingTextField(HearthFireFightersLabel1.topAnchor, 0,
                                                                nil, 0,
                                                                self.infolabel.trailingAnchor, 0,
                                                                nil, 0)
            HearthFireFightersTextField1.heightTextField(30)
            HearthFireFightersTextField1.widthTextField(100)
            //Hearth FF2
            HearthFireFightersLabel2.layOutSettingLabel(self.HearthFireFightersLabel1.bottomAnchor, 20,
                                                        self.HearthFireFightersLabel1.leadingAnchor, 0,
                                                        nil, 0,
                                                        nil, 0)
            HearthFireFightersLabel2.heightLabel(30)
            HearthFireFightersTextField2.layOutSettingTextField(self.HearthFireFightersLabel2.topAnchor, 0,
                                                                nil, 0,
                                                                self.HearthFireFightersTextField1.trailingAnchor, 0,
                                                                nil, 0)
            HearthFireFightersTextField2.heightTextField(30)
            HearthFireFightersTextField2.widthTextField(100)
            if ff == 2 {
                timeHearth.topAnchor.constraint(equalTo: self.HearthFireFightersLabel2.bottomAnchor, constant: 20).isActive = true
            }
            timeHearth.leadingAnchor.constraint(equalTo: HearthFireFightersLabel1.leadingAnchor).isActive = true
            timeHearth.trailingAnchor.constraint(equalTo: HearthFireFightersTextField1.trailingAnchor).isActive = true
            timeHearth.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
            openResulView.layOutSettingButton(timeHearth.bottomAnchor, 50,
                                              timeHearth.leadingAnchor, 0,
                                              timeHearth.trailingAnchor, 0,
                                              nil, 0)
            openResulView.heightButton(50)
        default: break
        }
    }
    
    
    // настройка темной темы
    func themeColorUIkitHearts(_ int: Int){
        self.view.viewThemeColor()
        self.openResulView.DarkThemeButton()
        switch int {
        case 5:
            self.HearthFireFightersLabel5.darkThemeLabel()
            self.HearthFireFightersTextField5.textFieldDarkTheme()
            self.HearthFireFightersTextField5.addLines(w: 100)
            fallthrough
        case 4:
            self.HearthFireFightersLabel4.darkThemeLabel()
            self.HearthFireFightersTextField4.textFieldDarkTheme()
            self.HearthFireFightersTextField4.addLines(w: 100)
            fallthrough
        case 3:
            self.HearthFireFightersLabel3.darkThemeLabel()
            self.HearthFireFightersTextField3.textFieldDarkTheme()
            self.HearthFireFightersTextField3.addLines(w: 100)
            fallthrough
        case 2:
            self.infolabel.darkThemeLabel()
            self.HearthFireFightersLabel1.darkThemeLabel()
            self.HearthFireFightersLabel2.darkThemeLabel()
            self.HearthFireFightersTextField1.textFieldDarkTheme()
            self.HearthFireFightersTextField2.textFieldDarkTheme()
            self.HearthFireFightersTextField1.addLines(w: 100)
            self.HearthFireFightersTextField2.addLines(w: 100)
            self.timeHearth.darkThemeDatePicker()
        default: break
        }
    }
    
    // проверка на соответствие вводимых символов
private func chekingInform(_ st: String) {
    guard st.chekingIntegerString(chekingInteger) else {return AlertView(text: "Длина символов не может превышать трёх знаков или иметь точку!")}
    
    }
    // Проверка на пустые ячейки и соотношение давления у очага и включения
    func calculationResultAndNextView(){
        let resultNextView = ResultOfCalculationViewController()
        if openResulView.tag == 1 {
            let clearError = "Вы указали не все данные!"
            switch numberFireFightersHearth {
            case 2:
                guard HearthFireFightersTextField1.text! != "", HearthFireFightersTextField2.text! != "" else { return AlertView(text: clearError)}
                coreHearthCalculation.p1Hearth = Int(HearthFireFightersTextField1.text!)!
                coreHearthCalculation.p2Hearth = Int(HearthFireFightersTextField2.text!)!
                coreHearthCalculation.heartFoundTime = timeHearth.date
            case 3:
                guard HearthFireFightersTextField1.text != "", HearthFireFightersTextField2.text != "", HearthFireFightersTextField3.text != "" else {return AlertView(text: clearError)}
                coreHearthCalculation.p1Hearth = Int(HearthFireFightersTextField1.text!)!
                coreHearthCalculation.p2Hearth = Int(HearthFireFightersTextField2.text!)!
                coreHearthCalculation.p3Hearth = Int(HearthFireFightersTextField3.text!)!
                coreHearthCalculation.heartFoundTime = timeHearth.date
            case 4:
                guard HearthFireFightersTextField1.text != "", HearthFireFightersTextField2.text != "", HearthFireFightersTextField3.text != "", HearthFireFightersLabel4.text != "" else {return AlertView(text: clearError)}
                coreHearthCalculation.p1Hearth = Int(HearthFireFightersTextField1.text!)!
                coreHearthCalculation.p2Hearth = Int(HearthFireFightersTextField2.text!)!
                coreHearthCalculation.p3Hearth = Int(HearthFireFightersTextField3.text!)!
                coreHearthCalculation.p4Hearth = Int(HearthFireFightersTextField4.text!)!
                coreHearthCalculation.heartFoundTime = timeHearth.date
            case 5:
                guard HearthFireFightersTextField1.text != "", HearthFireFightersTextField2.text != "", HearthFireFightersTextField3.text != "", HearthFireFightersLabel4.text != "", HearthFireFightersTextField5.text != "" else {return AlertView(text: clearError)}
                coreHearthCalculation.p1Hearth = Int(HearthFireFightersTextField1.text!)!
                coreHearthCalculation.p2Hearth = Int(HearthFireFightersTextField2.text!)!
                coreHearthCalculation.p3Hearth = Int(HearthFireFightersTextField3.text!)!
                coreHearthCalculation.p4Hearth = Int(HearthFireFightersTextField4.text!)!
                coreHearthCalculation.p5Hearth = Int(HearthFireFightersTextField5.text!)!
                coreHearthCalculation.heartFoundTime = timeHearth.date
            default: break
            }
            self.navigationController?.pushViewController(resultNextView, animated: true)
            resultNextView.heartsStatus = true
            resultNextView.numberFireFighters = numberFireFightersHearth
        } else {
            self.navigationController?.pushViewController(resultNextView, animated: true)
            resultNextView.heartsStatus = false
            resultNextView.numberFireFighters = numberFireFightersHearth
        }
    }
    @objc func pushButton() {
        calculationResultAndNextView()
    }
    // Переключение темной темы
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                    self.themeColorUIkitHearts(self.numberFireFightersHearth)
                self.view.layoutIfNeeded()
            }
        }
    }
}

// Проверка на символы и их число
extension CalculationAtHearthVC: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let cheking = textField.text! + string
            chekingInform(cheking)
            switch textField.tag {
            case 0:
                if Int(cheking)! >= Int(coreHearthCalculation.FireFighter1) {AlertView(text: "Давление не может быть больше или равным \(Int(coreHearthCalculation.FireFighter1))")}
            case 1:
                if Int(cheking)! >= Int(coreHearthCalculation.FireFighter2) {AlertView(text: "Давление не может быть больше или равным \(Int(coreHearthCalculation.FireFighter2))")}
            case 2:
                if Int(cheking)! >= Int(coreHearthCalculation.FireFighter3) {AlertView(text: "Давление не может быть больше или равным \(Int(coreHearthCalculation.FireFighter3))")}
            case 3:
                if Int(cheking)! >= Int(coreHearthCalculation.FireFighter4) {AlertView(text: "Давление не может быть больше или равным \(Int(coreHearthCalculation.FireFighter4))")}
            case 4:
                if Int(cheking)! >= Int(coreHearthCalculation.FireFighter5) {AlertView(text: "Давление не может быть больше или равным \(Int(coreHearthCalculation.FireFighter5))")}
            default: break
            }
            return true
        }
    
//Название кнопки в зависимотси от расчетов ("Без очага при пусиых формах" и "У очага" с заполнеными формами
    func textFieldDidEndEditing(_ textField: UITextField) {
        if HearthFireFightersTextField1.text != "" {
            openResulView.setTitle("У очага", for: .normal)
            openResulView.tag = 1
        } else {
            openResulView.setTitle("Без очага", for: .normal)
            openResulView.tag = 0
        }
    }
}
