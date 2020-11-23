import Foundation
import UIKit
import QuartzCore
class CalculationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //    let yourLabel: MTMathUILabel = MTMathUILabel()
    //    yourLabel.translatesAutoresizingMaskIntoConstraints = false
    //    yourLabel.latex = "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}"
    //    yourLabel.sizeToFit()
        //frac -> Дробь
        //pm -> плюс минус
        //_ -> нижний знак
        //^ -> верхний знак
        // не работает с русским языком
    //    let numbersFireLabel: MTMathUILabel = {
    //         let text = MTMathUILabel()
    //        text.translatesAutoresizingMaskIntoConstraints = false
    //        text.latex = "x = \\frac{300-10}{2,5}"
    //
    //        return text
    //    }()
//    @IBOutlet weak var statusFire: UISwitch!
//    @IBOutlet weak var ComplexityStatus: UISwitch!
//    @IBOutlet weak var numberFireFighter: UISlider!
//    @IBOutlet weak var nuberFirfighterNow: UILabel!
//    @IBOutlet weak var nextButton: UIButton!
//    @IBOutlet weak var SelectType: UISegmentedControl!
//    @IBOutlet weak var OxyAirFlow: UITextField!
//    @IBOutlet weak var ComplexyLabel: UILabel!
//    @IBOutlet weak var FirefightersLabel: UILabel!
//    let DataBase = UserProfile.userInform
//    var statusFireBool = false
//    var Complexity = false
//    let CalcClass = CalculationInfo.CalculationInform
//    let saveLocalData = UserDefaults.standard
//
//    //MARK: Gardients for Button
//    var buttonGardients: CAGradientLayer! {
//        didSet {
//            buttonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
//            buttonGardients.startPoint = CGPoint(x: 0, y: 0)
//            buttonGardients.endPoint = CGPoint(x: 0, y: 1)
//        }
//    }
//    //MARK: Load first layout
//    override func viewDidLayoutSubviews() {
//        buttonGardients = CAGradientLayer()
//        buttonGardients.frame = CGRect(x: 0, y: 0, width: nextButton.frame.size.width, height: nextButton.frame.size.height)
//        nextButton.grayButton(nameBut: "Далее")
//        nextButton.layer.masksToBounds = true
//        nextButton.layer.cornerRadius = 10
//        nextButton.layer.insertSublayer(buttonGardients, at: 0)
//        updateView()
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Расчеты"
//        CalcClass.claenData()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil)
//    }
//    func switchStatus(switcher: UISwitch)->Bool! {
//        switch switcher.isOn {
//        case true:
//            return true
//        case false:
//            return false
//        }
//
//    }
//    @IBAction func selType(_ sender: Any) {
//
//    }
//
//    @IBAction func actionStatusFire(_ sender: Any) {
//        statusFireBool = switchStatus(switcher: statusFire)
//        switch statusFireBool {
//        case true:
//            nextButton.setTitle("Включение", for: .normal)
//        case false:
//            nextButton.setTitle("Далее", for: .normal)
//        }
//    }
//    @IBAction func actionComplexityStatus(_ sender: Any) {
//        Complexity = switchStatus(switcher: ComplexityStatus)
//
//    }
//
//    @IBAction func actionNumberFireFighter(_ sender: Any) {
//        nuberFirfighterNow.text = String(Int(numberFireFighter.value))
//
//    }
//    @IBAction func actionNextButton(_ sender: Any) {
//        saveLocalData.set(OxyAirFlow.text!, forKey: "OxyAirFlow")
//        CalcClass.numberFireFighter = Int(numberFireFighter.value)
//        CalcClass.complexityStatus = Complexity
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "NextView"{
//                let NextView = segue.destination as! SelectTimeFireFighter
//                NextView.status = statusFireBool
//
//            }
//        }
//    func updateView() {
//        let loadVeiw = DispatchQueue.main
//        loadVeiw.async {
//            self.view.darkThemeView()
//            self.FirefightersLabel.darkThemeLabel()
//            self.ComplexyLabel.darkThemeLabel()
////            self.navigationController?.navigationBar.darkThemeNav()
//            self.tabBarController?.tabBar.darkThemeBar()
//        }
//    }
//
//    @objc func DarkNotification(notif: Notification) {
//        guard let userInfo  = notif.userInfo, let Dark = userInfo["Dark"] as? String else { return }
//        if Dark != "" {
//            updateView()
//        }
//    }
//    func saveAlert() {
//        let alertView = UIAlertController(title: "Внимание", message: "Укажите средний расход для кислорода", preferredStyle: .alert)
//        alertView.addTextField { (textFields) in
//            textFields.placeholder = "Расход"
//            textFields.keyboardType = .numberPad
//        }
//        let saveButton = UIAlertAction(title: "Сохранить", style: .default) { (action)in
//            let saveData = alertView.textFields![0] as UITextField
//            print(saveData.text!)
//        }
//        alertView.addAction(saveButton)
//        alertView.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
//        present(alertView, animated: true, completion: nil)
//    }
    //UI element
    // Режим работы (На пожаре или Решения задач)
    // Сложность пожара (Простой или сложный)
    // Число ГДЗ
    // С Именами или нет
    //
    
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
    let typeName = ["На пожаре","Задачи"]
    let complexityName = ["Простые","Сложные"]
    let numberFire = ["2","3","4","5"]
    
    override func viewDidLayoutSubviews() {
        //DarkThemeSetting
        self.view.viewThemeColor()
        self.nextButton.DarkThemeButton()
        self.typeWorkLabel.darkThemeLabel()
        self.complexityLabel.darkThemeLabel()
        self.numbersFireLabel.darkThemeLabel()
        
        // UI element constraint
        // MARK: Type label and Textfield constraint
        typeWorkLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        typeWorkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        typeWorkLabel.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        
        typeWorkSelect.topAnchor.constraint(equalTo: typeWorkLabel.topAnchor).isActive = true
        typeWorkSelect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        typeWorkSelect.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        typeWorkSelect.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        typeWorkSelect.addLines(w: typeWorkSelect.frame.size.width)
        
        //MARK: Complexity label and textField constraint
        complexityLabel.topAnchor.constraint(equalTo: typeWorkLabel.bottomAnchor, constant: 30).isActive = true
        complexityLabel.leadingAnchor.constraint(equalTo: typeWorkLabel.leadingAnchor).isActive = true
        complexityLabel.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        
        complexitySelect.topAnchor.constraint(equalTo: complexityLabel.topAnchor).isActive = true
        complexitySelect.trailingAnchor.constraint(equalTo: typeWorkSelect.trailingAnchor).isActive = true
        complexitySelect.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        complexitySelect.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        complexitySelect.addLines(w:complexitySelect.frame.size.width)
        
        //MARK: Number Firefighters label and textField
        numbersFireLabel.topAnchor.constraint(equalTo: complexityLabel.bottomAnchor, constant: 30).isActive = true
        numbersFireLabel.leadingAnchor.constraint(equalTo: complexityLabel.leadingAnchor).isActive = true
        numbersFireLabel.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        
        numberFireSelect.topAnchor.constraint(equalTo: numbersFireLabel.topAnchor).isActive = true
        numberFireSelect.trailingAnchor.constraint(equalTo: complexitySelect.trailingAnchor).isActive = true
        numberFireSelect.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        numberFireSelect.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        numberFireSelect.addLines(w:numberFireSelect.frame.size.width)

        //MARK: Next button constraint
        nextButton.topAnchor.constraint(equalTo: numberFireSelect.bottomAnchor, constant: 30).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: numbersFireLabel.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: numberFireSelect.trailingAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        view.layoutIfNeeded()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
        nextButton.setTitle("Включение", for: .normal)
        
        typeWorkSelect.text = typeName[0]
        complexitySelect.text = complexityName[0]
        numberFireSelect.text = numberFire[0]
        
        typeWorkSelect.inputView = pickerViewType
        complexitySelect.inputView = pickerViewComplexity
        numberFireSelect.inputView = pickerViewNumber
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    //MARK: Action Button
    @objc func nextStepCalculation(){
            let nextVC = startCulcViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.numberFirefighters = Int(numberFireSelect.text!)!
            nextVC.typeInfo = typeWorkSelect.text!
            nextVC.complexityInfo = complexitySelect.text!
            view.endEditing(true)
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

