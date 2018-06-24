import UIKit
//import MBProgressHUD
import Firebase
import Reachability


class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,getTockenUser {
    @IBOutlet weak var partNumb: UITextField!
    @IBOutlet weak var ChangeNum: UITextField!
    @IBOutlet weak var Position: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var userUnitTypeSel: UISegmentedControl!
    @IBOutlet weak var vBallons: UITextField!
    @IBOutlet weak var AspectRatio: UITextField!
    @IBOutlet weak var AirFlow: UITextField!
    @IBOutlet weak var GearboxOperation: UITextField!
    //MARK: Var
    let userInformSave = UserProfile.userInform
    let CustomClass = UICustomClass()
    let PositionSel = ["Пожарный","Командир отделения","Нач.караула","ПНЧ","Диспетчер"]
    var PositionName = "Пожарный"
    var name: String!
    var Patronymic: String!
    var city: String!
    var birthDay: String!
    var userPhoto: UIImage!
    var saveDataButtonGardient = CAGradientLayer()
    var chekingConnect = Reachability()!

    override func viewDidLayoutSubviews() {
        saveDataButtonGardient.gardientButton(w: saveButton.frame.size.width, h: saveButton.frame.size.height)
        saveButton.layer.insertSublayer(saveDataButtonGardient, at: 0)
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        vBallons.delegate = self
        AspectRatio.delegate = self
        AirFlow.delegate = self
        GearboxOperation.delegate = self
        title = "Регистрация"
        saveButton.customButtonColor(radius: 10, nameBut: "Сохранить", titleColor: .black, shadowColors: UIColor.black.cgColor)
        guard userTocken != "" else { return print("user not creat") }
    }

    //MARK: PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PositionSel.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PositionSel[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PositionName = PositionSel[row]
    }

    func selUnitType(type: UISegmentedControl) -> String!{
        var types = ""
        switch type.selectedSegmentIndex {
            case 0: types = "ДАСВ"
            case 1: types = "ДАСК"
        default:
            print("Errors")
        }
        return types
    }
    
    func checkInfoWork(changeNum: Int, partNumb: String, position: String,vBallon: Double, airFlow: Double, AspectRatio: Double,GearboxOperation: Int ){
        guard changeNum != 0 else{ return AlertView(text: "Вы не указали свою дежурную смену(Караул)!")}
        guard changeNum < 5  else{ return AlertView(text: "Вы указали не существующую смену")}
        guard partNumb != "" else {return AlertView(text: "Вы не указали номер своей части!")}
        guard position != "" else {return AlertView(text: "Вы не точно указали свою должность!")}
        guard vBallon != 0.0 else {return AlertView(text: "Укажите объем баллона!")}
        guard airFlow != 0.0 else {return AlertView(text: "Укажите средний расход воздуха в вашем подразделении!")}
        guard AspectRatio != 0.0 else {return AlertView(text: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
        guard GearboxOperation != 0 else {return AlertView(text: "Укажите давление для стабильной работы редуктора!")}
            userInformSave.userUnitType = selUnitType(type: userUnitTypeSel)
            userInformSave.userName = name
            userInformSave.userPatronymic = Patronymic
            userInformSave.userCity = city
            userInformSave.userPosition = position
            userInformSave.userPartNum = partNumb
            userInformSave.userChange = Int(changeNum)
            userInformSave.userBirthday = birthDay
            userInformSave.userPhoto = userPhoto
            userInformSave.userVBallons = Double(vBallon)
            userInformSave.userAirFlow = Double(airFlow)
            userInformSave.userAspectRatio = Double(AspectRatio)
            userInformSave.userGearboxOperation = GearboxOperation
            guard let imageData = UIImageJPEGRepresentation(userPhoto, 5) else {return }
            let uploadUserPhoto = self.imageReference.child("\(userTocken!).png")
        
        let uploadFileToFirebase = uploadUserPhoto.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "Error metadata")
            print(error ?? "Error nil")
        }
        uploadFileToFirebase.resume()
            let saveDataBase = userInfoFIR(Name: name, Patronymic: Patronymic, City: city, Position: position, PartNumb: partNumb, ChangeNum: Int(changeNum) as NSNumber, BirthDay: birthDay, UnitType: selUnitType(type: userUnitTypeSel),vballons: vBallon as NSNumber, AspectRatio: AspectRatio as NSNumber, AirFlow: airFlow as NSNumber, GearboxOperation: GearboxOperation as NSNumber)
            let infoRef = self.DataReference.child(userTocken!)
                infoRef.setValue(saveDataBase.convertDataBase())
            nextVC()

    }

    @IBAction func acceptSaveButton(_ sender: Any) {
        guard chekingConnect.connection != .none else { return AlertView(text: "Проверьте соединение с инетернетом и повторите попытку позжу")}
        guard ChangeNum.text != "" else{ return AlertView(text: "Вы не указали свою дежурную смену(Караул)!")}
        guard partNumb.text != "" else {return AlertView(text: "Вы не указали номер своей части!")}
        guard vBallons.text != "" else {return AlertView(text: "Укажите объем баллона!")}
        guard AirFlow.text != "" else {return AlertView(text: "Укажите средний расход воздуха в вашем подразделении!")}
        guard AspectRatio.text != "" else {return AlertView(text: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
        guard GearboxOperation.text != "" else {return AlertView(text: "Укажите давление для стабильной работы редуктора!")}
        checkInfoWork(changeNum: Int(ChangeNum.text!)!, partNumb: partNumb.text!, position: PositionName, vBallon: Double(vBallons.text!.forrmated)!, airFlow: Double(AirFlow.text!.forrmated)!, AspectRatio: Double(AspectRatio.text!.forrmated)!, GearboxOperation: Int(GearboxOperation.text!)!)
    }
    private func nextVC() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        present(Vc, animated: true, completion: nil)
    }
}
