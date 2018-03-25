import UIKit
import FirebaseAuth
import Firebase
class authorizationVC: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var loginView: UITextField! {
        didSet {
            loginView.backgroundColor = UIColor.clear
           
        }
    }
    @IBOutlet weak var passwordView: UITextField! {
        didSet {
            passwordView.backgroundColor = UIColor.clear

        }
    }
    var textFieldCustom: CAShapeLayer! {
        didSet {
            textFieldCustom.fillColor = nil
            textFieldCustom.lineCap = "round"
            textFieldCustom.lineWidth = 2
            textFieldCustom.strokeColor = UIColor.black.cgColor
            textFieldCustom.strokeEnd = 1
        }
    }
    
    
    @IBOutlet weak var authButtonStyle: UIButton!
    @IBOutlet weak var loadActivity: UIActivityIndicatorView!
    let offlineAuth = false
    let customClass = UICustomClass()
    var userInfo = UserProfile.userInform
    var imageDownloadRef: StorageReference {
        return Storage.storage().reference().child("userPhoto")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.frame = CGRect(x: 25, y: 150, width: self.view.frame.size.width - 50, height: 50)
        self.passwordView.frame = CGRect(x: 25, y: 210, width: self.view.frame.size.width - 50 , height: 50)
        self.authButtonStyle.frame = CGRect(x: 25, y: 285, width: self.view.frame.size.width - 50, height: 50)
        print(self.view.frame.size.width)
        print(self.passwordView.frame.size.width)
        print(passwordView.frame)
        self.view.insertSubview(customClass.backgraundView(), at: 0)
        self.view.insertSubview(customClass.blurringScreen(view: view), at: 1)
        loginView.delegate = self
        passwordView.delegate = self
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
        loadActivity.isHidden = true
        loadActivity.color = UIColor.blue
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loginView.text = ""
        passwordView.text = ""
        loadActivity.isHidden = true
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
    }
    
    @IBAction func authorizationButton(_ sender: Any) {
        
        guard loginView.text != "" else {return alertAction(errors: "Укажите свой логин!")}
        guard passwordView.text != "" else {return alertAction(errors: "Вы забыли указать пароль")}
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, error) in
            guard error == nil else { return (self?.alertAction(errors: "Ошибка пароля или Ваш аккаунт был удален(Точную информацию уточните у Разработчика)"))!}
            guard user != nil else { return }
                (self?.customClass.CustomButton(nameBut: "", buttons: (self?.authButtonStyle)!))!
                self?.loadActivity.isHidden = false
                self?.loadActivity.startAnimating()
                self?.fetchFirebase()
        }
    }
    @IBAction func registrationButton(_ sender: Any) {
        //nextViewContr(nameVC: "firstStoryBoards", typeVC: "register")
        print("Password")
    }
    func nextViewContr(nameVC: String, typeVC: String) {
        switch typeVC {
        case "main":
        let Vc = UIStoryboard(name: nameVC, bundle: nil).instantiateInitialViewController() as! UITabBarController
            present(Vc, animated: true, completion: nil)
        case "register":
        let Vc = UIStoryboard(name: nameVC, bundle: nil).instantiateInitialViewController() as! UINavigationController
            present(Vc, animated: true, completion: nil)
        default:
            print("nil")
        }

    }

    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }


fileprivate func fetchFirebase() {
    let getUserID: String! = Auth.auth().currentUser?.uid
    let uploadUserPhoto = self.imageDownloadRef.child("\(getUserID!).png")
    let queue = DispatchQueue.main
    queue.async {
        guard getUserID != nil else { return }
        let DownloadImage = uploadUserPhoto.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                self.userInfo.userPhoto = image!
            }
            print(error ?? "Errors no")
        }
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
            DownloadImage.resume()
            self?.nextViewContr(nameVC: "MainStoryboard", typeVC: "main")
          }
        }
    }
}

