import UIKit
import FirebaseAuth
import Firebase
import MBProgressHUD
import CoreGraphics

class authorizationVC: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.font = UIFont(name: "signpainter-housescript", size: 47)
        }
    }
    @IBOutlet weak var loginView: UITextField! {
        didSet {
            loginView.backgroundColor = UIColor.clear
            loginView.borderStyle = .none
        }
    }
    @IBOutlet weak var passwordView: UITextField! {
        didSet {
            passwordView.backgroundColor = UIColor.clear
            passwordView.borderStyle = .none
        }
    }
    var loginLine: CAShapeLayer! {
        didSet {
            loginLine.fillColor = nil
            loginLine.lineCap = "round"
            loginLine.lineWidth = 3
            loginLine.strokeColor = UIColor.gray.cgColor
            loginLine.strokeEnd = 1
        }
    }
    var passwordLine: CAShapeLayer! {
        didSet {
            passwordLine.fillColor = nil
            passwordLine.lineCap = "round"
            passwordLine.lineWidth = 3
            passwordLine.strokeColor = UIColor.gray.cgColor
            passwordLine.strokeEnd = 1
        }
    }
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            buttonGardients.startPoint = CGPoint(x: 0, y: 0)
            buttonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }

    
    
    @IBOutlet weak var authButtonStyle: UIButton! {
        didSet {
            authButtonStyle.clipsToBounds = true
        }
    }
    @IBOutlet weak var loadActivity: UIActivityIndicatorView!
    let offlineAuth = false
    let customClass = UICustomClass()
    var userInfo = UserProfile.userInform
    var imageDownloadRef: StorageReference {
        return Storage.storage().reference().child("userPhoto")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        passwordView.delegate = self
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
        loadActivity.isHidden = true
        loadActivity.color = UIColor.blue
            self.authButtonStyle.layer.cornerRadius = authButtonStyle.frame.height / 2
            self.loginView.frame = CGRect(x: 25, y: 150, width: self.view.frame.size.width - 50, height: 30)
            self.passwordView.frame = CGRect(x: 25, y: 210, width: self.view.frame.size.width - 50 , height: 30)
            self.authButtonStyle.frame = CGRect(x: 25, y: 285, width: self.view.frame.size.width - 50, height: 50)
            self.titleLabel.frame = CGRect(x: 25, y: 65, width: self.view.frame.size.width - 50, height: 35)
        print(self.view.frame.size.width / 2)
        self.view.insertSubview(customClass.backgraundView(), at: 0)
        self.view.insertSubview(customClass.blurringScreen(view: view), at: 1)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: authButtonStyle.frame.size.width, height: authButtonStyle.frame.size.height)
        authButtonStyle.layer.insertSublayer(buttonGardients, at: 0)
        loginLine = CAShapeLayer()
        passwordLine = CAShapeLayer()
        loginView.layer.addSublayer(loginLine)
        passwordView.layer.addSublayer(passwordLine)
        customTextField(shape: loginLine, textFields: loginView)
        customTextField(shape: passwordLine, textFields: passwordView)
        print("x\(view.frame.width) x/2\(view.frame.width / 2)")
        print("y\(view.frame.height)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loginView.text = ""
        passwordView.text = ""
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
    }
    func customTextField(shape: CAShapeLayer, textFields: UITextField) {
        shape.frame = textFields.bounds
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: textFields.frame.size.height))
        patching.addLine(to: CGPoint(x: textFields.frame.size.width, y: textFields.frame.size.height))
        shape.path = patching.cgPath
    }
    
    @IBAction func authorizationButton(_ sender: Any) {
        
        guard loginView.text != "" else {return alertAction(errors: "Укажите свой логин!")}
        guard passwordView.text != "" else {return alertAction(errors: "Вы забыли указать пароль")}
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, error) in
            guard error == nil else { return (self?.alertAction(errors: "Ошибка пароля или Ваш аккаунт был удален(Точную информацию уточните у Разработчика)"))!}
            guard user != nil else { return }
                (self?.customClass.CustomButton(nameBut: "", buttons: (self?.authButtonStyle)!))!
                self?.progressView()
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
            self?.nextViewContr(nameVC: "MainStoryboard", typeVC: "main")
            self?.userInfo.userPhoto = userImage
            
          }
    }
    
    })
        }
    }
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.labelText = "Готовим данные"
    }
}

