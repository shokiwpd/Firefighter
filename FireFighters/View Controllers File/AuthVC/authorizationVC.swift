import UIKit
import FirebaseAuth
import Firebase
import MBProgressHUD
import Locksmith

class authorizationVC: UIViewController, UITextFieldDelegate,getTockenUser{

    
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
    var loginLine = CAShapeLayer()
    var passwordLine = CAShapeLayer()
    var buttonGardients = CAGradientLayer()
    //MARK: Классы и переменные
    let Custom = UICustomClass()
    var userInfo = UserProfile.userInform
    let apiresp = loadFirebaseData()
    //MARK: Лойауты и фон
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        buttonGardients.gardientButton(w: authButtonStyle.frame.size.width, h: authButtonStyle.frame.size.height)
        authButtonStyle.customButtonColor(radius: authButtonStyle.bounds.height / 2, nameBut: "Авторизироваться", titleColor: .black, shadowColors: UIColor.black.cgColor)
        authButtonStyle.layer.insertSublayer(buttonGardients, at: 0)
        loginLine.layerLine(strokeColors: UIColor.gray.cgColor)
        passwordLine.layerLine(strokeColors: UIColor.gray.cgColor)
        loginView.lineToTextField(shape: loginLine)
        passwordView.lineToTextField(shape: passwordLine)
    }
    //--------------------------------------------------------------------------
    //MARK: Загрузка первичных настроек
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        passwordView.delegate = self
    }
    //MARK: Проверка всех полей и базы данных FireBase
    @IBAction func authorizationButton(_ sender: Any) {
        guard loginView.text != "" else {return AlertView(text: "Укажите свой логин!")}
        guard passwordView.text != "" else {return AlertView(text: "Вы забыли указать пароль")}
        
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, AuthErrors) in
            //Проверка на наличие ошибок с сервера

            guard AuthErrorCode(rawValue: AuthErrors!._code) == nil else {return self!.fetchError(AuthErrors!)}
            //Проверка на существование пользователя в БД Firebase
            guard user != nil else { return }
            //Включение индикатора загрузки
                self?.progressView()
            //загрузка данных из Firebase
                self?.fetchFirebase()
            //сохранение логина и пароля
                self?.saveLoginAndPass(Login: (self?.loginView.text!)!, Password: (self?.passwordView.text!)!)
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

    //MARK: Загрузка данных из FireBase
private func fetchFirebase() {
    var userImage = UIImage()
    let uploadUserPhoto = self.imageReference.child("\(self.userTocken!).png")
    let queue = DispatchQueue.main
    queue.async {
        guard self.userTocken != "" else { return }
        let DownloadImage = uploadUserPhoto.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                userImage = UIImage(data: data)!
            }
                print(error ?? "Errors no")
        }
        DownloadImage.observe(.progress, handler: { (snapshot) in
            if snapshot.progress?.fractionCompleted == 1.0 {
                Database.database().reference().child("firefighter").child(self.userTocken!).observeSingleEvent(of: .value) {[weak self](snapshot) in
            let value = snapshot.value as? NSDictionary
            self?.apiresp.userData(data: value!)
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
    //MARK: Сохранение логина и пароля
    func saveLoginAndPass(Login: String, Password: String){
        if Login != "", Password != "" {
            do {
                try Locksmith.saveData(data: ["login" : Login, "password" : Password], forUserAccount: "fireFigherAccount", inService: "https://vk.com/firefighterapp")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

