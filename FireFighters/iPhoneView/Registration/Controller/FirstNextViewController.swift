import UIKit
import MBProgressHUD
import Firebase
import Reachability
//-- Добавить выбор данных через UIPickerView в UITextField --//

//class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,getTockenUser {
//    @IBOutlet weak var partNumb: UITextField!
//    @IBOutlet weak var ChangeNum: UITextField!
//    @IBOutlet weak var saveButton: UIButton!
//    @IBOutlet weak var vBallons: UITextField!
//    @IBOutlet weak var AspectRatio: UITextField!
//    @IBOutlet weak var AirFlow: UITextField!
//    @IBOutlet weak var GearboxOperation: UITextField!
//    @IBOutlet weak var selectPOsition: UITextField!
//    @IBOutlet weak var unitTypeField: UITextField!
//    //MARK: Var
//    let userInformSave = UserProfile.userInform
//    let PositionSel = ["Пожарный","Ком.отделения","Нач.караула","Нач.части","ПНК","СПТ","Диспетчер","Водитель"]//Список должностей
//    let UnitType = ["ДАСВ","ДАСК"]
//    var PositionName = "Пожарный"//Стоковый элемент UIPicker
//    var name: String!
//    var Patronymic: String!
//    var city: String!
//    var birthDay: String!
//    var userPhoto: UIImage!
//    var saveDataButtonGardient = CAGradientLayer()
//    var chekingConnect = Reachability()!//Проверка связи
//    //MARK: Загрузка графической части
//    override func viewDidLayoutSubviews() {
//        saveDataButtonGardient.gardientButton(w: saveButton.frame.size.width, h: saveButton.frame.size.height)
//        saveButton.layer.insertSublayer(saveDataButtonGardient, at: 0)
//        saveButton.clipsToBounds = true
//        saveButton.layer.cornerRadius = 10
////        self.view.insertSubview(view.backgroundImage(nameImage: "DASVImage.png"), at: 0)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        vBallons.delegate = self
//        AspectRatio.delegate = self
//        AirFlow.delegate = self
//        GearboxOperation.delegate = self
//        //----------
//        let PositionPicker = UIPickerView()
//        PositionPicker.delegate = self
//        PositionPicker.tag = 1
//        selectPOsition.inputView = PositionPicker
//        let unitTypePicker = UIPickerView()
//        unitTypePicker.delegate = self
//        unitTypePicker.tag = 2
//        unitTypeField.inputView = unitTypePicker
//        //----------
//
//        title = "Регистрация"
//        saveButton.grayButton(nameBut: "Сохранить")
//        guard userTocken != "" else { return print("user not creat") }
//    }
//
//    //MARK: PickerView
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        switch pickerView.tag {
//            case 1: return PositionSel.count
//            case 2: return UnitType.count
//            default: return 0
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch pickerView.tag {
//            case 1: return PositionSel[row]
//            case 2: return UnitType[row]
//            default: return nil
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch pickerView.tag {
//        case 1: selectPOsition.text = PositionSel[row]
//        case 2: unitTypeField.text = UnitType[row]
//        default: print("nil")
//        }
//    }
//
//
//
//    @IBAction func infoButton(result: UIButton){
//        switch result.tag {
//        case 0:
//            AlertView(text: "Номер подразделения в котором вы работаете!")
//        case 1:
//            AlertView(text: "Дежурная смена(Караул) в котрой вы работаете. В будущем будет работа со специализациями.")
//        case 2:
//            AlertView(text: "Укажите Вашу должность")
//        case 3:
//            AlertView(text: "Укажите тип Аппарата. ДАСВ - Дыхательный аппарат на сжатом воздухе. ДАСК - Дыхательный аппарат на сжатом кислороде")
//        case 4:
//            AlertView(text: "Объем баллона Вашего аппарата!(В среднем в подразделениях МЧС это 6.8 л.)")
//        case 5:
//            AlertView(text: "Коэффециент сжатия воздуха(В среднем в подразделениях МЧС равен 1.1)")
//        case 6:
//            AlertView(text: "Средний расход воздуха аппарата(В среднем в подразделениях МЧС равен 40 Бар)")
//        case 7:
//            AlertView(text: "Давление для стабильно работы редуктора(В среднем в подразделениях МЧС равен 10 Бар)")
//        default:
//            print("error")
//        }
//    }
//
//    func checkInfoWork(changeNum: Int, partNumb: String, position: String,vBallon: Double, airFlow: Double, AspectRatio: Double,GearboxOperation: Int ){
//        guard changeNum != 0 else{ return AlertView(text: "Вы не указали свою дежурную смену(Караул)!")}
//        guard changeNum < 5  else{ return AlertView(text: "Вы указали не существующую смену")}
//        guard partNumb != "" else {return AlertView(text: "Вы не указали номер своей части!")}
//        guard position != "" else {return AlertView(text: "Вы не точно указали свою должность!")}
//        guard vBallon != 0.0 else {return AlertView(text: "Укажите объем баллона!")}
//        guard airFlow != 0.0 else {return AlertView(text: "Укажите средний расход воздуха в вашем подразделении!")}
//        guard AspectRatio != 0.0 else {return AlertView(text: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
//        guard GearboxOperation != 0 else {return AlertView(text: "Укажите давление для стабильной работы редуктора!")}
//            userInformSave.userUnitType = unitTypeField.text!// Заменить тут
//            userInformSave.userName = name
//            userInformSave.userPatronymic = Patronymic
//            userInformSave.userCity = city
//            userInformSave.userPosition = selectPOsition.text!
//            userInformSave.userPartNum = partNumb
//            userInformSave.userChange = Int(changeNum)
//            userInformSave.userBirthday = birthDay
//            userInformSave.userPhoto = userPhoto
//            userInformSave.userVBallons = Double(vBallon)
//            userInformSave.userAirFlow = Double(airFlow)
//            userInformSave.userAspectRatio = Double(AspectRatio)
//            userInformSave.userGearboxOperation = GearboxOperation
//            guard let imageData = userPhoto.jpegData(compressionQuality: 5) else {return }
//            let uploadUserPhoto = self.imageReference.child("\(userTocken!).png")
//
//        let uploadFileToFirebase = uploadUserPhoto.putData(imageData, metadata: nil) { (metadata, error) in
//            print(metadata ?? "Error metadata")
//            print(error ?? "Error nil")
//        }
//        uploadFileToFirebase.resume()
//            let saveDataBase = userInfoFIR(Name: name, Patronymic: Patronymic, City: city, Position: selectPOsition.text!, PartNumb: partNumb, ChangeNum: Int(changeNum) as NSNumber, BirthDay: birthDay, UnitType: unitTypeField.text!,vballons: vBallon as NSNumber, AspectRatio: AspectRatio as NSNumber, AirFlow: airFlow as NSNumber, GearboxOperation: GearboxOperation as NSNumber)
//            let infoRef = self.DataReference.child(userTocken!)
//                infoRef.setValue(saveDataBase.convertDataBase())
//        self.nextVC()
//    }
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) || action == #selector(select(_:)){
//            return false
//        }
//        return super.canPerformAction(action, withSender: sender)
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//
////----Кнопка сохранения данных и проверка верности указанных данных
//    @IBAction func acceptSaveButton(_ sender: Any) {
//        textFieldDidEndEditing(ChangeNum)
//        textFieldDidEndEditing(partNumb)
//        textFieldDidEndEditing(vBallons)
//        textFieldDidEndEditing(AirFlow)
//        textFieldDidEndEditing(AspectRatio)
//        textFieldDidEndEditing(GearboxOperation)
//        guard chekingConnect.connection != .none else { return AlertView(text: "Проверьте соединение с инетернетом и повторите попытку позжу")}
//        guard ChangeNum.text != "" else{ return AlertView(text: "Вы не указали свою дежурную смену(Караул)!")}
//        guard partNumb.text != "" else {return AlertView(text: "Вы не указали номер своей части!")}
//        guard vBallons.text != "" else {return AlertView(text: "Укажите объем баллона!")}
//        guard AirFlow.text != "" else {return AlertView(text: "Укажите средний расход воздуха в вашем подразделении!")}
//        guard AspectRatio.text != "" else {return AlertView(text: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
//        guard GearboxOperation.text != "" else {return AlertView(text: "Укажите давление для стабильной работы редуктора!")}
//
//        checkInfoWork(changeNum: Int(ChangeNum.text!)!, partNumb: partNumb.text!, position: PositionName, vBallon: Double(vBallons.text!.forrmated)!, airFlow: Double(AirFlow.text!.forrmated)!, AspectRatio: Double(AspectRatio.text!.forrmated)!, GearboxOperation: Int(GearboxOperation.text!.forrmated)!)
//    }
////----
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.text?.forrmater_text == "" {
//            textField.text = ""
//        }
//    }
//
//
//    private func nextVC() {
//        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
//        present(Vc, animated: true, completion: nil)
//    }
//}
        
class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,getTockenUser {
           //varible user information
            var nameUser: String!
            var patronymicUser: String!
            var cityUser: String!
            var dateBirthdayUser: String!
            var userPhoto: UIImage!
            //var layer
            let numberParthLine = CAShapeLayer()
            let changeNumberLine = CAShapeLayer()
            let positionSelectLine = CAShapeLayer()
            let uniteTypeLine = CAShapeLayer()
            let volumeBallonsLine = CAShapeLayer()
            let airCompressionLine = CAShapeLayer()
            let airConsumptionLine = CAShapeLayer()
            let gearOperationLine = CAShapeLayer()
            var buttonGardients = CAGradientLayer()
            // other var info
            let positionNumersInt = ["","1","2","3","4","5"]
            let PositionSel = ["","Пожарный","Ком.отделения","Нач.караула","Нач.части","ПНК","СПТ","Диспетчер","Водитель"]
            let UnitType = ["","ДАСВ","ДАСК"]

            // coreData date & firebase
            let coreDataSave = UserProfile.userInform
            private var daskView: UIView = {
                let view = UIView()
               return view
            }()
            private var infoLabel: UILabel = {
                let label = UILabel()
                    label.text = "И в конце укажем рабочие данные!"
                    label.lineBreakMode = .byWordWrapping
                    label.numberOfLines = 2
                    label.textAlignment = .right
                    label.translatesAutoresizingMaskIntoConstraints = false
                    return label
            }()
            private var dasvView: UIView = {
                let view = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            //--- number parth

            private var numberParth: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Номер части"
                    text.tag = 0
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.keyboardType = .decimalPad
                return text
            }()
            //---  change number

            private var changeNumber: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Дежурная смена"
                    text.tag = 1
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    return text
            }()
            //--- user position

            private var positionSelect: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Должность"
                    text.tag = 2
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    return text
            }()
            private var unitTypeField: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Тип аппарата"
                    text.tag = 3
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    return text
            }()
                    
    
            //--- ballons
            private var volumeBallons: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Объем баллона(ов)!"
                    text.tag = 4
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.keyboardType = .decimalPad
                    return text
            }()
            //--- air compression
            private var airCompression: UITextField = {
               let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Коэф. сжатия воздуха"
                    text.tag = 5
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.keyboardType = .decimalPad
                    return text
            }()
            //--- air consumption
            private var airConsumption: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Средний расход"
                    text.tag = 6
                    text.textAlignment = .left
                    text.returnKeyType = .next
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.keyboardType = .decimalPad
                    return text
            }()
            //--- air gear operation
            private var gearOperation: UITextField = {
                let text = textFields()
                    text.borderStyle = .roundedRect
                    text.placeholder = "Давление редуктора"
                    text.tag = 7
                    text.textAlignment = .left
                    text.returnKeyType = .go
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.keyboardType = .decimalPad
                    return text
            }()
            //--- save and registration button
            private var saveButton: UIButton = {
                let button = UIButton()
                    button.grayButton(nameBut: "Далее")
                    button.clipsToBounds = true
                    button.layer.cornerRadius = 10
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
                    return button
            }()
    
    
            //--- select type
            
            
            override func viewDidLayoutSubviews() {
                //view constraint
                numberParth.lineToTextField(shape: numberParthLine)
                changeNumber.lineToTextField(shape: changeNumberLine)
                positionSelect.lineToTextField(shape: positionSelectLine)
                unitTypeField.lineToTextField(shape: uniteTypeLine)
                volumeBallons.lineToTextField(shape: volumeBallonsLine)
                airCompression.lineToTextField(shape: airCompressionLine)
                airConsumption.lineToTextField(shape: airConsumptionLine)
                gearOperation.lineToTextField(shape: gearOperationLine)
                if #available(iOS 13.0, *) {
                    view.backgroundColor = .newDarkTheme
                    numberParthLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    changeNumberLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    positionSelectLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    uniteTypeLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    volumeBallonsLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    airCompressionLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    airConsumptionLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                    gearOperationLine.layerLine(strokeColors: UIColor.newLabelDark.cgColor)
                } else {
                    view.backgroundColor = .white
                    numberParthLine.layerLine(strokeColors: UIColor.black.cgColor)
                    changeNumberLine.layerLine(strokeColors: UIColor.black.cgColor)
                    positionSelectLine.layerLine(strokeColors: UIColor.black.cgColor)
                    uniteTypeLine.layerLine(strokeColors: UIColor.black.cgColor)
                    volumeBallonsLine.layerLine(strokeColors: UIColor.black.cgColor)
                    airCompressionLine.layerLine(strokeColors: UIColor.black.cgColor)
                    airConsumptionLine.layerLine(strokeColors: UIColor.black.cgColor)
                    gearOperationLine.layerLine(strokeColors: UIColor.black.cgColor)
                }
                
                dasvView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
                dasvView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
                dasvView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
                dasvView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true

                // all textfield constraint
                infoLabel.topAnchor.constraint(equalTo: dasvView.topAnchor, constant: 20).isActive = true
                infoLabel.leadingAnchor.constraint(equalTo: dasvView.leadingAnchor, constant: 20).isActive = true
                infoLabel.trailingAnchor.constraint(equalTo: dasvView.trailingAnchor, constant: -20).isActive = true
                
                numberParth.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
                numberParth.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
                numberParth.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
