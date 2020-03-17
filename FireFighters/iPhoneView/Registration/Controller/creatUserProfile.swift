import UIKit
import Firebase
import FirebaseAuth
import Reachability
import MBProgressHUD

class creatUserProfile: UIViewController, UITextFieldDelegate, getTockenUser {
    
    //gardient and layer var
    var buttonGardients = CAGradientLayer()
    var loginLineLayer = CAShapeLayer()
    var passwordLineLayer = CAShapeLayer()
    
    private var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Укажем почту для восстановления и пароль для защиты!"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var emailField: UITextField = {
        let email = textFields()
        email.textAlignment = .center
        email.placeholder = "Логин(Ваша электронная почта)"
        email.borderStyle = .roundedRect
        email.tag = 0
        email.translatesAutoresizingMaskIntoConstraints = false
        email.returnKeyType = .next
        email.textContentType = .name
        return email
    }()
    private var passwordField: UITextField = {
        let password = textFields()
        password.textAlignment = .center
        password.isSecureTextEntry = true
        password.borderStyle = .roundedRect
        password.tag = 1
        password.placeholder = "Пароль"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.returnKeyType = .default
        password.textContentType = .password
        return password
    }()
    private var addProfileButton: UIButton = {
       let button = UIButton()
        button.grayButton(nameBut: "Создать")
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addUserTocken), for: .touchUpInside)
        return button
    }()
    private var viewMain: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
        }()
    
    
    override func viewDidLayoutSubviews() {
        buttonGardients.gardientButton(w: addProfileButton.frame.size.width, h: addProfileButton.frame.size.height)
        addProfileButton.layer.insertSublayer(buttonGardients, at: 0)
        infoLabel.sizeLabel(height: Double(view.bounds.height))
        emailField.lineToTextField(shape: loginLineLayer)
        passwordField.lineToTextField(shape: passwordLineLayer)

        if #available(iOS 13.0, *) {
            view.backgroundColor = .newDarkTheme
            loginLineLayer.layerLine(strokeColors: UIColor.reversDark.cgColor)
            passwordLineLayer.layerLine(strokeColors: UIColor.reversDark.cgColor)
        } else {
            view.backgroundColor = .white
            loginLineLayer.layerLine(strokeColors: UIColor.black.cgColor)
            passwordLineLayer.layerLine(strokeColors: UIColor.black.cgColor)
            infoLabel.textColor = .black
        }
        
        //view iPhone and iPad for all UIKit item
        if UIDevice.current.model == "iPhone" {
            viewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            viewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170).isActive = true
        } else {
            viewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
            viewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370).isActive = true
        }
        
        //information label
        infoLabel.topAnchor.constraint(equalTo: viewMain.topAnchor, constant: 10).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: viewMain.trailingAnchor, constant: -10).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: viewMain.leadingAnchor, constant: 10).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: emailField.topAnchor, constant: -20).isActive = true
        
        //email login field
        emailField.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
        emailField.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
        emailField.centerYAnchor.constraint(equalTo: viewMain.centerYAnchor).isActive = true
        emailField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
       
        //password field
        passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor).isActive = true
        passwordField.bottomAnchor.constraint(equalTo: addProfileButton.topAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
       
        //add User profile button
        addProfileButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor).isActive = true
        addProfileButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor).isActive = true
        addProfileButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
        let viewTouchHideKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        viewTouchHideKey.cancelsTouchesInView = false
        
        // navigation bar setting
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(backIn(sender:)))
        
        if #available(iOS 12, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.backgroundColor = .clear
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.barTintColor = .white
        }
        // UIKit init


        view.addSubview(viewMain)
        viewMain.addSubview(infoLabel)
        viewMain.addSubview(emailField)
        viewMain.addSubview(passwordField)
        viewMain.addSubview(addProfileButton)
        viewMain.addGestureRecognizer(viewTouchHideKey)
        
        self.title = "Регистрация"
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func loadAddView(){
        let MBPView = MBProgressHUD.showAdded(to: self.view, animated: true)
        MBPView.mode = MBProgressHUDMode.indeterminate
        MBPView.label.text = "Создаем профиль"
        MBPView.isUserInteractionEnabled = false
        addProfileButton.isEnabled = false
    }
    
     func dismissHUD(isAnimated:Bool) {
        MBProgressHUD.hide(for: self.view, animated: isAnimated)
        addProfileButton.isEnabled = true
       }
    
    @objc func addUserTocken(){
        guard emailField.text! != "" else{return AlertView(text: "Укажите логин!")}
        guard passwordField.text! != "" else {return AlertView(text: "Укажите пароль!")}
        loadAddView()
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) {[weak self] (user, AuthErrors) in
            if AuthErrors != nil {
                self?.fetchError(AuthErrors!)
                self!.dismissHUD(isAnimated: true)
            } else {
                guard user != nil else { return (self?.fetchError(AuthErrors!))!}

            self?.creatUserinform()
            // Проверка на наличие похожих учетных записей
            }
        }
    }

    @objc func backIn(sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    private func creatUserinform() { // Переход на следущий контроллер для сохранение данных
        let Vc = FirstViewController()//UIStoryboard(name: "userProfileSave", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let navigationView = UINavigationController(rootViewController: Vc)
        navigationView.modalPresentationStyle = .fullScreen
        navigationView.modalTransitionStyle = .crossDissolve
        present(navigationView, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            creatUserinform()
        }
        return true
    }
    
    @objc func hideKeyboard() {
        viewMain.endEditing(true)
    }
}

