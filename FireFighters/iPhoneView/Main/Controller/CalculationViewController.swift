import Foundation
import UIKit
import QuartzCore
class CalculationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    let typeWorkLabel: UILabel = {
        let text = UILabel()
        text.text = "Режим работы"
        text.translatesAutoresizingMaskIntoConstraints = false
       return text
    }()
    let typeWorkSelect = profileEdithText()
    let complexityLabel: UILabel = {
         let text = UILabel()
        
        text.translatesAutoresizingMaskIntoConstraints = false
         text.text = "Условия"
        return text
    }()
    let complexitySelect = profileEdithText()
    let numbersFireLabel: UILabel = {
         let text = UILabel()
         text.text = "ГДЗ в звене"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    let numberFireSelect = profileEdithText()
    let nextButton:UIButton = {
        let button = profileCustomButton()
        button.addTarget(self, action: #selector(nextStepCalculation), for: .touchUpInside)
        return button
    }()
    
    let pickerViewType = UIPickerView()
    let pickerViewComplexity = UIPickerView()
    let pickerViewNumber = UIPickerView()
    
    // MARK: Name picker
    let typeName = ["Задачи"]//"На пожаре",
    let complexityName = ["Простые","Сложные"]
    let numberFire = ["2","3","4","5"]
    
    override func viewDidLayoutSubviews() {
        //DarkThemeSetting
        self.view.viewThemeColor()
        self.nextButton.DarkThemeButton()
        self.typeWorkLabel.darkThemeLabel()
        self.complexityLabel.darkThemeLabel()
        self.numbersFireLabel.darkThemeLabel()
        layoutSettingUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        typeWorkSelect.delegate = self
        complexitySelect.delegate = self
        numberFireSelect.delegate = self
        //MARK: Add UI element to View
        view.addSubview(typeWorkLabel)
        view.addSubview(typeWorkSelect)
        view.addSubview(complexityLabel)
        view.addSubview(complexitySelect)
        view.addSubview(numbersFireLabel)
        view.addSubview(numberFireSelect)
        view.addSubview(nextButton)
        
        //MARK: Picker Setting
        pickerViewType.delegate = self
        pickerViewType.tag = 0
        
        pickerViewComplexity.delegate = self
        pickerViewComplexity.tag = 1
        
        pickerViewNumber.delegate = self
        pickerViewNumber.tag = 2
        
        //Setting Button and TextField
        nextButton.setTitle("Решение", for: .normal)
        
        typeWorkSelect.text = typeName[0]
        complexitySelect.text = complexityName[0]
        numberFireSelect.text = numberFire[0]
        
        typeWorkSelect.inputView = pickerViewType
        complexitySelect.inputView = pickerViewComplexity
        numberFireSelect.inputView = pickerViewNumber
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        CalculationInfo.CalculationInform.claenData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic

        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }
    //MARK: Action Button
    @objc func nextStepCalculation(){
            let nextVC = startCalcViewController()
            navigationController!.pushViewController(nextVC, animated: false)
            nextVC.numberFirefighters = Int(numberFireSelect.text!)!
            nextVC.typeInfo = typeWorkSelect.text!
            nextVC.complexityInfo = complexitySelect.text!
            view.endEditing(true)
    }
    func layoutSettingUI() {
        view.layoutIfNeeded()
        // MARK: Type label and Textfield constraint
        typeWorkLabel.layOutSettingLabel(self.view.safeAreaLayoutGuide.topAnchor, 30,
                                         self.view.leadingAnchor, 30,
                                         nil, 0,
                                         nil, 0)
        typeWorkLabel.heightLabel(40)
        typeWorkSelect.layOutSettingTextField(typeWorkLabel.topAnchor, 0,
                                              nil, 0,
                                              self.view.trailingAnchor, -30,
                                              nil, 0)
        typeWorkSelect.heightTextField(40)
        typeWorkSelect.widthTextField(100)
        typeWorkSelect.addLines(w: typeWorkSelect.frame.size.width)
        
        //MARK: Complexity label and textField constraint
        complexityLabel.layOutSettingLabel(typeWorkLabel.bottomAnchor, 30,
                                           typeWorkLabel.leadingAnchor, 0,
                                           nil, 0,
                                           nil, 0)
        complexityLabel.heightLabel(40)
        complexitySelect.layOutSettingTextField(complexityLabel.topAnchor, 0,
                                                nil, 0,
                                                typeWorkSelect.trailingAnchor, 0,
                                                nil, 0)
        complexitySelect.heightTextField(40)
        complexitySelect.widthTextField(100)
        complexitySelect.addLines(w:complexitySelect.frame.size.width)
        
        //MARK: Number Firefighters label and textField
        numbersFireLabel.layOutSettingLabel(complexityLabel.bottomAnchor, 30,
                                            complexityLabel.leadingAnchor, 0,
                                            nil, 0,
                                            nil, 0)
        numbersFireLabel.heightLabel(40)
        numberFireSelect.layOutSettingTextField(numbersFireLabel.topAnchor, 0,
                                                nil, 0,
                                                complexitySelect.trailingAnchor, 0,
                                                nil, 0)
        numberFireSelect.heightTextField(40)
        numberFireSelect.widthTextField(100)
        numberFireSelect.addLines(w:numberFireSelect.frame.size.width)

        //MARK: Next button constraint
        nextButton.layOutSettingButton(numberFireSelect.bottomAnchor, 30,
                                       numbersFireLabel.leadingAnchor, 0,
                                       numberFireSelect.trailingAnchor, 0,
                                       nil, 0)
        nextButton.heightButton(50)
        view.layoutIfNeeded()
    }
    
    //MARK: TextField tracking
    func textFieldDidEndEditing(_ textField: UITextField) {
        if typeWorkSelect.text == "На пожаре" {
            nextButton.setTitle("Включение", for: .normal)
        } else {
            nextButton.setTitle("Решение", for: .normal)
        }
    }
    // MARK: PickerView Setting
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return typeName.count
        case 1: return complexityName.count
        case 2: return numberFire.count
        default: return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return typeName[row]
        case 1: return complexityName[row]
        case 2: return numberFire[row]
        default: return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: typeWorkSelect.text = typeName[row]
        case 1: complexitySelect.text = complexityName[row]
        case 2: numberFireSelect.text = numberFire[row]
        default: print("Error picker calcul")
        }
    }
    
    //MARK: Update UI elements Dark theme
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                self.view.viewThemeColor()
                self.nextButton.DarkThemeButton()
                self.typeWorkLabel.darkThemeLabel()
                self.complexityLabel.darkThemeLabel()
                self.numbersFireLabel.darkThemeLabel()
                    //Update text field
                    self.typeWorkSelect.textFieldDarkTheme()
                self.typeWorkSelect.addLines(w: self.typeWorkSelect.frame.size.width)
                    self.complexitySelect.textFieldDarkTheme()
                self.complexitySelect.addLines(w: self.complexitySelect.frame.size.width)
                    self.numberFireSelect.textFieldDarkTheme()
                self.numberFireSelect.addLines(w: self.numberFireSelect.frame.size.width)
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

