import UIKit
import FirebaseAuth
import Firebase
class ProfileViewController: UIViewController {
//    var SelUsersCell = ["Личные данные","Рабочие данные","Информация","Темная тема","Смена аппарата","Сменить пользователя"]
//    var Comments = ["Смена города","Смена данных о работе","Информация о приложении","Смена темы оформления","Сменить тип аппарата",""]
//
//    let userInfo = UserProfile.userInform
//    override func viewDidLayoutSubviews() {
//        let userDef = UserDefaults.standard.bool(forKey: "DarkMode")
//        switch userDef {
//        case true:
//            self.view.backgroundColor = UIColor.darkGray
//        case false:
//            self.view.backgroundColor = .white
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if Auth.auth().currentUser?.uid == "XdA2rQeLXfWLhg1ezNjPxts1fAr2" {
//            SelUsersCell.append("Консоль Администратора")
//            Comments.append("")
//        }
//        title = "Профиль"
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//    }
//
//    // MARK: - Table view data source
//    // Число секторов
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    // Число ячеек
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return SelUsersCell.count
//    }
//
//    //Отображение данных в кастомных ячейках
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomProfileCell
//        cell.backgroundColor = .clear
//        cell.labelViewCell.darkThemeLabel()
//        cell.commentLabel.darkThemeLabel()
//        switch indexPath.row {
//        case 0:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        case 1:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        case 2:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        case 3:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        case 4:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        case 5:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        default:
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.commentLabel.text = Comments[indexPath.row]
//        }
//        return cell
//    }
//    //Действия таблицы
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       // let Cell:CustomProfileCell!
//        switch indexPath.row{
//        case 0:
//            segueStoryBoard(nameSB: "ProfileEditBoard")
//        case 1:
//            segueStoryBoard(nameSB: "WorkInfoEdithBoard")
//        case 2:
////            segueStoryBoard(nameSB: "AppsInfoBoard")
//            vk_massage()
//        case 3:
////            AlertView(text: "Butt")
//             DarkMode()
//        case 4:
//            typeSelect()
//        case 5:
//            alertAction()
//        default:
//            segueStoryBoard(nameSB: "AdminStoryboard")
//            print("admin consol")
//        }
//    }
//    // Функция выбора сменить профиль или нет
//    func alertAction() {
//        let AC = UIAlertController(title: "Смена пользователя", message: "Вы уверены что хотите сменить пользователя?", preferredStyle: .alert)
//        let AlAc = UIAlertAction(title: "Нет", style: .default, handler: nil)
//        let AlAc2 = UIAlertAction(title: "ДА", style: .cancel, handler: { (UIAlertAction) in
//            self.exit()
//            TypeString.TypeStrings.nameType = ""
//            self.userInfo.clearData()
//            })
//         AC.addAction(AlAc2)
//         AC.addAction(AlAc)
//        present(AC, animated: true, completion: nil)
//    }
//    // Переход на публичную страницу приложения
//    func vk_massage(){
//        let massage = "Спасибо что пользуетесь данным приложением. Все предложения вы можете оставить группе в VK.Найти ссылку можете на странице приложения в AppStore. Надеюсь на хороший рейтинг. Чем выше ваша оценка,тем мне приятнее и появляется желание его делать.В скором времени добвлю номер для Viber и WhatsApp куда сможете написать в случае ошибок"
//        var VK_Alert = UIAlertController()
//        if UIDevice.current.model == "iPad" {
//             VK_Alert = UIAlertController(title: "О приложении", message: massage , preferredStyle: .alert)
//        } else {
//             VK_Alert = UIAlertController(title: "О приложении", message: massage , preferredStyle: .actionSheet)
//        }
//        let URL_VK_Groupe = UIAlertAction(title: "Перейти в группу", style: .default) { (UIAlertAction) in
//            let URL_VK = URL(string: "https://vk.com/firefighterapp")
//            UIApplication.shared.open(URL_VK!)
//        }
//        let Cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        VK_Alert.addAction(URL_VK_Groupe)
//        VK_Alert.addAction(Cancel)
//        present(VK_Alert, animated: true, completion: nil)
//    }
//    // Включение темной темы
//    func DarkMode(){
//        let DarkModeMassage = "Данная функция находится в стадии альфа тестирования и может быть доработана в будущем или быть перенесена в другой раздел"
//        let userDefMode = UserDefaults.standard
//        var DarkAlert = UIAlertController()
//        if UIDevice.current.model == "iPad" {
//            DarkAlert = UIAlertController(title: "Внимание", message: DarkModeMassage, preferredStyle: .alert)
//        } else {
//            DarkAlert = UIAlertController(title: "Внимание", message: DarkModeMassage, preferredStyle: .actionSheet)
//        }
//
//        let Dark = UIAlertAction(title: "Темная тема", style: .default) { (UIAlertAction) in
//                userDefMode.set(true, forKey: "DarkMode")
//                userDefMode.synchronize()
//            self.updateView()
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil, userInfo: ["Dark" : "Black_Fun"])
//        }
//        let White = UIAlertAction(title: "Светлая тема", style: .default) { (UIAlertAction) in
//            userDefMode.set(false, forKey: "DarkMode")
//            userDefMode.synchronize()
//            self.updateView()
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil, userInfo: ["Dark" : "White_Fun"])
//        }
//        let Cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        DarkAlert.addAction(Dark)
//        DarkAlert.addAction(White)
//        DarkAlert.addAction(Cancel)
//        present(DarkAlert, animated: true, completion: nil)
//    }
//
//    func typeSelect(){
//        let type = TypeString.TypeStrings.nameType
//        let AlertController = UIAlertController(title: "Выберите марку аппарата", message: "Ваш текщий аппарат \(type!)", preferredStyle: .alert)
//        let actionAUER = UIAlertAction(title: "AUER", style: .default) { (UIAlertAction) in
//            TypeString.TypeStrings.nameType = "AUER"
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "AUER"])
//        }
//        let actionOMEGA = UIAlertAction(title: "ОМЕГА", style: .default) { (UIAlertAction) in
//            TypeString.TypeStrings.nameType = "ОМЕГА"
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "ОМЕГА"])
//        }
//        let actionDef = UIAlertAction(title: "Прочие", style: .default) { (UIAlertAction) in
//           TypeString.TypeStrings.nameType = "Прочие"
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "updateName"), object: nil, userInfo: ["Name" : "Прочие"])
//        }
//        let Cancel = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
//        AlertController.addAction(actionAUER)
//        AlertController.addAction(actionOMEGA)
//        AlertController.addAction(actionDef)
//        AlertController.addAction(Cancel)
//        present(AlertController, animated: true, completion: nil)
//    }
//
//
//    //Смена пользователя
//    func exit() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("Error")
//        }
//        segueStoryBoard(nameSB: "authStoryBoard")
//    }
//    //Переходы на разные сториборды
//    func segueStoryBoard(nameSB: String!) {
//        switch nameSB {
//        case "ProfileEditBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! EditProfileInfoVC
//                present(Vc, animated: true, completion: nil)
//        case "authStoryBoard": let Vc = AuthAndRegistrationView()
//                 Vc.modalPresentationStyle = .fullScreen
//                present(Vc, animated: true)
//        case "WorkInfoEdithBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! WorkInfoEdithVC
//                present(Vc, animated: true, completion: nil)
//        case "AppsInfoBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! UINavigationController
//                present(Vc, animated: true, completion: nil)
//        case "AdminStoryboard": let Vc = UIViewController(nibName: "AuthAndRegistrationView", bundle: .none)
//                present(Vc, animated: true, completion: nil)
//        default: break
//        }
//    }
//    //Обновление контроллера
//    func updateView() {
//        let ViewLoad = DispatchQueue.main
//        ViewLoad.async {
//            self.tableView.reloadData()
////            self.navigationController?.navigationBar.darkThemeNav()
//            self.tabBarController?.tabBar.darkThemeBar()
//
//        }
//    }
//
//    var profileButton = profileCustomButton(titleButton: "Профиль")
    var workButton = profileCustomButton(titleButton: "Рабочие данные")
    var customButton = profileCustomButton(titleButton: "Кастомизация")
    var exitButton = profileCustomButton(titleButton: "Выход")
    var profileButton: UIButton = {
       return profileCustomButton(titleButton: "Профиль")
    }()
    
    var ImageProfile: UIImageView = {
         let image = UIImageView()
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        return image
    }()
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Павел Владимирович"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        
        return label
    }()
    var scrollViewProfile: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
