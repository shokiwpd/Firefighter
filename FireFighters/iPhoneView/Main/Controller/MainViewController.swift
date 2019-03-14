import UIKit
import Firebase
class MainViewController: UIViewController,getTockenUser {//,UITableViewDelegate,UITableViewDataSource {

    let userInfo = UserProfile.userInform
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var newsTableView: UITableView!

    
    override func viewDidLayoutSubviews() {
        profileImage.circleImage()
        newsTableView.backgroundColor = UIColor.clear

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if String(Auth.auth().currentUser!.uid) != "XdA2rQeLXfWLhg1ezNjPxts1fAr2" {
        }
        title = "Главная"
        chekingRegistration()
        profileImage.image = userInfo.userPhoto
        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"
       // updateView()
    }
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
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

