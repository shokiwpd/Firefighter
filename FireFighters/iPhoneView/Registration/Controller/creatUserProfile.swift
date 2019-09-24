import UIKit
import Firebase
import FirebaseAuth
import Reachability

class creatUserProfile: UIViewController,UITextFieldDelegate,getTockenUser {
    //MARK: Оутлеты и переменные
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var passCheck: UITextField!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var eMailField = CAShapeLayer()
    var passField1 = CAShapeLayer()
    var passField2 = CAShapeLayer()
    var nextViewButtonGardient = CAGradientLayer()
    //Загрузка графической части
    override func viewDidLayoutSubviews() {
            eMailField.layerLine(strokeColors: UIColor.black.cgColor)
            passField1.layerLine(strokeColors: UIColor.black.cgColor)
            passField2.layerLine(strokeColors: UIColor.black.cgColor)
                createLogin.layer.addSublayer(eMailField)
                createPassw.layer.addSublayer(passField1)
                passCheck.layer.addSublayer(passField2)
        createLogin.lineToTextField(shape: eMailField)
        createPassw.lineToTextField(shape: passField1)
        passCheck.lineToTextField(shape: passField2)
        //Настройка внешнего вида кнопки
        nextViewButtonGardient.gardientButton(w: customButton.frame.size.width, h: customButton.frame.size.height)
        customButton.layer.insertSublayer(nextViewButtonGardient, at: 0)
        customButton.grayButton(nameBut: "Далее")
        cancelButton.grayButton(nameBut: "Отмена")
    }
    //загрузка основных данных
    override func viewDidLoad() {
        super.viewDidLoad()
        createLogin.delegate = self
        createPassw.delegate = self
        passCheck.delegate = self
        title = "Регистрация"
    }

    @IBAction func createUsers(_ sender: Any) {
        guard createPassw.text == passCheck.text else { return AlertView(text:"Пароли не совподают или вы допустили ошибку в пароле")} //Проверка совпадения пароля
        Auth.auth().createUser(withEmail: createLogin.text!, password: createPassw.text!, completion:  {[weak self](user, AuthErrors) in // Создание аккаунта и присвоения токена для пользователя
            guard AuthErrors == nil else {return self!.fetchError(AuthErrors!)} // Проверка на наличие ошибок
            guard user != nil else { return self!.fetchError(AuthErrors!)} // Проверка на наличие похожих учетных записей
            self?.creatUserinform() // Внесение данных в базу данных
        })
    }
    private func creatUserinform() { // Переход на следущий контроллер для сохранение данных
        let Vc = UIStoryboard(name: "userProfileSave", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }
    @IBAction func cancelRegitration(_ sender: Any) { // Отмена регистрации
        dismiss(animated: true, completion: nil)
    }
}
/*class creatUserProfile: UIViewController, UITextFieldDelegate, getTockenUser {
    
    
    private var infoLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    private var emailField: UITextField = {
        let email = UITextField()
        
        return email
    }()
    private var passwordField: UITextField = {
        let password = UITextField()
        
        return password
    }()
    private var chekingPassword: UITextField = {
       let passwordChek = UITextField()
        
        return passwordChek
    }()
    private var addProfileButton: UIButton = {
       let button = UIButton()
        
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    
}
*/
