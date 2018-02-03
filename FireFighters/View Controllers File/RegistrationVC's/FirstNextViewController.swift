import UIKit
import MBProgressHUD
import Firebase


class FirstNextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var partNumb: UITextField!
    @IBOutlet weak var ChangeNum: UITextField!
    @IBOutlet weak var Position: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var userUnitTypeSel: UISegmentedControl!
    //MARK: Var
    let userInformSave = UserProfile.userInform
    let CustomClass = UICustomClass()
    let PositionSel = ["Пожарный","Командир отделения","Нач.караула","ПНЧ"]
    var PositionName = "Пожарный"
    var user: Users!
    var ref: DatabaseReference!
    var name: String!
    var Patronymic: String!
    var city: String!
    var birthDay: String!
    var userPhoto: UIImage!
    //var userDataBase = Array<userInfoFIR>
    //MARK:Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomClass.CustomButton(nameBut: "Сохранить", buttons: saveButton)
        self.view.backgroundColor = UIColor.blue
        guard let currentUser = Auth.auth().currentUser else { return }
        user = Users(user: currentUser)
        ref = Database.database().reference(withPath: "firefighter")
        print("ref\(ref)")
        
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
    
    
    
    func checkInfoWork(changeNum: Int, partNumb: String, position: String){
        switch partNumb{
        case "":
                errorsMassages(errors: "Вы не указали номер своей части!")
        default:
            switch changeNum{
            case 0:
                errorsMassages(errors: "Вы не указали свою дежурную смену(Караул)!")
            default:
                switch position {
                    case "":
                    errorsMassages(errors: "Ошибка выбора!")
                    default:
                    userInformSave.userUnitType = selUnitType(type: userUnitTypeSel)
                    userInformSave.userName = name
                    userInformSave.userPatronymic = Patronymic
                    userInformSave.userCity = city
                    userInformSave.userPosition = position
                    userInformSave.userPartNum = partNumb
                    userInformSave.userChange = Int(changeNum)
                    userInformSave.userBirthday = birthDay
                    userInformSave.userPhoto = userPhoto
                    let saveDataBase = userInfoFIR(UsersID: user.uid, Name: name, Patronymic: Patronymic, City: city, Position: position, PartNumb: partNumb, ChangeNum: Int(changeNum) as NSNumber, BirthDay: birthDay, UnitType: selUnitType(type: userUnitTypeSel))
                    let infoRef = self.ref.child(user.uid)
                    infoRef.setValue(saveDataBase.convertDataBase())
                    nextVC()
                }
            }
        }
    }

    @IBAction func acceptSaveButton(_ sender: Any) {
        checkInfoWork(changeNum: Int(ChangeNum.text!)!, partNumb: partNumb.text!, position: PositionName)
    }
    private func nextVC() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
}