//        scroll.isScrollEnabled = true
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //load UI color theme
        self.navigationController?.navigatinDarkTheme()
        self.profileButton.DarkThemeButton()
        self.workButton.DarkThemeButton()
        self.customButton.DarkThemeButton()
        self.exitButton.DarkThemeButton()
        self.userNameLabel.darkThemeLabel()
        self.view.viewThemeColor()
        
        //scroll view constraint
        scrollViewProfile.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollViewProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollViewProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollViewProfile.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //image view constraint
        ImageProfile.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        ImageProfile.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        ImageProfile.topAnchor.constraint(equalTo: scrollViewProfile.topAnchor,constant: 30).isActive = true
        ImageProfile.leadingAnchor.constraint(equalTo: scrollViewProfile.leadingAnchor, constant: 30).isActive = true
        // name user constraint
        userNameLabel.topAnchor.constraint(equalTo: ImageProfile.topAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: scrollViewProfile.trailingAnchor, constant: -30).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: ImageProfile.trailingAnchor, constant: 10).isActive = true
        //profile button constraint
        profileButton.topAnchor.constraint(equalTo: ImageProfile.bottomAnchor, constant: 50).isActive = true
        profileButton.leadingAnchor.constraint(equalTo: ImageProfile.leadingAnchor).isActive = true
        profileButton.trailingAnchor.constraint(equalTo: scrollViewProfile.trailingAnchor, constant: -30).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        profileButton.centerXAnchor.constraint(equalTo: scrollViewProfile.centerXAnchor).isActive = true
        //work button constraint
        workButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 20).isActive = true
        workButton.leadingAnchor.constraint(equalTo: profileButton.leadingAnchor).isActive = true
        workButton.trailingAnchor.constraint(equalTo: profileButton.trailingAnchor).isActive = true
        workButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        //custom button constraint
        customButton.topAnchor.constraint(equalTo: workButton.bottomAnchor, constant: 20).isActive = true
        customButton.leadingAnchor.constraint(equalTo: workButton.leadingAnchor).isActive = true
        customButton.trailingAnchor.constraint(equalTo: workButton.trailingAnchor).isActive = true
        customButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        //exit button constraint
        exitButton.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 20).isActive = true
        exitButton.leadingAnchor.constraint(equalTo: customButton.leadingAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: customButton.trailingAnchor).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(backBarButton))
        title = ""
        customButton.addTarget(self, action: #selector(openProfileView), for: .allEvents)
        view.addSubview(scrollViewProfile)
        scrollViewProfile.addSubview(ImageProfile)
        scrollViewProfile.addSubview(userNameLabel)
        scrollViewProfile.addSubview(profileButton)
        scrollViewProfile.addSubview(workButton)
        scrollViewProfile.addSubview(customButton)
        scrollViewProfile.addSubview(exitButton)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Exit")
    }
    
    // back button iOS 11
    @objc func backBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // custom button setting
    @objc func openProfileView() {
           let userThemeSelect = UserDefaults.standard
           let alertThemeText = UIAlertController(title: "TestDark", message: "This massage special to test dark theme iOS 13", preferredStyle: .alert)
           if #available(iOS 13.0, *) {
               alertThemeText.addAction(UIAlertAction(title: "Autho iOS 13", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(0, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Auto"])
               }))
           }
               alertThemeText.addAction(UIAlertAction(title: "Dark", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(1, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Dark"])
               }))
           
               alertThemeText.addAction(UIAlertAction(title: "White", style: .default, handler: { (UIAlertAction) in
                   userThemeSelect.set(2, forKey: "DarkTheme")
                   userThemeSelect.synchronize()
                   NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "White"])
               }))
           
           alertThemeText.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
           present(alertThemeText, animated: true, completion: nil)
       }
        @objc func DarkNotification(notif: Notification) {
            guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
            if Dark != "" {
                let mainViewReload = DispatchQueue.main
                    mainViewReload.async {
                    self.view.viewThemeColor()
                        self.navigationController?.navigatinDarkTheme()
                        self.profileButton.DarkThemeButton()
                        self.workButton.DarkThemeButton()
                        self.customButton.DarkThemeButton()
                        self.exitButton.DarkThemeButton()
                        self.userNameLabel.darkThemeLabel()
                }
            }
        }
}

