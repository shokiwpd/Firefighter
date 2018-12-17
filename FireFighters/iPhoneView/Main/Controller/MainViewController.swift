import UIKit
import Firebase
class MainViewController: UIViewController,UICollectionViewDelegate,getTockenUser {
    let userInfo = UserProfile.userInform
    
    @IBOutlet weak var weatherAPI: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var InformationCollection: UICollectionView!
    override func viewDidLayoutSubviews() {
        profileImage.circleImage()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        chekingRegistration()
        profileImage.image = userInfo.userPhoto
        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil)
        chekingRegistration()
        updateView()
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
    func updateView() {
        let loadVeiw = DispatchQueue.main
        loadVeiw.async {
            self.view.darkThemeView()
            self.welcomeMessage.darkThemeLabel()
            self.navigationController?.navigationBar.darkThemeNav()
            self.tabBarController?.tabBar.darkThemeBar()
        }
    }
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Dark"] as? String else { return }
        if Dark != "" {
            updateView()
        }
    }
}

