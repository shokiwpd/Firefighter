import UIKit
import FirebaseAuth
import Firebase
import MBProgressHUD
import CoreGraphics

class authorizationVC: UIViewController, UITextFieldDelegate{
    //MARK: Оутлеты и их настройки
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.font = UIFont(name: "signpainter-housescript", size: 47)
        }
    }
    @IBOutlet weak var loginView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    @IBOutlet weak var authButtonStyle: UIButton!
    //MARK: Гардиенты и линии
    var loginLine: CAShapeLayer! {
        didSet {
            loginLine.layerLine(strokeColors: UIColor.gray.cgColor)
        }
    }
    var passwordLine: CAShapeLayer! {
        didSet {
            passwordLine.layerLine(strokeColors: UIColor.gray.cgColor)
        }
    }
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.gradientsColor()
        }
    }
    //MARK: Классы и переменные
    let offlineAuth = false
    var userInfo = UserProfile.userInform
    var imageDownloadRef: StorageReference {
        return Storage.storage().reference().child("userPhoto")
    }
    
    //MARK: Лойауты и фон
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: authButtonStyle.frame.size.width, height: authButtonStyle.frame.size.height)
        authButtonStyle.layer.insertSublayer(buttonGardients, at: 0)
        loginLine = CAShapeLayer()
        passwordLine = CAShapeLayer()
        loginView.lineToTextField(shape: loginLine)
        passwordView.lineToTextField(shape: passwordLine)
    }
    //MARK: Загрузка первичных настроек
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        passwordView.delegate = self
        authButtonStyle.customButtonColor(radius: 10, nameBut: "Авторизироваться", titleColor: .black, shadowColors: UIColor.black.cgColor)

    }
    //MARK: При повторной загрузке
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        authButtonStyle.customButtonColor(radius: 10, nameBut: "Авторизироваться", titleColor: .black, shadowColors: UIColor.black.cgColor)
    }
    //MARK: Проверка всех полей и базы данных FireBase
    @IBAction func authorizationButton(_ sender: Any) {
        guard loginView.text != "" else {return alertAction(errors: "Укажите свой логин!")}
        guard passwordView.text != "" else {return alertAction(errors: "Вы забыли указать пароль")}
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, error) in
            guard error == nil else { return (self?.alertAction(errors: "Ошибка пароля или Ваш аккаунт был удален(Точную информацию уточните у Разработчика)"))!}
            guard user != nil else { return }
                self?.authButtonStyle.customButtonColor(radius: 10, nameBut: "Авторизироваться", titleColor: .black, shadowColors: UIColor.black.cgColor)
                self?.progressView()
                self?.fetchFirebase()
        }
    }
    //MARK: Будущее восстановление пароля
    @IBAction func registrationButton(_ sender: Any) {
        //nextViewContr(nameVC: "firstStoryBoards", typeVC: "register")
        print("Password")
    }
    //MARK: Переход на другой сториборд
    func nextViewContr(nameVC: String) {
        let Vc = UIStoryboard(name: nameVC, bundle: nil).instantiateInitialViewController() as! UITabBarController
            present(Vc, animated: true, completion: nil)
    }

    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }

    //MARK: Загрузка данных из FireBase
fileprivate func fetchFirebase() {
    let getUserID: String! = Auth.auth().currentUser?.uid
    let uploadUserPhoto = self.imageDownloadRef.child("\(getUserID!).png")
    var userImage = UIImage()
    let queue = DispatchQueue.main
    queue.async {
        guard getUserID != nil else { return }
        let DownloadImage = uploadUserPhoto.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                userImage = UIImage(data: data)!
            }
                print(error ?? "Errors no")
        }
        DownloadImage.observe(.progress, handler: { (snapshot) in
            if snapshot.progress?.fractionCompleted == 1.0 {
        Database.database().reference().child("firefighter").child(getUserID).observeSingleEvent(of: .value) {[weak self](snapshot) in
            let value = snapshot.value as? NSDictionary
            self?.userInfo.userName = value?["name"] as? String ?? ""
            self?.userInfo.userPatronymic = value?["patronymic"]  as? String ?? ""
            self?.userInfo.userCity = value?["city"]  as? String ?? ""
            self?.userInfo.userPosition = value?["position"]  as? String ?? ""
            self?.userInfo.userPartNum = value?["partNumb"]  as? String ?? ""
            self?.userInfo.userChange = value?["changeNum"] as? Int ?? 0
            self?.userInfo.userBirthday = value?["birthDay"] as? String ?? ""
            self?.userInfo.userUnitType = value?["unitType"] as? String ?? ""
            self?.userInfo.userVBallons = value?["vBallons"] as? Double ?? 0.0
            self?.userInfo.userAirFlow = value?["airFlow"] as? Double ?? 0.0
            self?.userInfo.userAspectRatio = value?["aspectRatio"] as? Double ?? 0.0
            self?.userInfo.userGearboxOperation = value?["gearboxOperation"] as? Int ?? 0
            self?.nextViewContr(nameVC: "MainStoryboard")
            self?.userInfo.userPhoto = userImage
                    }
                }
            })
        }
    }
    //MARK: MBProgressHUD
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.labelText = "Готовим данные"
    }
}

