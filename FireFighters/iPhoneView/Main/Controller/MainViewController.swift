import UIKit
import Firebase
import iosMath
class MainViewController: UIViewController {
//,getTockenUser
//    let userInfo = UserProfile.userInform
//    let typeCheking = TypeString.TypeStrings
//
//    @IBOutlet weak var profileImage: UIImageView!
//    @IBOutlet weak var welcomeMessage: UILabel!
//     var themeCollectionView = ThemeUICollectionView()
//    override func viewDidLayoutSubviews() {
//        profileImage.circleImage()
//        //iPad version
//        if UIDevice.current.model == "iPad" {
//            navigationController?.isNavigationBarHidden = true
//        } else {
//            navigationController?.isNavigationBarHidden = false
//        }
//        //UICollection init
//        themeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        themeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        themeCollectionView.topAnchor.constraint(equalTo: welcomeMessage.bottomAnchor, constant: 1).isActive = true
//        themeCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
////        welcomeMessage.translatesAutoresizingMaskIntoConstraints = false
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Главная"
//        chekingRegistration()
//        profileImage.image = userInfo.userPhoto
//        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"
//
//       // updateView()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(updateCollection), name: NSNotification.Name.init(rawValue: "updateName"), object: nil)
//        view.addSubview(themeCollectionView)
//        themeCollectionView.RootViewController = self
//        themeCollectionView.setTheme(cells: ThemeModel.fetchThemeSection())
//        chekingRegistration()
//        if typeCheking.nameType == "" {
//            alertSelect()
//        }
//    }
//    // Проверяет правильность регистрации
//    private func chekingRegistration(){
//        let turn = DispatchQueue.global(qos: .background)
//        turn.sync {
//            DataReference.child(self.userTocken!).observeSingleEvent(of: .value) {[weak self](snapshot) in
//                let value = snapshot.value as? NSDictionary
//                guard self?.userInfo.userName != nil else { return self!.AlertView(text: "Ошибка регистрации!")}
//                guard value != nil else { return self!.saveData()}
//
//            }
//        }
//    }
//    // Сохроняет данные при авторизации
//    func saveData() {
//        let saveDataBase = userInfoFIR(Name: userInfo.userName, Patronymic:  userInfo.userPatronymic, City:  userInfo.userCity, Position: userInfo.userPosition, PartNumb:  userInfo.userPartNum, ChangeNum: Int(userInfo.userPartNum)! as NSNumber, BirthDay: userInfo.userBirthday, UnitType: userInfo.userUnitType,vballons: userInfo.userVBallons as NSNumber,AspectRatio: userInfo.userAspectRatio as NSNumber, AirFlow: userInfo.userAirFlow as NSNumber, GearboxOperation: userInfo.userGearboxOperation as NSNumber)
//        let infoRef = self.DataReference.child(userTocken!)
//        infoRef.setValue(saveDataBase.convertDataBase())
//    }
//    // Обновление темной темы
//    func updateView() {
//        let loadVeiw = DispatchQueue.main
//        loadVeiw.async {
//            self.view.darkThemeView()
//            self.welcomeMessage.darkThemeLabel()
////            self.navigationController?.navigationBar.darkThemeNav()
//            self.tabBarController?.tabBar.darkThemeBar()
//        }
//    }
//    func alertSelect(){
//        let alertChek = UIAlertController(title: "Выберите марку аппарата", message: "Выберите из списка Ваш аппарат используемый в подразделении", preferredStyle: .alert)
//        let AUER = UIAlertAction(title: "AUER", style: .default) { (UIAlertAction) in
//            self.typeCheking.nameType = "AUER"
//            self.updateType()
//        }
//        let OMEGA = UIAlertAction(title: "ОМЕГА", style: .default) { (UIAlertAction) in
//            self.typeCheking.nameType = "ОМЕГА"
//            self.updateType()
//        }
//        let defaults = UIAlertAction(title: "Прочие", style: .cancel) { (UIAlertAction) in
//            self.typeCheking.nameType = "Прочие"
//            self.updateType()
//        }
//        alertChek.addAction(AUER)
//        alertChek.addAction(OMEGA)
//        alertChek.addAction(defaults)
//        present(alertChek, animated: true, completion: nil)
//    }
//    //Обработка информации об изменении темы оформления
//    @objc func DarkNotification(notif: Notification) {
//        guard let userInfo  = notif.userInfo, let Dark = userInfo["Dark"] as? String else { return }
//        if Dark != "" {
//            updateView()
//            print(Dark)
//        }
//    }
//    @objc func updateCollection(notif: Notification){
//        guard let userInfo = notif.userInfo, let _ = userInfo["Name"] as? String else { return }
//        let loadVeiw = DispatchQueue.main
//        loadVeiw.async {
//            self.themeCollectionView.setTheme(cells: ThemeModel.fetchThemeSection())
//            self.themeCollectionView.reloadData()
//        }
//    }
//    func updateType (){
//        let loadQ = DispatchQueue.main
//        loadQ.async {
//            self.themeCollectionView.setTheme(cells: ThemeModel.fetchThemeSection())
//            self.themeCollectionView.reloadData()
//        }pod 'Firebase/Core'
//    pod 'Firebase/Database'
//    pod 'Firebase/Auth'
//    pod 'Firebase/Storage'
//    pod 'Firebase/Messaging'
//    pod 'MBProgressHUD'
//    pod 'ReachabilitySwift'
//    pod 'iosMath'
//    pod 'IQKeyboardManagerSwift'
//    }
////    @objc func DarkNotification(notif: Notification) {
////        guard let userInfo  = notif.userInfo, let Dark = userInfo["Name"] as? String else { return }
////        refresh()
////    }
//    //Выбор аппарата

    var themeCollectionView = ThemeUICollectionView()

    override func viewWillLayoutSubviews() {
        self.view.viewThemeColor()
        themeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        themeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        themeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        themeCollectionView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor).isActive = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(themeCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
                themeCollectionView.RootViewController = self

    }
    
    
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                self.view.viewThemeColor()
//                self.themeCollectionView.viewThemeColor()
            }
        }
    }
    
}
