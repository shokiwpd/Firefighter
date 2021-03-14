//
//  AuthAndRegistrationView.swift
//  FireFighters
//
//  Created by Павел on 17.03.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Firebase
import MBProgressHUD

class AuthAndRegistrationView: UIViewController,UITextFieldDelegate, getTockenUser {
    var loginLine = CAShapeLayer()
    var passwordLine = CAShapeLayer()
    var buttonGardients = CAGradientLayer()
    var userInfo = UserProfile.userInform
    let receivingData = loadFirebaseData()
    let text = textFields()
    // UIKit elements
   private var namesLabel: UILabel = {
        let label = UILabel()
            label.text = "Огнеборцы"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.alpha = 0
        return label
    }()
    
    private var modelView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var loginField: UITextField = {
        let login = UITextField()
            login.placeholder = "Логин(почта)"
            login.borderStyle = .roundedRect
            login.textAlignment = .center
            login.tag = 0
            login.translatesAutoresizingMaskIntoConstraints = false
            login.alpha = 0
            login.returnKeyType = .next
            login.keyboardType = .emailAddress
//            login.textContentType = .username
        
        return login
    }()
    
    private var passwordField: UITextField = {
        let password = UITextField()
            password.placeholder = "Пароль"
            password.borderStyle = .roundedRect
            password.textAlignment = .center
            password.isSecureTextEntry = true
            password.translatesAutoresizingMaskIntoConstraints = false
            password.tag = 1
            password.alpha = 0
            password.returnKeyType = .go
            password.textContentType = .password
        return password
    }()
    
