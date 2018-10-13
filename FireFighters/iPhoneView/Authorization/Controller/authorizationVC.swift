import UIKit
import FirebaseAuth
import Firebase
import MBProgressHUD
import Locksmith

class authorizationVC: UIViewController, UITextFieldDelegate,getTockenUser{
    //MARK: Оутлеты и их настройки
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    @IBOutlet weak var authButtonStyle: UIButton!
    //MARK: Гардиенты и линии
    var loginLine = CAShapeLayer()
    var passwordLine = CAShapeLayer()
    var buttonGardients = CAGradientLayer()
    //MARK: Классы и переменные
    var userInfo = UserProfile.userInform
    let receivingData = loadFirebaseData()
    //MARK: Лойауты и фон
    override func viewDidLayoutSubviews() {
        //Фон с эффектом размытия 
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        //
        titleLabel.LoginLabel(viewHeight: Double(view.bounds.height))
        //Кнопка с гардиентом
        buttonGardients.gardientButton(w: authButtonStyle.frame.size.width, h: authButtonStyle.frame.size.height)
        authButtonStyle.grayButton(nameBut: "Авторизироваться")
        authButtonStyle.layer.insertSublayer(buttonGardients, at: 0)
        //Прорисовка линий в поле ввода текста
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
        title = ""
    }

    
    
    
    //MARK: Проверка всех полей и базы данных FireBase
    @IBAction func authorizationButton(_ sender: Any) {
        guard loginView.text != "" else {return AlertView(text: "Укажите свой логин!")}
        guard passwordView.text != "" else {return AlertView(text: "Вы забыли указать пароль")}
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, AuthErrors) in
            guard AuthErrors == nil else {return self!.fetchError(AuthErrors!)} //Проверка на наличие ошибок с сервера
            guard user != nil else { return } //Проверка на существование пользователя в БД Firebase
            self?.progressView() //Включение индикатора загрузки
            self?.fetchFirebase() //загрузка данных из Firebase
            self?.saveLoginAndPass(Login: (self?.loginView.text!)!, Password: (self?.passwordView.text!)!)  //сохранение логина и пароля
        }
    }
    //MARK: Восстановление пароля

    @IBAction func registrationButton(_ sender: Any) {
        let PasswordResetAlert = UIAlertController(title: "Внимание", message: "Хотите сбросить пароль?", preferredStyle: .alert)
        PasswordResetAlert.addTextField { (TextFieldes) in
            if self.loginView.text != "" {
                TextFieldes.text = self.loginView.text
            } else {
                TextFieldes.text = ""
            }}
        PasswordResetAlert.addAction(UIAlertAction.init(title: "Восставновить", style: .default, handler: { (action) in
           let Passwords = PasswordResetAlert.textFields![0] as UITextField
                    Auth.auth().sendPasswordReset(withEmail: Passwords.text!) { error in // Отправка сообщения на почту
                        guard error == nil else {return self.AlertView(text: "Пустая форма или нет пользователя с данной электронной почтой")}
                        self.AlertView(text: "Мы отправили Вам форму для восстановления пароля")
            }}))
        PasswordResetAlert.addAction(UIAlertAction.init(title: "Отмена", style: .cancel, handler: nil))
        present(PasswordResetAlert, animated: true, completion: nil)
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
            if error != nil {print("Yes Error")}
        }
        DownloadImage.observe(.progress, handler: { (snapshot) in //Получение статуса загрузки
            if snapshot.progress?.fractionCompleted == 1.0 {
            self.DataReference.child(self.userTocken!).observeSingleEvent(of: .value) {[weak self](snapshot) in
            let value = snapshot.value as? NSDictionary // Присвоение константе данных
            guard value != nil else { return (self?.errorRegistration())! } //Проверка на получение данных
            self?.receivingData.userData(data: value!) // Сохранение данных в CoreData
            self?.userInfo.userPhoto = userImage // Сохранение фотографии в CoreData
            self?.nextViewController() // Переход на основной экран
                    }
                }
            })
        }
    }
    //MARK: MBProgressHUD
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.label.text = "Готовим данные"
        Load.isUserInteractionEnabled = false
    }
    private func registrationView() {
        let Vc = UIStoryboard(name: "userProfileSave", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
    //MARK: Переход на другой сториборд
    private func nextViewController() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        present(Vc, animated: true, completion: nil)
    }
    func errorRegistration() {
        let alert = UIAlertController(title: "Внимание!", message: "Возможно при регистрации у Вас возникла ошибка. Пожалуйста введите личные данные повторно!", preferredStyle: .alert)
        let editAction = UIAlertAction(title: "Хорошо", style: .default) { _ in
            self.registrationView()
        }
        alert.addAction(editAction)
        self.present(alert, animated: true, completion: nil)
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

