//
//  startCalcViewController.swift
//  FireFighters
//
//  Created by Павел on 10.10.2020.
//  Copyright © 2020 Павел. All rights reserved.
//
// Работа с первым экраном расчетов
// Упрощение по мере изучения
//
//
//
import UIKit
import IQKeyboardManagerSwift

class startCalcViewController: UIViewController {
    let viewName = "startCulcViewController"
    
    //MARK: UILabel page
    let FireFightersLabel1:UILabel = {
        let label = UILabel()
        label.text = "Пожарный 1(Р1):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let FireFightersLabel2:UILabel = {
        let label = UILabel()
        label.text = "Пожарный 2(Р2):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var FireFightersLabel3:UILabel = {
        let label = UILabel()
        label.text = "Пожарный 3(Р3):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var FireFightersLabel4:UILabel = {
        let label = UILabel()
        label.text = "Пожарный 4(Р4):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var FireFightersLabel5:UILabel = {
        let label = UILabel()
        label.text = "Пожарный 5(Р5):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timeDatePickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Время включения:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timeOn: UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .time
        if #available(iOS 13.4, *) {
            time.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        time.translatesAutoresizingMaskIntoConstraints = false
//        time.locale =
        return time
    }()
 
    
    //MARK: UITextfield page
    let FireFightersTextField1: profileEdithText = {
        let text = profileEdithText()
        text.tag = 0
        text.keyboardType = .numberPad
        return text
    }()
    let FireFightersTextField2: profileEdithText = {
        let text = profileEdithText()
        text.tag = 1
        text.keyboardType = .numberPad
        return text
    }()
    lazy var FireFightersTextField3: profileEdithText = {
        let text = profileEdithText()
        text.tag = 2
        text.keyboardType = .numberPad
        return text
    }()
    lazy var FireFightersTextField4: profileEdithText = {
        let text = profileEdithText()
        text.tag = 3
        text.keyboardType = .numberPad
        return text
    }()
    lazy var FireFightersTextField5: profileEdithText = {
        let text = profileEdithText()
        text.tag = 4
        text.keyboardType = .numberPad
        return text
    }()
    //MARK: Other UI element page
    let timePickerView = UIDatePicker()
    let buttonNextPage: profileCustomButton = {
        let button = profileCustomButton()
        button.addTarget(self, action: #selector(saveDataAndNextStep), for: .touchUpInside)
        return button
    }()
    
    //MARK: Option page
    var numberFirefighters = 2
    var typeInfo = ""
    var complexityInfo = ""
    let coreCalculation = CalculationInfo.CalculationInform
    let chekingInteger = "^(?=.*\\d)[\\d]{0,3}$"

    //MARK: life line app page
    override func viewDidLayoutSubviews() {
        navigationController?.navigationBar.prefersLargeTitles = false
        themeColorUIkit(number: numberFirefighters)
        // init layout setting
    }
    override func viewWillLayoutSubviews() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // initial func setting
        settingButtonName()
        addViewElements(number: numberFirefighters)
        FireFightersTextField1.delegate = self
        FireFightersTextField2.delegate = self
        FireFightersTextField3.delegate = self
        FireFightersTextField4.delegate = self
        FireFightersTextField5.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        layOutSetting(numberFirefighters)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    //MARK: Functional page
    //инициализация элементов согласно числу пожарных в звене
    func addViewElements(number: Int) {
        switch number {
        case 5:
            view.addSubview(FireFightersLabel5)
            view.addSubview(FireFightersTextField5)
            fallthrough
        case 4:
            view.addSubview(FireFightersLabel4)
            view.addSubview(FireFightersTextField4)
            fallthrough
        case 3:
            view.addSubview(FireFightersLabel3)
            view.addSubview(FireFightersTextField3)
            fallthrough
        case 2:
            view.addSubview(FireFightersLabel2)
            view.addSubview(FireFightersTextField2)
            view.addSubview(FireFightersLabel1)
            view.addSubview(FireFightersTextField1)
        default: break
        }
            view.addSubview(timeOn)
            view.addSubview(buttonNextPage)
    }
    //Растановка констрейнтов пожарных в звене
    func layOutSetting(_ ffNum: Int){
        switch ffNum {
        case 5:
            //---5---
            FireFightersLabel5.topLabel(FireFightersLabel4.bottomAnchor, 20)
            FireFightersLabel5.leadingLabel(FireFightersLabel4.leadingAnchor, 0)
            FireFightersLabel5.trailingLabel(FireFightersTextField5.leadingAnchor, 0)
            FireFightersLabel5.heightLabel(30)
            FireFightersTextField5.topTextField(FireFightersLabel5.topAnchor, 0)
            FireFightersTextField5.trailingTextField(FireFightersTextField4.trailingAnchor, 0)
            FireFightersTextField5.heightTextField(30)
            FireFightersTextField5.widthTextField(100)
            if ffNum == 5 {timeOn.topAnchor.constraint(equalTo: FireFightersLabel5.bottomAnchor,
                                                       constant: 20).isActive = true}
            fallthrough
        case 4:
            //---4---
            FireFightersLabel4.topLabel(FireFightersLabel3.bottomAnchor, 20)
            FireFightersLabel4.leadingLabel(FireFightersLabel3.leadingAnchor, 0)
            FireFightersLabel4.trailingLabel(FireFightersTextField4.leadingAnchor, 0)
            FireFightersLabel4.heightLabel(30)
            FireFightersTextField4.topTextField(FireFightersLabel4.topAnchor, 0)
            FireFightersTextField4.trailingTextField(FireFightersTextField3.trailingAnchor, 0)
            FireFightersTextField4.heightTextField(30)
            FireFightersTextField4.widthTextField(100)
            if ffNum == 4 {timeOn.topAnchor.constraint(equalTo: FireFightersLabel4.bottomAnchor,
                                                       constant: 20).isActive = true}
            fallthrough
        case 3:
            //---3---
            FireFightersLabel3.topLabel(FireFightersLabel2.bottomAnchor, 20)
            FireFightersLabel3.leadingLabel(FireFightersLabel2.leadingAnchor, 0)
            FireFightersLabel3.trailingLabel(FireFightersTextField3.leadingAnchor, 0)
            FireFightersLabel3.heightLabel(30)
            FireFightersTextField3.topTextField(FireFightersLabel3.topAnchor, 0)
            FireFightersTextField3.trailingTextField(FireFightersTextField2.trailingAnchor, 0)
            FireFightersTextField3.heightTextField(30)
            FireFightersTextField3.widthTextField(100)
            if ffNum == 3 {
                timeOn.topAnchor.constraint(equalTo: FireFightersLabel3.bottomAnchor,
                                                       constant: 20).isActive = true}
            fallthrough
        case 2:
            //---2---
            FireFightersLabel2.topLabel(FireFightersLabel1.bottomAnchor, 20)
            FireFightersLabel2.leadingLabel(FireFightersLabel1.leadingAnchor, 0)
            FireFightersLabel2.trailingLabel(FireFightersTextField2.leadingAnchor, 0)
            FireFightersLabel2.heightLabel(30)
            FireFightersTextField2.topTextField(FireFightersLabel2.topAnchor, 0)
            FireFightersTextField2.trailingTextField(self.view.trailingAnchor, -20)
            FireFightersTextField2.heightTextField(30)
            FireFightersTextField2.widthTextField(100)
            //---1---
            FireFightersLabel1.topLabel(view.safeAreaLayoutGuide.topAnchor, 20)
            FireFightersLabel1.leadingLabel(view.leadingAnchor, 20)
            FireFightersLabel1.trailingLabel(FireFightersTextField1.leadingAnchor, 0)
            FireFightersLabel1.heightLabel(30)
            FireFightersTextField1.topTextField(FireFightersLabel1.topAnchor, 0)
            FireFightersTextField1.trailingTextField(self.view.trailingAnchor, -20)
            FireFightersTextField1.heightTextField(30)
            FireFightersTextField1.widthTextField(100)
            if ffNum == 2 {timeOn.topAnchor.constraint(equalTo: FireFightersLabel2.bottomAnchor,
                                                       constant: 20).isActive = true}
        default: break
        }
        timeOn.leadingAnchor.constraint(equalTo: FireFightersLabel2.leadingAnchor).isActive = true
        timeOn.trailingAnchor.constraint(equalTo: FireFightersTextField2.trailingAnchor).isActive = true
        timeOn.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        
        buttonNextPage.layOutSettingButton(timeOn.bottomAnchor, 20,
                                           timeOn.leadingAnchor, 0,
                                           timeOn.trailingAnchor, 0,
                                           nil, 0)
        buttonNextPage.heightButton(50)
        view.layoutIfNeeded()
    }
    
    func themeColorUIkit(number: Int) {
        self.view.viewThemeColor()
        self.buttonNextPage.DarkThemeButton()
        switch number {
        case 5:
            self.FireFightersLabel5.darkThemeLabel()
            self.FireFightersTextField5.textFieldDarkTheme()
            self.FireFightersTextField5.addLines(w: 100)
            fallthrough
        case 4:
            self.FireFightersLabel4.darkThemeLabel()
            self.FireFightersTextField4.textFieldDarkTheme()
            self.FireFightersTextField4.addLines(w: 100)
            fallthrough
        case 3:
            self.FireFightersLabel3.darkThemeLabel()
            self.FireFightersTextField3.textFieldDarkTheme()
            self.FireFightersTextField3.addLines(w: 100)
            fallthrough
        case 2:
            self.FireFightersLabel1.darkThemeLabel()
            self.FireFightersLabel2.darkThemeLabel()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField2.textFieldDarkTheme()
            self.FireFightersTextField1.addLines(w: 100)
            self.FireFightersTextField2.addLines(w: 100)
        default: break
        }
    }
    //Button name
    func settingButtonName() {
        if typeInfo == "На пожаре" {
            buttonNextPage.setTitle("Звено ушло", for: .normal)
        } else {
            buttonNextPage.setTitle("Далее", for: .normal)
        }
    }
    
    // next view button
    @objc func saveDataAndNextStep() {
        if typeInfo == "На пожаре" {
           // saveDataCoreData()
            AlertView(text: "В разработке!")
        } else {
            saveDataCoreData()
            let nextVC = CalculationAtHearthVC()
            nextVC.typeInfoHearth = typeInfo
            nextVC.numberFireFightersHearth = numberFirefighters
            
            self.navigationController?.pushViewController(nextVC, animated: true)
            view.endEditing(true)
        }
    }
    @objc func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
    func statusComplexity() -> Bool {
        if complexityInfo == "Сложные"{
            return true
        } else {
            return false
        }
    }
    // save date func
    func saveDataCoreData() {
        switch numberFirefighters {
        case 2:
            guard FireFightersTextField1.text != "",FireFightersTextField2.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            guard Int(FireFightersTextField1.text!)! > 55,Int(FireFightersTextField2.text!)! > 55 else {AlertView(text: "Давление не может быть менее 55 Бар (Кг/См2)")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
        case 3:
            guard FireFightersTextField1.text != "",FireFightersTextField2.text != "",FireFightersTextField3.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            guard Int(FireFightersTextField1.text!)! > 55,Int(FireFightersTextField2.text!)! > 55,Int(FireFightersTextField3.text!)! > 55 else {AlertView(text: "Давление не может быть менее 55 Бар (Кг/См2)")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
        case 4:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "",
                  FireFightersTextField3.text != "",
                  FireFightersTextField4.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            guard Int(FireFightersTextField1.text!)! > 55,Int(FireFightersTextField2.text!)! > 55,Int(FireFightersTextField3.text!)! > 55,Int(FireFightersTextField4.text!)! > 55 else {AlertView(text: "Давление не может быть менее 55 Бар (Кг/См2)")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
            coreCalculation.FireFighter4 = Int(FireFightersTextField4.text!)
        case 5:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "",
                  FireFightersTextField3.text != "",
                  FireFightersTextField4.text != "",
                  FireFightersTextField5.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            guard Int(FireFightersTextField1.text!)! > 55,Int(FireFightersTextField2.text!)! > 55,Int(FireFightersTextField3.text!)! > 55,Int(FireFightersTextField4.text!)! > 55,Int(FireFightersTextField5.text!)! > 55  else {AlertView(text: "Давление не может быть менее 55 Бар (Кг/См2)")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
            coreCalculation.FireFighter4 = Int(FireFightersTextField4.text!)
            coreCalculation.FireFighter5 = Int(FireFightersTextField5.text!)
        default: break
        }
        coreCalculation.inputTime = timeOn.date
        coreCalculation.complexityStatus = statusComplexity()
    }
    // Update dark theme
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                    self.themeColorUIkit(number: self.numberFirefighters)
                self.view.layoutIfNeeded()
            }
        }
    }
// проверка на соответствие вводимых символов
    private func textCheking(_ st: String) {
        if st.chekingIntegerString(chekingInteger) {
            if Int(st)! > 300 { AlertView(text: "Максимальное давление 300 Бар")}
        } else {
            AlertView(text: "Длина символов не может превышать трёх знаков или иметь точку!")
        }
    }
}


//MARK: extension func section
//Проверка ввода символов
extension startCalcViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cheking = textField.text! + string
        textCheking(cheking)
        return true
    }
}