//                numberParth.heightAnchor.constraint(equalToConstant: 30).isActive = true

                changeNumber.topAnchor.constraint(equalTo: numberParth.bottomAnchor, constant: 20).isActive = true
                changeNumber.leadingAnchor.constraint(equalTo: numberParth.leadingAnchor).isActive = true
                changeNumber.trailingAnchor.constraint(equalTo: numberParth.trailingAnchor).isActive = true
//                changeNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                positionSelect.topAnchor.constraint(equalTo: changeNumber.bottomAnchor, constant: 20).isActive = true
                positionSelect.leadingAnchor.constraint(equalTo: changeNumber.leadingAnchor).isActive = true
                positionSelect.trailingAnchor.constraint(equalTo: changeNumber.trailingAnchor).isActive = true
//                positionSelect.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                unitTypeField.topAnchor.constraint(equalTo: positionSelect.bottomAnchor, constant: 20).isActive = true
                unitTypeField.leadingAnchor.constraint(equalTo: positionSelect.leadingAnchor).isActive = true
                unitTypeField.trailingAnchor.constraint(equalTo: positionSelect.trailingAnchor).isActive = true
//                unitTypeField.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                volumeBallons.topAnchor.constraint(equalTo: unitTypeField.bottomAnchor, constant: 20).isActive = true
                volumeBallons.leadingAnchor.constraint(equalTo: unitTypeField.leadingAnchor).isActive = true
                volumeBallons.trailingAnchor.constraint(equalTo: unitTypeField.trailingAnchor).isActive = true
