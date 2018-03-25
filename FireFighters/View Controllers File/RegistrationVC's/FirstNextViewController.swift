import UIKit
//import MBProgressHUD
import Firebase



class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
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
    let uploadStorage = Storage()
    let PositionSel = ["Пожарный","Командир отделения","Нач.караула","ПНЧ","Диспетчер"]
    var PositionName = "Пожарный"
    var user: Users!
    var ref: DatabaseReference!
    var name: String!
    var Patronymic: String!
    var city: String!
    var birthDay: String!
    var userPhoto: UIImage!
    var imageReferencs: StorageReference {
        return Storage.storage().reference().child("userPhoto")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        CustomClass.CustomButton(nameBut: "Сохранить", buttons: saveButton)
        guard let currentUser = Auth.auth().currentUser else { return }
        user = Users(user: currentUser)
        ref = Database.database().reference(withPath: "firefighter")
        vBallons.delegate = self
        AspectRatio.delegate = self
        AirFlow.delegate = self
        GearboxOperation.delegate = self
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

    //MARK: Предупреждение
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            
            view.endEditing(true)
            CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func checkInfoWork(changeNum: Int, partNumb: String, position: String,vBallon: Double, airFlow: Double, AspectRatio: Double,GearboxOperation: Int ){
        guard changeNum != 0 else{ return errorsMassages(errors: "Вы не указали свою дежурную смену(Караул)!")}
        guard changeNum < 4  else{ return errorsMassages(errors: "Вы указали не существующую смену")}
        guard partNumb != "" else {return errorsMassages(errors: "Вы не указали номер своей части!")}
        guard position != "" else {return errorsMassages(errors: "Вы не точно указали свою должность!")}
        guard vBallon != 0.0 else {return errorsMassages(errors: "Укажите объем баллона!")}
        guard airFlow != 0.0 else {return errorsMassages(errors: "Укажите средний расход воздуха в вашем подразделении!")}
        guard AspectRatio != 0.0 else {return errorsMassages(errors: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
        guard GearboxOperation != 0 else {return errorsMassages(errors: "Укажите давление для стабильной работы редуктора!")}
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
            let uploadUserPhoto = imageReferencs.child("\(user.uid).png")
        let uploadFileToFirebase = uploadUserPhoto.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "Error metadata")
            print(error ?? "Error nil")
        }
        uploadFileToFirebase.resume()
            let saveDataBase = userInfoFIR(UsersID: user.uid, Name: name, Patronymic: Patronymic, City: city, Position: position, PartNumb: partNumb, ChangeNum: Int(changeNum) as NSNumber, BirthDay: birthDay, UnitType: selUnitType(type: userUnitTypeSel),vballons: vBallon as NSNumber, AspectRatio: AspectRatio as NSNumber, AirFlow: airFlow as NSNumber, GearboxOperation: GearboxOperation as NSNumber)
            let infoRef = self.ref.child(user.uid)
                infoRef.setValue(saveDataBase.convertDataBase())
            nextVC()

    }

    @IBAction func acceptSaveButton(_ sender: Any) {
        guard ChangeNum.text != "" else{ return errorsMassages(errors: "Вы не указали свою дежурную смену(Караул)!")}
        guard partNumb.text != "" else {return errorsMassages(errors: "Вы не указали номер своей части!")}
        guard vBallons.text != "" else {return errorsMassages(errors: "Укажите объем баллона!")}
        guard AirFlow.text != "" else {return errorsMassages(errors: "Укажите средний расход воздуха в вашем подразделении!")}
        guard AspectRatio.text != "" else {return errorsMassages(errors: "Укажите коэффициент сжатия воздуха(Уточните на базе ГДЗС или мастера ГДЗС)")}
        guard GearboxOperation.text != "" else {return errorsMassages(errors: "Укажите давление для стабильной работы редуктора!")}
        checkInfoWork(changeNum: Int(ChangeNum.text!)!, partNumb: partNumb.text!, position: PositionName, vBallon: Double(vBallons.text!)!, airFlow: Double(AirFlow.text!)!, AspectRatio: Double(AspectRatio.text!)!, GearboxOperation: Int(GearboxOperation.text!)!)
    }
    private func nextVC() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        present(Vc, animated: true, completion: nil)
    }
}
