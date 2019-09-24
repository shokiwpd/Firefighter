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

class AuthAndRegistrationView: UIViewController, UITextFieldDelegate, getTockenUser {
    var loginLine = CAShapeLayer()
    var passwordLine = CAShapeLayer()
    var buttonGardients = CAGradientLayer()
    var userInfo = UserProfile.userInform
    let receivingData = loadFirebaseData()
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
            login.translatesAutoresizingMaskIntoConstraints = false
            login.alpha = 0
        return login
    }()
    
    private var passwordField: UITextField = {
        let password = UITextField()
            password.placeholder = "Пароль"
            password.borderStyle = .roundedRect
            password.textAlignment = .center
            password.isSecureTextEntry = true
            password.translatesAutoresizingMaskIntoConstraints = false
            password.alpha = 0
        return password
    }()
    
    private var autorizatioButton: UIButton = {
        let button = UIButton()
            button.grayButton(nameBut: "Войти")
            button.alpha = 0
            button.backgroundColor = .gray
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(autorizationFirebase), for: .touchUpInside)
        return button
    }()
    
    private var registrationButton: UIButton = {
        let button = UIButton()
            button.clearButton(nameBut: "Регистрация")
            button.alpha = 0
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(registrationViewSegue), for: .touchUpInside)
     return button
    }()
    // end UIkit elements
    
    // load layout
    override func viewDidLayoutSubviews() {
        loginLine.layerLine(strokeColors: UIColor.gray.cgColor)
        passwordLine.layerLine(strokeColors: UIColor.gray.cgColor)
        loginField.lineToTextField(shape: loginLine)
        passwordField.lineToTextField(shape: passwordLine)
        
        buttonGardients.gardientButton(w: autorizatioButton.frame.size.width, h: autorizatioButton.frame.size.height)
        autorizatioButton.layer.insertSublayer(buttonGardients, at: 0)
        
        // gardient button
        autorizatioButton.layer.cornerRadius = autorizatioButton.bounds.height / 2
        registrationButton.layer.cornerRadius = registrationButton.bounds.height / 2
        
        // label constraint
        namesLabel.centerXAnchor.constraint(equalTo: modelView.centerXAnchor).isActive = true
        namesLabel.bottomAnchor.constraint(equalTo: loginField.topAnchor, constant:  -10).isActive = true
        namesLabel.trailingAnchor.constraint(equalTo: modelView.trailingAnchor, constant: -20).isActive = true
        namesLabel.leadingAnchor.constraint(equalTo: modelView.leadingAnchor, constant: 20).isActive = true
        
        // login field constraint
        loginField.trailingAnchor.constraint(equalTo: namesLabel.trailingAnchor).isActive = true
        loginField.leadingAnchor.constraint(equalTo: namesLabel.leadingAnchor).isActive = true
        
        // password field constraint
        passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 10).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor).isActive = true
        passwordField.centerYAnchor.constraint(equalTo: modelView.centerYAnchor).isActive = true
        
        // autorization button constraint
        autorizatioButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant:  20).isActive = true
        autorizatioButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor).isActive = true
        autorizatioButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor).isActive = true
        
        // registration button constraint
        registrationButton.topAnchor.constraint(equalTo: autorizatioButton.bottomAnchor, constant: 20).isActive = true
        registrationButton.trailingAnchor.constraint(equalTo: autorizatioButton.trailingAnchor).isActive  = true
        registrationButton.leadingAnchor.constraint(equalTo: autorizatioButton.leadingAnchor).isActive = true
        
        // UIview
        if UIDevice.current.model == "iPhone" {
            modelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
            modelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            modelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            modelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170).isActive = true
        } else {
            modelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
            modelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
            modelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
            modelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370).isActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIDevice.current.model)
        TypeString.TypeStrings.nameType = ""
        view.backgroundColor = .white
        namesLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        print(view.bounds.height)

        
        view.addSubview(modelView)
        modelView.addSubview(namesLabel)
        modelView.addSubview(loginField)
        modelView.addSubview(passwordField)
        modelView.addSubview(autorizatioButton)
        modelView.addSubview(registrationButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        backgroundVideo(playAndStop: true)
        alertMassage()
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
        
    }
    // video backgraund
    private func backgroundVideo(playAndStop: Bool) {
                let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "backgraundVideo", ofType: "mov")!)
                let playVideo = AVPlayer(url: videoURL)
                let newLayerVideo = AVPlayerLayer(player: playVideo)
                newLayerVideo.frame = self.view.frame
                self.view.layer.insertSublayer(newLayerVideo, at: 0)
                newLayerVideo.videoGravity = .resizeAspectFill
                playVideo.play()
                switch playAndStop {
                    case true: playVideo.play()
                    case false: playVideo.pause()
                }
                playVideo.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
                NotificationCenter.default.addObserver(self, selector: #selector(AuthAndRegistrationView.loopVideo), name: Notification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: playVideo.currentItem)
            }
    // repite video
        @objc func loopVideo(_ notif: Notification) {
            let player: AVPlayerItem = notif.object as! AVPlayerItem
            player.seek(to: CMTime.zero, completionHandler: nil)
        }
    

    //alert view
     func alertMassage() {
        let alertView = UIAlertController(title: "Версия Альфа 1", message: "В данной сборке переписан с нуля экран приветствия и авторизации! Написан полностью кодом и может содержать некоторые проблемы с версткой(Элементы экрана не в нужных местах и т.д)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо!Тестим!", style: .destructive, handler: nil)
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
    }
    //autorization firebase
    @objc func autorizationFirebase() {
        guard loginField.text != "" else { return AlertView(text: "No login")}
        guard passwordField.text != "" else { return AlertView(text: "No password")}
        Auth.auth().signIn(withEmail: loginField.text!, password: passwordField.text!) {[weak self](user, AuthErrors) in
                    guard AuthErrors == nil else {return self!.fetchError(AuthErrors!)} //Проверка на наличие ошибок с сервера
                    guard user != nil else { return } //Проверка на существование пользователя в БД Firebase
                    self?.progressView() //Включение индикатора загрузки
                    self?.fetchFirebase() //загрузка данных из Firebase
            //            self?.saveLoginAndPass(Login: (self?.loginView.text!)!, Password: (self?.passwordView.text!)!)  //сохранение логина и пароля
            }
    }
    //progress view
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.label.text = "Загрузка..."
        Load.isUserInteractionEnabled = false
    }
    // load data from firebase
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
            self?.receivingData.userData(data: value!) // Сохранение данных в CoreData
            self?.userInfo.userPhoto = userImage // Сохранение фотографии в CoreData
                self?.nextViewController()
                    }
                }
            })
        }
    }
    private func nextViewController() {
        let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
        Vc.modalPresentationStyle = .fullScreen
        present(Vc, animated: true, completion: nil)
    }
    //segue to main view
     @objc func registrationViewSegue(sender: UIButton){
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        Vc.modalPresentationStyle = .fullScreen
        present(Vc, animated: true, completion: nil)
    }
}