//                volumeBallons.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                airCompression.topAnchor.constraint(equalTo: volumeBallons.bottomAnchor, constant: 20).isActive = true
                airCompression.leadingAnchor.constraint(equalTo: volumeBallons.leadingAnchor).isActive = true
                airCompression.trailingAnchor.constraint(equalTo: volumeBallons.trailingAnchor).isActive = true
//                airCompression.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                airConsumption.topAnchor.constraint(equalTo: airCompression.bottomAnchor, constant: 20).isActive = true
                airConsumption.leadingAnchor.constraint(equalTo: airCompression.leadingAnchor).isActive = true
                airConsumption.trailingAnchor.constraint(equalTo: airCompression.trailingAnchor).isActive = true
//                airConsumption.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                gearOperation.topAnchor.constraint(equalTo: airConsumption.bottomAnchor, constant: 20).isActive = true
                gearOperation.leadingAnchor.constraint(equalTo: airConsumption.leadingAnchor).isActive = true
                gearOperation.trailingAnchor.constraint(equalTo: airConsumption.trailingAnchor).isActive = true
//                gearOperation.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                saveButton.topAnchor.constraint(equalTo: gearOperation.bottomAnchor, constant: 20).isActive = true
                saveButton.leadingAnchor.constraint(equalTo: gearOperation.leadingAnchor).isActive = true
                saveButton.trailingAnchor.constraint(equalTo: gearOperation.trailingAnchor).isActive = true
                saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
                infoLabel.sizeLabel(height: Double(view.bounds.height))
                buttonGardients.gardientButton(w: saveButton.frame.size.width, h: saveButton.frame.size.height)
                saveButton.layer.insertSublayer(buttonGardients, at: 0)
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                numberParth.delegate = self
                changeNumber.delegate = self
                positionSelect.delegate = self
                unitTypeField.delegate = self
                volumeBallons.delegate = self
                airCompression.delegate = self
                airConsumption.delegate = self
                gearOperation.delegate = self
                
                
                let changeNumberPicker = UIPickerView()
                    changeNumberPicker.delegate = self
                    changeNumberPicker.tag = 0
                    changeNumber.inputView = changeNumberPicker
                let PositionPicker = UIPickerView()
                    PositionPicker.delegate = self
                    PositionPicker.tag = 1
                    positionSelect.inputView = PositionPicker
                let unitTypePicker = UIPickerView()
                    unitTypePicker.delegate = self
                    unitTypePicker.tag = 2
                    unitTypeField.inputView = unitTypePicker
                
        let viewTouchHideKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        viewTouchHideKey.cancelsTouchesInView = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Помощь", style: .plain, target: self, action: #selector(helperInfo))

        if #available(iOS 13, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.backgroundColor = .clear
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.barTintColor = .clear
        }
        
        view.addSubview(dasvView)
        dasvView.addSubview(infoLabel)
        dasvView.addSubview(numberParth)
        dasvView.addSubview(changeNumber)
        dasvView.addSubview(positionSelect)
        dasvView.addSubview(unitTypeField)
        dasvView.addSubview(volumeBallons)
        dasvView.addSubview(airCompression)
        dasvView.addSubview(airConsumption)
        dasvView.addSubview(gearOperation)
        dasvView.addSubview(saveButton)
        dasvView.addGestureRecognizer(viewTouchHideKey)
    }
    
    @objc func helperInfo() {
        let Alert = UIAlertController(title: "Автозаполнение", message: "Если вы не знаете точных данных, то выберите свой аппарат", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "Для ОМЕГА", style: .default, handler: { (UIAlertAction) in
            self.AlertView(text: "Данные указанные здесь являются приблезительными! Если Ваш аппарат имеет два баллона, то указывается общий объем!")
            self.volumeBallons.text = "6.8"
            self.airCompression.text = "1.1"
            self.airConsumption.text = "40"
            self.gearOperation.text = "10"
            
        }))
        Alert.addAction(UIAlertAction(title: " Для MSA AUER", style: .default, handler: { (UIAlertAction) in
            self.AlertView(text: "Данные указанные здесь являются приблезительными! Если Ваш аппарат имеет два баллона, то указывается общий объем!")
            self.volumeBallons.text = "7"
            self.airCompression.text = "1"
            self.airConsumption.text = "50"
            self.gearOperation.text = "10"
        }))
        Alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(Alert, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField.tag {
            case 0: changeNumber.becomeFirstResponder()
            case 1: unitTypeField.becomeFirstResponder()
            case 2: positionSelect.becomeFirstResponder()
            case 3: volumeBallons.becomeFirstResponder()
            case 4: airCompression.becomeFirstResponder()
            case 5: airConsumption.becomeFirstResponder()
            case 6: gearOperation.becomeFirstResponder()
            case 7: print("SAVE DATA")
        default: print(textField.tag)
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
         switch textField.tag {
             case 0: if numberParth.text == "" {AlertView(text: "Укажите номер части!")} else {print("save")}
             case 1: if changeNumber.text == "" {AlertView(text: "Укажите номер караула!")} else {print("save")}
             case 2: if positionSelect.text == "" {AlertView(text: "Укажите вашу должность!")} else {print("save")}
             case 3: if unitTypeField.text == "" {AlertView(text: "Укажите тип аппарата!")} else {print("save")}
             case 4: if volumeBallons.text == "" {AlertView(text: "Укажите объем баллона(ов)!")} else {print("save")}
             case 5: if airCompression.text == "" {AlertView(text: "Укажите коэф. сжатия воздуха!")} else {print("save")}
             case 6: if airConsumption.text == "" {AlertView(text: "Укажите средний расход воздуха!")} else {print("save")}
             case 7: if gearOperation.text == "" {AlertView(text: "Укажите давление стабильной работы редуктора!")} else {print("save")}
         default: print(textField.tag)
         }
    }
    //picker view
        //MARK: PickerView
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch pickerView.tag {
                case 0: return positionNumersInt.count
                case 1: return PositionSel.count
                case 2: return UnitType.count
                default: return 0
            }
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView.tag {
                case 0: return positionNumersInt[row]
                case 1: return PositionSel[row]
                case 2: return UnitType[row]
                default: return nil
            }
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch pickerView.tag {
            case 0: changeNumber.text = positionNumersInt[row]
            case 1: positionSelect.text = PositionSel[row]
            case 2: unitTypeField.text = UnitType[row]
            default: print("nil")
            }
        }
    @objc func hideKeyboard() {
        dasvView.endEditing(true)
    }
    
    @objc func testCheking(_ textField: UITextField) {
        let text = """
        Ваше Имя \(nameUser!)
        Работаете в \(changeNumber.text!) карауле
        Ваше Отчество \(patronymicUser!)
        Родились \(dateBirthdayUser!)!
        Ваш город\(cityUser!)
        Объем вашего баллона \(volumeBallons.text!) л.
        Вы \(positionSelect.text!)
        Коэффециент сжатия воздуха \(airCompression.text!)
        В части №\(numberParth.text!)
        средний расход будет \(airConsumption.text!) л/с
        А редуктор стабильно работает при \(gearOperation.text!) Bar
        type \(unitTypeField.text!)
        """

        AlertView(text: text)
    }
    @objc func saveUserData() {
        guard numberParth.text! != "" else {return AlertView(text: "Укажите номер части!")}
        guard changeNumber.text! != "" else {return AlertView(text: "Укажите номер караула!")}
        guard positionSelect.text! != "" else {return AlertView(text: "Укажите доолжность!")}
        guard unitTypeField.text! != "" else {return AlertView(text: "Выберите тип аппарата!")}
        guard volumeBallons.text! != "" else {return AlertView(text: "Укажите объем баллона(ов)!")}
        guard airCompression.text! != "" else {return AlertView(text: "Укажите коэф. сжатия воздуха!")}
        guard airConsumption.text! != "" else {return AlertView(text: "Укажите средний расход воздуха!")}
        guard gearOperation.text! != "" else {return AlertView(text: "Укажите давление работы редуктора!")}
        coreDataSave.userName = nameUser
        coreDataSave.userPatronymic = patronymicUser
        coreDataSave.userCity = cityUser
        coreDataSave.userPartNum = numberParth.text!
        coreDataSave.userPosition = positionSelect.text!
        coreDataSave.userChange = Int(changeNumber.text!)
        coreDataSave.userBirthday = dateBirthdayUser
        coreDataSave.userPhoto = userPhoto
        coreDataSave.userVBallons = Double(volumeBallons.text!.forrmated)!
        coreDataSave.userAirFlow = Double(airConsumption.text!.forrmated)!
        coreDataSave.userAspectRatio = Double(airCompression.text!.forrmated)!
        coreDataSave.userGearboxOperation = Int(gearOperation.text!.forrmated)!
        coreDataSave.userUnitType = unitTypeField.text!
        guard let imageData = userPhoto.jpegData(compressionQuality: 5) else {return }
        let uploadUserPhoto = self.imageReference.child("\(userTocken!).png")
                let uploadFileToFirebase = uploadUserPhoto.putData(imageData, metadata: nil) { (metadata, error) in
                    print(metadata ?? "Error metadata")
                    print(error ?? "Error nil")
                }
                uploadFileToFirebase.resume()
        let saveDataBase = userInfoFIR(Name: nameUser, Patronymic: patronymicUser, City: cityUser, Position: positionSelect.text!, PartNumb: numberParth.text!, ChangeNum: Int(changeNumber.text!)! as NSNumber, BirthDay: dateBirthdayUser, UnitType: unitTypeField.text!,vballons: Double(volumeBallons.text!.forrmated)! as NSNumber, AspectRatio: Double(airCompression.text!.forrmated)! as NSNumber, AirFlow: Double(airConsumption.text!.forrmated)! as NSNumber, GearboxOperation: Double(gearOperation.text!.forrmated)! as NSNumber)
                    let infoRef = self.DataReference.child(userTocken!)
                        infoRef.setValue(saveDataBase.convertDataBase())
        nextVC()
    }
     private func nextVC() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        Vc.modalPresentationStyle = .fullScreen
        present(Vc, animated: true, completion: nil)
        }
}
