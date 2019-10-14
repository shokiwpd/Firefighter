import UIKit
//import MBProgressHUD
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
    
    private var daskView: UIView = {
        let view = UIView()
       return view
    }()
    private var dasvView: UIView = {
        let view = UIView()
        return view
    }()
    //--- number parth
    private var numberParthInfo: UILabel = {
        let label = UILabel()
        return label
    }()
    private var numberParth: UITextField = {
        let text = UITextField()
        return text
    }()
    //---  change number
    private var changeNumberInfo: UILabel = {
        let label = UILabel()
        return label
    }()
    private var changeNumber: UITextField = {
        let text = UITextField()
        return text
    }()
    //--- user position
    private var  positionInfo: UILabel = {
       let label = UILabel()
        return label
    }()
    private var positionSelect: UITextField = {
        let text = UITextField()
        return text
    }()
    //--- ballons
    private var volumeBallonsInfo: UILabel = {
       let label = UILabel()
        return label
    }()
    private var volumeBallons: UITextField = {
        let text = UITextField()
        return text
    }()
    //--- air compression
    private var airCompressionInfo: UILabel = {
        let label = UILabel()
        return label
    }()
    private var airCompression: UITextField = {
       let text = UITextField()
        return text
    }()
    //--- air consumption
    private var airConsumptionInfo: UILabel = {
        let label = UILabel()
        return label
    }()
    private var airConsumption: UITextField = {
        let text = UITextField()
        return text
    }()
    //--- air gear operation
    private var gearOperationInfo: UILabel = {
        let label = UILabel()
        return label
    }()
    private var gearOperation: UITextField = {
        let text = UITextField()
        return text
    }()
    //--- save and registration button
    private var saveButton: UIButton = {
        let button = UIButton()
        return button
    }()
    //--- select type
    
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    





}
