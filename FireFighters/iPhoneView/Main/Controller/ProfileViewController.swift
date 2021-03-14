import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController, UIScrollViewDelegate {
//    var profileButton = profileCustomButton(titleButton: "")
    var profileButton = profileCustomButton()//(titleButton: "Профиль")
    var workButton = profileCustomButton()//(titleButton: "")
    var typeEdith = profileCustomButton()
    var customButton = profileCustomButton()//(titleButton: "")
    var exitButton = profileCustomButton()//(titleButton: "")
    var dopButton = profileCustomButton()
    
    
    var ImageProfile: UIImageView = {
         let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.image = UIImage(cgImage: UserProfile.userInform.userPhoto.cgImage!)
        return image
    }()
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name User"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    var scrollViewProfile: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.autoresizingMask = .flexibleHeight
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    let coreDataUserInform = UserProfile.userInform
    
    override func viewWillLayoutSubviews() {
        //MARK: Scroll setting
        let contentScroll = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 300)
        scrollViewProfile.contentSize = contentScroll
        scrollViewProfile.frame = self.view.bounds
        themeSettingFunc()
       layoutSetting()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:navigation bar setting
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(backBarButton))
        title = ""
        userNameLabel.text = "\(coreDataUserInform.userName!) \(coreDataUserInform.userPatronymic!)"
        
        
        
        //MARK:Add Action
        profileButton.addTarget(self, action: #selector(openProfileEdith), for: .touchUpInside)
        workButton.addTarget(self, action: #selector(openWorkEdith), for: .touchUpInside)
        typeEdith.addTarget(self, action: #selector(typeSelect), for: .touchUpInside)
        customButton.addTarget(self, action: #selector(openProfileView), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(exitProfile), for: .touchUpInside)
        dopButton.addTarget(self, action: #selector(inform), for: .touchUpInside)
        //MARK: Title button
        profileButton.setTitle("Профиль", for: .normal)
        workButton.setTitle("Рабочие данные", for: .normal)
        typeEdith.setTitle("Смена аппарата", for: .normal)
        customButton.setTitle("Кастомизация", for: .normal)
        exitButton.setTitle("Выход", for: .normal)
        dopButton.setTitle("О приложении", for: .normal)
        
        //MARK:add UIKit object
        self.view.addSubview(scrollViewProfile)
        scrollViewProfile.addSubview(ImageProfile)
        scrollViewProfile.addSubview(userNameLabel)
        scrollViewProfile.addSubview(profileButton)
        scrollViewProfile.addSubview(workButton)
        scrollViewProfile.addSubview(typeEdith)
        scrollViewProfile.addSubview(customButton)
        scrollViewProfile.addSubview(exitButton)
        scrollViewProfile.addSubview(dopButton)
        
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    // back button iOS 11
    @objc func backBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func openProfileEdith() {
        let profileView = profileEdithVC()
        if #available(iOS 13.0, *) {
            profileView.modalPresentationStyle = .formSheet
            present(profileView, animated: true, completion: nil)
        } else {
          let navigation = UINavigationController(rootViewController: profileView)
          present(navigation, animated: true,completion: nil)
        }
    }
    @objc func openWorkEdith() {
        let profileView = workEdithVC()
        if #available(iOS 13.0, *) {
            profileView.modalPresentationStyle = .formSheet
            present(profileView, animated: true, completion: nil)
        } else {
          let navigation = UINavigationController(rootViewController: profileView)
          present(navigation, animated: true,completion: nil)
        }
    }
    
    func themeSettingFunc() {
        self.view.viewThemeColor()
        self.navigationController?.navigatinDarkTheme()
        self.profileButton.DarkThemeButton()
        self.workButton.DarkThemeButton()
        self.typeEdith.DarkThemeButton()
        self.customButton.DarkThemeButton()
        self.exitButton.DarkThemeButton()
        self.userNameLabel.darkThemeLabel()
        self.view.viewThemeColor()
    }
    
    @objc func openCustomEdith() {
        
    }
    @objc func exitProfile() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
        let autorization = AuthAndRegistrationView()
        autorization.modalPresentationStyle = .fullScreen
        present(autorization, animated: true, completion: nil)
        view.removeFromSuperview()
    }
    @objc func inform(){
        AlertView(text: "Разработчик: Павел Уланов \n Всем спасибо за покупку \nВсе права защищены 2018г.")
    }
    
    func layoutSetting() {
        //MARK:scroll view constraint
        scrollViewProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollViewProfile.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollViewProfile.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollViewProfile.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 300).isActive = true
        //MARK:image view constraint
        ImageProfile.topAnchor.constraint(equalTo: scrollViewProfile.topAnchor,constant: 30).isActive = true
        ImageProfile.leadingAnchor.constraint(equalTo: scrollViewProfile.leadingAnchor, constant: 30).isActive = true
        ImageProfile.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        ImageProfile.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        ImageProfile.circleImage()
        //MARK:name user constraint
        userNameLabel.layOutSettingLabel(ImageProfile.topAnchor, 0,
                                         ImageProfile.trailingAnchor, 10,
                                         scrollViewProfile.trailingAnchor, -30,
                                         nil, 0)
        //MARK:profile button constraint
        profileButton.layOutSettingButton(ImageProfile.bottomAnchor, 50,
                                          ImageProfile.leadingAnchor, 0,
                                          scrollViewProfile.trailingAnchor, -30,
                                          nil, 0)
        profileButton.heightButton(50)
        profileButton.centerXAnchor.constraint(equalTo: scrollViewProfile.centerXAnchor).isActive = true
        //MARK:work button constraint
        workButton.layOutSettingButton(profileButton.bottomAnchor, 20,
                                       profileButton.leadingAnchor, 0,
                                       profileButton.trailingAnchor, 0,
                                       nil, 0)
        workButton.heightButton(50)
        //MARK: Type button constraint
        typeEdith.layOutSettingButton(workButton.bottomAnchor, 20,
                                      workButton.leadingAnchor, 0,
                                      workButton.trailingAnchor, 0,
                                      nil, 0)
        typeEdith.heightButton(50)
        //MARK:custom button constraint
        customButton.layOutSettingButton(typeEdith.bottomAnchor, 20,
                                         typeEdith.leadingAnchor, 0,
                                         typeEdith.trailingAnchor, 0,
                                         nil, 0)
        customButton.heightButton(50)
        //MARK:exit button constraint
        exitButton.layOutSettingButton(customButton.bottomAnchor, 20,
                                       customButton.leadingAnchor, 0,
                                       customButton.trailingAnchor, 0,
                                       nil, 0)
        exitButton.heightButton(50)
        //MARK:info button constraint
        dopButton.layOutSettingButton(exitButton.bottomAnchor, 20,
                                      exitButton.leadingAnchor, 0,
                                      exitButton.trailingAnchor, 0,
                                      nil, 0)
        dopButton.heightButton(50)
        self.view.layoutIfNeeded()
    }
    
    //MARK: custom button setting
    @objc func openProfileView() {
           let userThemeSelect = UserDefaults.standard
           let alertThemeText = UIAlertController(title: "Смена темы", message: "Смена темы оформления", preferredStyle: .alert)
           if #available(iOS 13.0, *) {
               alertThemeText.addAction(UIAlertAction(title: "Автоматическая", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(0, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Auto"])
               }))
           }
               alertThemeText.addAction(UIAlertAction(title: "Тёмная тема", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(1, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Dark"])
               }))
           
               alertThemeText.addAction(UIAlertAction(title: "Светлая тема", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(2, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "White"])
               }))
           
           alertThemeText.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
           present(alertThemeText, animated: true, completion: nil)
       }
    
   @objc func typeSelect(){
            let type = TypeString.TypeStrings.nameType
            let AlertController = UIAlertController(title: "Выберите марку аппарата", message: "Ваш текщий аппарат \(type!)", preferredStyle: .alert)
            let actionAUER = UIAlertAction(title: "AUER", style: .default) { (UIAlertAction) in
                TypeString.TypeStrings.nameType = "AUER"
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "AUER"])
            }
            let actionOMEGA = UIAlertAction(title: "ОМЕГА", style: .default) { (UIAlertAction) in
                TypeString.TypeStrings.nameType = "ОМЕГА"
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "ОМЕГА"])
            }
            let actionDef = UIAlertAction(title: "Прочие", style: .default) { (UIAlertAction) in
               TypeString.TypeStrings.nameType = "Прочие"
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "Прочие"])
            }
            let Cancel = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
            AlertController.addAction(actionAUER)
            AlertController.addAction(actionOMEGA)
            AlertController.addAction(actionDef)
            AlertController.addAction(Cancel)
            present(AlertController, animated: true, completion: nil)
        }
    
    
        @objc func DarkNotification(notif: Notification) {
            guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
            if Dark != "" {
                let mainViewReload = DispatchQueue.main
                    mainViewReload.async {
                        self.themeSettingFunc()
                }
            }
        }
    
}