    private var autorizatioButton: UIButton = {
        let button = UIButton()
            button.grayButton(nameBut: "Войти")
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.alpha = 0
            button.backgroundColor = .gray
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(autorizationFirebase), for: .touchUpInside)
        return button
    }()
    
    private var registrationButton: UIButton = {
        let button = UIButton()
            button.clearButton(nameBut: "Регистрация")
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.alpha = 0
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(registrationViewSegue), for: .touchUpInside)
     return button
    }()
    
    private var resetPassword: UILabel = {
        let text = UILabel()
            text.text = "Восстановить пароль"
            text.textColor = .black
            text.alpha = 0
            text.translatesAutoresizingMaskIntoConstraints = false
            text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            text.textAlignment = .center
        text.isUserInteractionEnabled = true
        return text
    }()
    let passwordChek = "^(?=.*[A-Z])[A-Za-z]{,}$"
    let minimumCount = 6
    let chekingInteger = "^(?=.*[а-я])(?=.*[А-Я])(?=.*\\d)(?=.*[$@$!%*?&#])[А-Яа-я\\d$@$!%*?&#]{6,}$"


    
    // load layout
    override func viewDidLayoutSubviews() {
        //layer line
        loginField.lineToTextField(shape: loginLine)
        passwordField.lineToTextField(shape: passwordLine)
        //dark theme to iOS_13 and later
        if #available(iOS 13.0, *) {
            view.backgroundColor = .newDarkTheme
            loginLine.layerLine(strokeColors: UIColor.reversDark.cgColor)
            passwordLine.layerLine(strokeColors: UIColor.reversDark.cgColor)
            resetPassword.textColor = UIColor.reversDark
            registrationButton.setTitleColor(UIColor.reversDark, for: .normal)
        } else {
            view.backgroundColor = .white
            loginLine.layerLine(strokeColors: UIColor.black.cgColor)
            passwordLine.layerLine(strokeColors: UIColor.black.cgColor)
            namesLabel.textColor = .black
        }
        
        
        //gardient button
        buttonGardients.gardientButton(w: autorizatioButton.frame.size.width, h: autorizatioButton.frame.size.height)
        autorizatioButton.layer.insertSublayer(buttonGardients, at: 0)
        
        // label constraint
        namesLabel.centerXAnchor.constraint(equalTo: modelView.centerXAnchor).isActive = true
        namesLabel.layOutSettingLabel(nil, 0,
                                      modelView.leadingAnchor, 20,
                                      modelView.trailingAnchor, -20,
                                      nil, 0)
        // login field constraint
        loginField.layOutSettingTextField(namesLabel.bottomAnchor, 10,
                                          namesLabel.leadingAnchor, 0,
                                          namesLabel.trailingAnchor, 0,
                                          nil,0)
        loginField.heightTextField(30)
        // password field constraint
        passwordField.layOutSettingTextField(loginField.bottomAnchor, 20,
                                             loginField.leadingAnchor, 0,
                                             loginField.trailingAnchor, 0,
                                             nil,0)
        passwordField.centerYAnchor.constraint(equalTo: modelView.centerYAnchor).isActive = true
        passwordField.heightTextField(30)
        // autorization button constraint
        autorizatioButton.layOutSettingButton(passwordField.bottomAnchor, 20,
                                              passwordField.leadingAnchor, 0,
                                              passwordField.trailingAnchor, 0,
                                              nil, 0)
        autorizatioButton.heightButton(50)
        // registration button constraint
        registrationButton.layOutSettingButton(autorizatioButton.bottomAnchor, 20,
                                               autorizatioButton.leadingAnchor, 0,
                                               autorizatioButton.trailingAnchor, 0,
                                               nil, 0)
        registrationButton.heightButton(50)
        // reset password label
        resetPassword.layOutSettingLabel(registrationButton.bottomAnchor, 10,
                                         registrationButton.leadingAnchor, 0,
                                         registrationButton.trailingAnchor, 0,
                                         nil,0)
        resetPassword.heightLabel(15)
        // UIview
        if UIDevice.current.model == "iPhone" {
            modelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
            modelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            modelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            modelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        } else {
            modelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
            modelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
            modelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
            modelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370).isActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TypeString.TypeStrings.nameType = ""
        namesLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        print(view.bounds.height)
        let viewTouchHideKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        viewTouchHideKey.cancelsTouchesInView = false
        let resetPasswordTap = UITapGestureRecognizer(target: self, action: #selector(resetPasswordTapReg))
        resetPasswordTap.cancelsTouchesInView = false
        view.addSubview(modelView)
        modelView.addSubview(namesLabel)
        modelView.addSubview(loginField)
        modelView.addSubview(passwordField)
        modelView.addSubview(autorizatioButton)
        modelView.addSubview(registrationButton)
        modelView.addSubview(resetPassword)
        loginField.delegate = self
        passwordField.delegate = self
        modelView.addGestureRecognizer(viewTouchHideKey)
        resetPassword.addGestureRecognizer(resetPasswordTap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 2, delay: 0.5, animations: {
            self.namesLabel.alpha = 1
        },completion: nil)
        UIView.animate(withDuration: 2, delay: 1, animations: {
            self.loginField.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 1.5, animations: {
            self.passwordField.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.autorizatioButton.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 2.5, animations: {
            self.registrationButton.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 3, animations: {
            self.resetPassword.alpha = 1
        }, completion: nil)
        
    }

    //keyboard hide
    @objc func hideKeyboard() {
        modelView.endEditing(true)
    }
    //autorization firebase
    @objc func autorizationFirebase() {
        let errorCode = AuthErrorCode.wrongPassword
        let codeError = errorCode.errorMessage
        guard loginField.text != "" else { return AlertView(text: "Вы не указали логин")}
        guard passwordField.text != "" else { return AlertView(text: "Вы не указали пароль")}

        Auth.auth().signIn(withEmail: loginField.text!, password: passwordField.text!) {[weak self](user, AuthErrors) in
                    self?.progressView() //Включение индикатора загрузки
            if AuthErrors != nil {
                if AuthErrors!.localizedDescription == codeError {self?.AlertView(text: "Скажите админу что забыли пароль XD")}
                self!.fetchError(AuthErrors!)
                self!.stopProgress()
            }
                guard user != nil else { return } //Проверка на существование пользователя в БД Firebase
                    self?.fetchFirebase() //загрузка данных из Firebase
            }
    }
    //progress view
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.label.text = "Загрузка..."
        Load.isUserInteractionEnabled = false
        autorizatioButton.isEnabled = true
    }
    
    func stopProgress() {
        MBProgressHUD.hide(for: view, animated: true)
        autorizatioButton.isEnabled = false
    }
    
    // load data from firebase
    //!НАДО ПЕРЕПИСАТЬ!
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
            if error != nil {print(error?.localizedDescription ?? "Nil")}
        }
        DownloadImage.observe(.progress, handler: { (snapshot) in //Получение статуса загрузки
            if snapshot.progress?.fractionCompleted == 1.0 {
            self.DataReference.child(self.userTocken!).observeSingleEvent(of: .value) {[weak self](snapshot) in
            let value = snapshot.value as? NSDictionary // Присвоение константе данных
            guard value != nil else { return (self?.errorRegistration())! } //Проверка на получение данных
            self?.receivingData.userData(data: value!) // Сохранение данных в CoreData
            self?.userInfo.userPhoto = userImage // Сохранение фотографии в CoreData
                self?.nextViewController()
                    }
                }
            })
        }
    }
    private func nextViewController() {
        let tabbars = MainTabBarViewController()
        tabbars.modalPresentationStyle = .fullScreen
        present(tabbars, animated: true, completion: nil)
    }
    
    //tap reset label
    @objc func resetPasswordTapReg(){
        let PasswordResetAlert = UIAlertController(title: "Внимание", message: "Хотите сбросить пароль?", preferredStyle: .alert)
        PasswordResetAlert.addTextField { (TextFieldes) in
            if self.loginField.text != "" {
                TextFieldes.text = self.loginField.text
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
    
    //segue to main view
     @objc func registrationViewSegue(sender: UIButton){
        let Vc = creatUserProfile()
        let navigationBar = UINavigationController(rootViewController: Vc)
            navigationBar.modalPresentationStyle = .fullScreen
            navigationBar.modalTransitionStyle = .flipHorizontal
        present(navigationBar, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == loginField {
            if loginField.text == "" {
                AlertView(text: "Укажите логин!")
            } else {
                passwordField.becomeFirstResponder()
            }
        }
        if textField == passwordField {autorizationFirebase()}
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if loginField.resignFirstResponder() {
            if loginField.text == "" {AlertView(text: "Укажите логин!")}
        }
        if passwordField.resignFirstResponder() {
            if passwordField.text == "" {AlertView(text: "Укажите пароль!")}
        }
    }
    func errorRegistration() {
        let alert = UIAlertController(title: "Внимание!", message: "Возможно при регистрации у Вас возникла ошибка. Пожалуйста введите личные данные повторно!", preferredStyle: .alert)
        let editAction = UIAlertAction(title: "Хорошо", style: .default) { _ in
            self.registrationView()
        }
        alert.addAction(editAction)
        self.present(alert, animated: true, completion: nil)
    }
    func registrationView() {
        let regView = FirstViewController()
        let navBar = UINavigationController(rootViewController: regView)
        navBar.modalPresentationStyle = .fullScreen
        navBar.modalTransitionStyle = .crossDissolve
        present(navBar, animated: true)
    }
    
    
}

//pod 'Firebase/Core'
//pod 'Firebase/Database'
//pod 'Firebase/Auth'
//pod 'Firebase/Storage'
//pod 'Firebase/Messaging'
//pod 'MBProgressHUD'
//pod 'ReachabilitySwift'
//pod 'iosMath'
//pod 'IQKeyboardManagerSwift'
//
//post_install do |pi|
//    pi.pods_project.targets.each do |t|
//      t.build_configurations.each do |config|
//        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
//      end
//    end
//end
