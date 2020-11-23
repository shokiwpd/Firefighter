//
//  startCulcViewController.swift
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

class startCulcViewController: UIViewController {
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
        time.translatesAutoresizingMaskIntoConstraints = false
//        time.locale =
        return time
    }()
    let chekingInteger = "^(?=.*\\d)[\\d]{0,3}$"
 
    
    //MARK: UITextfield page
    let FireFightersTextField1: profileEdithText = {
        let text = profileEdithText()
        text.tag = 0
        text.keyboardType = .decimalPad
        return text
    }()
    let FireFightersTextField2: profileEdithText = {
        let text = profileEdithText()
        text.tag = 1
        text.keyboardType = .decimalPad
        return text
    }()
    lazy var FireFightersTextField3: profileEdithText = {
        let text = profileEdithText()
        text.tag = 2
        text.keyboardType = .decimalPad
        return text
    }()
    lazy var FireFightersTextField4: profileEdithText = {
        let text = profileEdithText()
        text.tag = 3
        text.keyboardType = .decimalPad
        return text
    }()
    lazy var FireFightersTextField5: profileEdithText = {
        let text = profileEdithText()
        text.tag = 4
        text.keyboardType = .decimalPad
        return text
    }()
    
    lazy var timeDatePickerTextfield = profileEdithText()
    
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


    
    //MARK: life line app page
    override func viewWillLayoutSubviews() {
        themeColorUIkit(number: numberFirefighters)
        // init layout setting
        switch numberFirefighters {
        case 2:
            layoutFireFighters2()
        case 3:
            layoutFireFighters3()
        case 4:
            layoutFireFighters4()
        case 5:
            layoutFireFighters5()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    //MARK: Functional page
    //инициализация элементов согласно числу пожарных в звене
    
    
    func addViewElements(number: Int) {
        switch number {
        case 2:
            view.addSubview(FireFightersLabel1)
            view.addSubview(FireFightersTextField1)
            view.addSubview(FireFightersLabel2)
            view.addSubview(FireFightersTextField2)
            view.addSubview(timeOn)
            view.addSubview(buttonNextPage)
        case 3:
            view.addSubview(FireFightersLabel1)
            view.addSubview(FireFightersTextField1)
            view.addSubview(FireFightersLabel2)
            view.addSubview(FireFightersTextField2)
            view.addSubview(FireFightersLabel3)
            view.addSubview(FireFightersTextField3)
            view.addSubview(timeOn)
            view.addSubview(buttonNextPage)
        case 4:
            view.addSubview(FireFightersLabel1)
            view.addSubview(FireFightersTextField1)
            view.addSubview(FireFightersLabel2)
            view.addSubview(FireFightersTextField2)
            view.addSubview(FireFightersLabel3)
            view.addSubview(FireFightersTextField3)
            view.addSubview(FireFightersLabel4)
            view.addSubview(FireFightersTextField4)
            view.addSubview(timeOn)
            view.addSubview(buttonNextPage)
        case 5:
            view.addSubview(FireFightersLabel1)
            view.addSubview(FireFightersTextField1)
            view.addSubview(FireFightersLabel2)
            view.addSubview(FireFightersTextField2)
            view.addSubview(FireFightersLabel3)
            view.addSubview(FireFightersTextField3)
            view.addSubview(FireFightersLabel4)
            view.addSubview(FireFightersTextField4)
            view.addSubview(FireFightersLabel5)
            view.addSubview(FireFightersTextField5)
            view.addSubview(timeOn)
            view.addSubview(buttonNextPage)
        default: break
        }
    }
    //Растановка констрейнтов при 2ух пожарных в звене
    func layoutFireFighters2() {
        // _1_
        self.FireFightersLabel1.darkThemeLabel()
        self.FireFightersLabel2.darkThemeLabel()
        FireFightersLabel1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        FireFightersLabel1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        FireFightersLabel1.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        FireFightersTextField1.topAnchor.constraint(equalTo: FireFightersLabel1.topAnchor).isActive = true
        FireFightersTextField1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        FireFightersTextField1.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        FireFightersTextField1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _2_
        FireFightersLabel2.topAnchor.constraint(equalTo: self.FireFightersLabel1.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel2.leadingAnchor.constraint(equalTo: self.FireFightersLabel1.leadingAnchor).isActive = true
        FireFightersLabel2.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        FireFightersTextField2.topAnchor.constraint(equalTo: self.FireFightersLabel2.topAnchor).isActive = true
        FireFightersTextField2.trailingAnchor.constraint(equalTo: self.FireFightersTextField1.trailingAnchor).isActive = true
        FireFightersTextField2.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        FireFightersTextField2.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        //_timer_
        timeOn.topAnchor.constraint(equalTo: FireFightersLabel2.bottomAnchor, constant: 20).isActive = true
        timeOn.leadingAnchor.constraint(equalTo: FireFightersLabel2.leadingAnchor).isActive = true
        timeOn.trailingAnchor.constraint(equalTo: FireFightersTextField2.trailingAnchor).isActive = true
        timeOn.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        //_btton_
        buttonNextPage.topAnchor.constraint(equalTo: timeOn.bottomAnchor, constant: 20).isActive = true
        buttonNextPage.leadingAnchor.constraint(equalTo: timeOn.leadingAnchor).isActive = true
        buttonNextPage.trailingAnchor.constraint(equalTo: timeOn.trailingAnchor).isActive = true
        buttonNextPage.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    //Растановка констрейнтов при 3ех пожарных в звене
    func layoutFireFighters3() {
        self.FireFightersLabel1.darkThemeLabel()
        self.FireFightersLabel2.darkThemeLabel()
        self.FireFightersLabel3.darkThemeLabel()
        // _1_
        FireFightersLabel1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        FireFightersLabel1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        FireFightersLabel1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.topAnchor.constraint(equalTo: FireFightersLabel1.topAnchor).isActive = true
        FireFightersTextField1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        FireFightersTextField1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _2_
        FireFightersLabel2.topAnchor.constraint(equalTo: self.FireFightersLabel1.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel2.leadingAnchor.constraint(equalTo: self.FireFightersLabel1.leadingAnchor).isActive = true
        FireFightersLabel2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.topAnchor.constraint(equalTo: self.FireFightersLabel2.topAnchor).isActive = true
        FireFightersTextField2.trailingAnchor.constraint(equalTo: self.FireFightersTextField1.trailingAnchor).isActive = true
        FireFightersTextField2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        // _3_
        FireFightersLabel3.topAnchor.constraint(equalTo: FireFightersLabel2.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel3.leadingAnchor.constraint(equalTo: FireFightersLabel2.leadingAnchor).isActive = true
        FireFightersLabel3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.topAnchor.constraint(equalTo: FireFightersLabel3.topAnchor).isActive = true
        FireFightersTextField3.trailingAnchor.constraint(equalTo: FireFightersTextField2.trailingAnchor).isActive = true
        FireFightersTextField3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _time_
        timeOn.topAnchor.constraint(equalTo: FireFightersLabel3.bottomAnchor, constant: 20).isActive = true
        timeOn.leadingAnchor.constraint(equalTo: FireFightersLabel3.leadingAnchor).isActive = true
        timeOn.trailingAnchor.constraint(equalTo: FireFightersTextField3.trailingAnchor).isActive = true
        timeOn.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        //_btton_
        buttonNextPage.topAnchor.constraint(equalTo: timeOn.bottomAnchor, constant: 20).isActive = true
        buttonNextPage.leadingAnchor.constraint(equalTo: timeOn.leadingAnchor).isActive = true
        buttonNextPage.trailingAnchor.constraint(equalTo: timeOn.trailingAnchor).isActive = true
        buttonNextPage.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    //Растановка констрейнотв при 4ех пожарных в звене
    func layoutFireFighters4() {
        self.FireFightersLabel1.darkThemeLabel()
        self.FireFightersLabel2.darkThemeLabel()
        self.FireFightersLabel3.darkThemeLabel()
        self.FireFightersLabel4.darkThemeLabel()
        self.FireFightersLabel5.darkThemeLabel()
        // _1_
        FireFightersLabel1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        FireFightersLabel1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        FireFightersLabel1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.topAnchor.constraint(equalTo: FireFightersLabel1.topAnchor).isActive = true
        FireFightersTextField1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        FireFightersTextField1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _2_
        FireFightersLabel2.topAnchor.constraint(equalTo: self.FireFightersLabel1.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel2.leadingAnchor.constraint(equalTo: self.FireFightersLabel1.leadingAnchor).isActive = true
        FireFightersLabel2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.topAnchor.constraint(equalTo: self.FireFightersLabel2.topAnchor).isActive = true
        FireFightersTextField2.trailingAnchor.constraint(equalTo: self.FireFightersTextField1.trailingAnchor).isActive = true
        FireFightersTextField2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        // _3_
        FireFightersLabel3.topAnchor.constraint(equalTo: FireFightersLabel2.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel3.leadingAnchor.constraint(equalTo: FireFightersLabel2.leadingAnchor).isActive = true
        FireFightersLabel3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.topAnchor.constraint(equalTo: FireFightersLabel3.topAnchor).isActive = true
        FireFightersTextField3.trailingAnchor.constraint(equalTo: FireFightersTextField2.trailingAnchor).isActive = true
        FireFightersTextField3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _4_
        FireFightersLabel4.topAnchor.constraint(equalTo: FireFightersLabel3.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel4.leadingAnchor.constraint(equalTo: FireFightersLabel3.leadingAnchor).isActive = true
        FireFightersLabel4.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField4.topAnchor.constraint(equalTo: FireFightersLabel4.topAnchor).isActive = true
        FireFightersTextField4.trailingAnchor.constraint(equalTo: FireFightersTextField3.trailingAnchor).isActive = true
        FireFightersTextField4.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField4.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        // _time_
        timeOn.topAnchor.constraint(equalTo: FireFightersLabel4.bottomAnchor, constant: 20).isActive = true
        timeOn.leadingAnchor.constraint(equalTo: FireFightersLabel4.leadingAnchor).isActive = true
        timeOn.trailingAnchor.constraint(equalTo: FireFightersTextField4.trailingAnchor).isActive = true
        timeOn.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        //_btton_
        buttonNextPage.topAnchor.constraint(equalTo: timeOn.bottomAnchor, constant: 20).isActive = true
        buttonNextPage.leadingAnchor.constraint(equalTo: timeOn.leadingAnchor).isActive = true
        buttonNextPage.trailingAnchor.constraint(equalTo: timeOn.trailingAnchor).isActive = true
        buttonNextPage.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    //Растановка констрейнтов при 5ти пожарных в звене
    func layoutFireFighters5() {
        self.FireFightersLabel1.darkThemeLabel()
        self.FireFightersLabel2.darkThemeLabel()
        self.FireFightersLabel3.darkThemeLabel()
        self.FireFightersLabel4.darkThemeLabel()
        self.FireFightersLabel5.darkThemeLabel()
        // _1_
        FireFightersLabel1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        FireFightersLabel1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        FireFightersLabel1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.topAnchor.constraint(equalTo: FireFightersLabel1.topAnchor).isActive = true
        FireFightersTextField1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        FireFightersTextField1.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _2_
        FireFightersLabel2.topAnchor.constraint(equalTo: self.FireFightersLabel1.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel2.leadingAnchor.constraint(equalTo: self.FireFightersLabel1.leadingAnchor).isActive = true
        FireFightersLabel2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.topAnchor.constraint(equalTo: self.FireFightersLabel2.topAnchor).isActive = true
        FireFightersTextField2.trailingAnchor.constraint(equalTo: self.FireFightersTextField1.trailingAnchor).isActive = true
        FireFightersTextField2.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField2.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        // _3_
        FireFightersLabel3.topAnchor.constraint(equalTo: FireFightersLabel2.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel3.leadingAnchor.constraint(equalTo: FireFightersLabel2.leadingAnchor).isActive = true
        FireFightersLabel3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.topAnchor.constraint(equalTo: FireFightersLabel3.topAnchor).isActive = true
        FireFightersTextField3.trailingAnchor.constraint(equalTo: FireFightersTextField2.trailingAnchor).isActive = true
        FireFightersTextField3.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // _4_
        FireFightersLabel4.topAnchor.constraint(equalTo: FireFightersLabel3.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel4.leadingAnchor.constraint(equalTo: FireFightersLabel3.leadingAnchor).isActive = true
        FireFightersLabel4.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField4.topAnchor.constraint(equalTo: FireFightersLabel4.topAnchor).isActive = true
        FireFightersTextField4.trailingAnchor.constraint(equalTo: FireFightersTextField3.trailingAnchor).isActive = true
        FireFightersTextField4.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField4.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        //_5_
        FireFightersLabel5.topAnchor.constraint(equalTo: FireFightersLabel4.bottomAnchor, constant: 20).isActive = true
        FireFightersLabel5.leadingAnchor.constraint(equalTo: FireFightersLabel4.leadingAnchor).isActive = true
        FireFightersLabel5.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField5.topAnchor.constraint(equalTo: FireFightersLabel5.topAnchor).isActive = true
        FireFightersTextField5.trailingAnchor.constraint(equalTo: FireFightersTextField4.trailingAnchor).isActive = true
        FireFightersTextField5.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        FireFightersTextField5.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        //_timer_
        timeOn.topAnchor.constraint(equalTo: FireFightersLabel5.bottomAnchor, constant: 20).isActive = true
        timeOn.leadingAnchor.constraint(equalTo: FireFightersLabel5.leadingAnchor).isActive = true
        timeOn.trailingAnchor.constraint(equalTo: FireFightersTextField5.trailingAnchor).isActive = true
        timeOn.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        //_btton_
        buttonNextPage.topAnchor.constraint(equalTo: timeOn.bottomAnchor, constant: 20).isActive = true
        buttonNextPage.leadingAnchor.constraint(equalTo: timeOn.leadingAnchor).isActive = true
        buttonNextPage.trailingAnchor.constraint(equalTo: timeOn.trailingAnchor).isActive = true
        buttonNextPage.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    
    //
    func themeColorUIkit(number: Int) {
        self.view.viewThemeColor()
        self.buttonNextPage.DarkThemeButton()
        switch number {
        case 2:
            self.FireFightersLabel1.darkThemeLabel()
            self.FireFightersLabel2.darkThemeLabel()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField1.addLines(w: FireFightersTextField1.frame.size.width)
            self.FireFightersTextField2.textFieldDarkTheme()
            self.FireFightersTextField2.addLines(w: FireFightersTextField2.frame.size.width)
        case 3:
            self.FireFightersLabel1.darkThemeLabel()
            self.FireFightersLabel2.darkThemeLabel()
            self.FireFightersLabel3.darkThemeLabel()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField1.addLines(w: FireFightersTextField1.frame.size.width)
            self.FireFightersTextField2.textFieldDarkTheme()
            self.FireFightersTextField2.addLines(w: FireFightersTextField2.frame.size.width)
            self.FireFightersTextField3.textFieldDarkTheme()
            self.FireFightersTextField3.addLines(w: FireFightersTextField3.frame.size.width)
        case 4:
            self.FireFightersLabel1.darkThemeLabel()
            self.FireFightersLabel2.darkThemeLabel()
            self.FireFightersLabel3.darkThemeLabel()
            self.FireFightersLabel4.darkThemeLabel()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField1.addLines(w: FireFightersTextField1.frame.size.width)
            self.FireFightersTextField2.textFieldDarkTheme()
            self.FireFightersTextField2.addLines(w: FireFightersTextField2.frame.size.width)
            self.FireFightersTextField3.textFieldDarkTheme()
            self.FireFightersTextField3.addLines(w: FireFightersTextField3.frame.size.width)
            self.FireFightersTextField4.textFieldDarkTheme()
            self.FireFightersTextField4.addLines(w: FireFightersTextField4.frame.size.width)
        case 5:
            self.FireFightersLabel1.darkThemeLabel()
            self.FireFightersLabel2.darkThemeLabel()
            self.FireFightersLabel3.darkThemeLabel()
            self.FireFightersLabel4.darkThemeLabel()
            self.FireFightersLabel5.darkThemeLabel()
            self.FireFightersTextField1.textFieldDarkTheme()
            self.FireFightersTextField1.addLines(w: FireFightersTextField1.frame.size.width)
            self.FireFightersTextField2.textFieldDarkTheme()
            self.FireFightersTextField2.addLines(w: FireFightersTextField2.frame.size.width)
            self.FireFightersTextField3.textFieldDarkTheme()
            self.FireFightersTextField3.addLines(w: FireFightersTextField3.frame.size.width)
            self.FireFightersTextField4.textFieldDarkTheme()
            self.FireFightersTextField4.addLines(w: FireFightersTextField4.frame.size.width)
            self.FireFightersTextField5.textFieldDarkTheme()
            self.FireFightersTextField5.addLines(w: FireFightersTextField5.frame.size.width)
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
            AlertView(text: "Откроется окно с таймером и кнопкой вызова окна с указанием давления у очага!")
        } else {
           // saveDataCoreData()
            AlertView(text: "Откроется поле ввода давления всех участнимков звена и время у очага!")
        }
    }
    // save date func
    func saveDataCoreData() {
        switch numberFirefighters {
        case 2:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.inputTime = timeOn.date
        case 3:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "",
                  FireFightersTextField3.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
            coreCalculation.inputTime = timeOn.date
        case 4:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "",
                  FireFightersTextField3.text != "",
                  FireFightersTextField4.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
            coreCalculation.FireFighter4 = Int(FireFightersTextField4.text!)
            coreCalculation.inputTime = timeOn.date
        case 5:
            guard FireFightersTextField1.text != "",
                  FireFightersTextField2.text != "",
                  FireFightersTextField3.text != "",
                  FireFightersTextField4.text != "",
                  FireFightersTextField5.text != "" else {AlertView(text: "Вы не указали давление!")
                return}
            coreCalculation.FireFighter1 = Int(FireFightersTextField1.text!)
            coreCalculation.FireFighter2 = Int(FireFightersTextField2.text!)
            coreCalculation.FireFighter3 = Int(FireFightersTextField3.text!)
            coreCalculation.FireFighter4 = Int(FireFightersTextField4.text!)
            coreCalculation.FireFighter5 = Int(FireFightersTextField5.text!)
            coreCalculation.inputTime = timeOn.date
        default: break
        }
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
        if st.chtkingIntegerString(chekingInteger) {
            if Int(st)! > 300 { AlertView(text: "Максимальное давление 300 Бар")}
        } else {
            AlertView(text: "Длина символов не может превышать трёх знаков или иметь точку!")
        }
    }
}


//MARK: extension func section

//Проверка ввода символов
extension startCulcViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cheking = textField.text! + string
        textCheking(cheking)
        return true
    }
}
//фильтрация по фильтру символов
extension String {
    func chtkingIntegerString(_ st: String) -> Bool {
        self.range(of: st, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
