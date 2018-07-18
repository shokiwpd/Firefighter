import UIKit
import Firebase
class MainViewController: UIViewController,UICollectionViewDelegate,getTockenUser {
    let userInfo = UserProfile.userInform
    
    @IBOutlet weak var weatherAPI: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var InformationCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chekingRegistration()
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        title = "Главная"
        profileImage.image = userInfo.userPhoto
        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        chekingRegistration()
    }
    override func viewDidLayoutSubviews() {
        profileImage.circleImage()
    }
    
    private func chekingRegistration(){
        let turn = DispatchQueue.global(qos: .background)
        turn.sync {
            DataReference.child(self.userTocken!).observeSingleEvent(of: .value) {[weak self](snapshot) in
                let value = snapshot.value as? NSDictionary
                guard self?.userInfo.userName != nil else { return self!.AlertView(text: "Ошибка регистрации!")}
                guard value != nil else { return self!.saveData()}
                
            }
        }
    }
    func saveData() {
        let saveDataBase = userInfoFIR(Name: userInfo.userName, Patronymic:  userInfo.userPatronymic, City:  userInfo.userCity, Position: userInfo.userPosition, PartNumb:  userInfo.userPartNum, ChangeNum: Int(userInfo.userPartNum)! as NSNumber, BirthDay: userInfo.userBirthday, UnitType: userInfo.userUnitType,vballons: userInfo.userVBallons as NSNumber,AspectRatio: userInfo.userAspectRatio as NSNumber, AirFlow: userInfo.userAirFlow as NSNumber, GearboxOperation: userInfo.userGearboxOperation as NSNumber)
        let infoRef = self.DataReference.child(userTocken!)
        infoRef.setValue(saveDataBase.convertDataBase())
    }
}

