import UIKit
import Firebase
class MainViewController: UIViewController,getTockenUser {

    let userInfo = UserProfile.userInform
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    private var themeCollectionView = ThemeUICollectionView()
    let userTypeDef = UserDefaults.standard
    
    
    override func viewDidLayoutSubviews() {
        profileImage.circleImage()
        //iPad version
        if UIDevice.current.model == "iPad" {
            navigationController?.isNavigationBarHidden = true
        } else {
            navigationController?.isNavigationBarHidden = false
        }
        //UICollection init
        themeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        themeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        themeCollectionView.topAnchor.constraint(equalTo: welcomeMessage.bottomAnchor, constant: 1).isActive = true
        themeCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        welcomeMessage.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(userTypeDef.integer(forKey: "TypeUser"))
        title = "Главная"
        chekingRegistration()
        profileImage.image = userInfo.userPhoto
        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"
        themeCollectionView.setTheme(cells: ThemeModel.fetchThemeSection())
        view.addSubview(themeCollectionView)
        themeCollectionView.RootViewController = self
       // updateView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil)
        chekingRegistration()
        updateView()
    }
    // Проверяет правильность регистрации
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
    // Сохроняет данные при авторизации
    func saveData() {
        let saveDataBase = userInfoFIR(Name: userInfo.userName, Patronymic:  userInfo.userPatronymic, City:  userInfo.userCity, Position: userInfo.userPosition, PartNumb:  userInfo.userPartNum, ChangeNum: Int(userInfo.userPartNum)! as NSNumber, BirthDay: userInfo.userBirthday, UnitType: userInfo.userUnitType,vballons: userInfo.userVBallons as NSNumber,AspectRatio: userInfo.userAspectRatio as NSNumber, AirFlow: userInfo.userAirFlow as NSNumber, GearboxOperation: userInfo.userGearboxOperation as NSNumber)
        let infoRef = self.DataReference.child(userTocken!)
        infoRef.setValue(saveDataBase.convertDataBase())
    }
    // Обновление темной темы
    func updateView() {
        let loadVeiw = DispatchQueue.main
        loadVeiw.async {
            self.view.darkThemeView()
            self.welcomeMessage.darkThemeLabel()
            self.navigationController?.navigationBar.darkThemeNav()
            self.tabBarController?.tabBar.darkThemeBar()
        }
    }
    //Обработка информации об изменении темы оформления
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Dark"] as? String else { return }
        if Dark != "" {
            updateView()
        }
    }
}

