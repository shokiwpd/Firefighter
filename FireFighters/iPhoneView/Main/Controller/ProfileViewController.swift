import UIKit
import FirebaseAuth
import Firebase
class ProfileViewController: UITableViewController {
    var SelUsersCell = ["Личные данные","Рабочие данные","Информация","Темная тема","Смена аппарата","Сменить пользователя"]
    var Comments = ["Смена города","Смена данных о работе","Информация о приложении","Смена темы оформления","Сменить тип аппарата",""]
   
    let userInfo = UserProfile.userInform
    let DarkTheme = ThemeUser()
    override func viewDidLayoutSubviews() {
        let userDef = UserDefaults.standard.bool(forKey: "DarkMode")
        switch userDef {
        case true:
            self.view.backgroundColor = UIColor.darkGray
        case false:
            self.view.backgroundColor = .white
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser?.uid == "XdA2rQeLXfWLhg1ezNjPxts1fAr2" {
            SelUsersCell.append("Консоль Администратора")
            Comments.append("")
        }
        title = "Профиль"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    // MARK: - Table view data source
    // Число секторов
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // Число ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SelUsersCell.count
    }

    //Отображение данных в кастомных ячейках
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomProfileCell
        cell.backgroundColor = .clear
        cell.labelViewCell.darkThemeLabel()
        cell.commentLabel.darkThemeLabel()
        switch indexPath.row {
        case 0:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        case 1:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        case 2:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        case 3:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        case 4:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        case 5:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        default:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.commentLabel.text = Comments[indexPath.row]
        }
        return cell
    }
    //Действия таблицы
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let Cell:CustomProfileCell!
        switch indexPath.row{
        case 0:
            segueStoryBoard(nameSB: "ProfileEditBoard")
        case 1:
            segueStoryBoard(nameSB: "WorkInfoEdithBoard")
        case 2:
//            segueStoryBoard(nameSB: "AppsInfoBoard")
            vk_massage()
        case 3:
//            AlertView(text: "Butt")
             DarkMode()
        case 4:
            typeSelect()
        case 5:
            alertAction()
        default:
            segueStoryBoard(nameSB: "AdminStoryboard")
            print("admin consol")
        }
    }
    // Функция выбора сменить профиль или нет
    func alertAction() {
        let AC = UIAlertController(title: "Смена пользователя", message: "Вы уверены что хотите сменить пользователя?", preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "Нет", style: .default, handler: nil)
        let AlAc2 = UIAlertAction(title: "ДА", style: .cancel, handler: { (UIAlertAction) in
            self.exit()
            TypeString.TypeStrings.nameType = ""
            self.userInfo.clearData()
            })
         AC.addAction(AlAc2)
         AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
    // Переход на публичную страницу приложения
    func vk_massage(){
        let massage = "Спасибо что пользуетесь данным приложением. Все предложения вы можете оставить группе в VK.Найти ссылку можете на странице приложения в AppStore. Надеюсь на хороший рейтинг. Чем выше ваша оценка,тем мне приятнее и появляется желание его делать.В скором времени добвлю номер для Viber и WhatsApp куда сможете написать в случае ошибок"
        var VK_Alert = UIAlertController()
        if UIDevice.current.model == "iPad" {
             VK_Alert = UIAlertController(title: "О приложении", message: massage , preferredStyle: .alert)
        } else {
             VK_Alert = UIAlertController(title: "О приложении", message: massage , preferredStyle: .actionSheet)
        }
        let URL_VK_Groupe = UIAlertAction(title: "Перейти в группу", style: .default) { (UIAlertAction) in
            let URL_VK = URL(string: "https://vk.com/firefighterapp")
            UIApplication.shared.open(URL_VK!)
        }
        let Cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        VK_Alert.addAction(URL_VK_Groupe)
        VK_Alert.addAction(Cancel)
        present(VK_Alert, animated: true, completion: nil)
    }
    // Включение темной темы
    func DarkMode(){
        let DarkModeMassage = "Данная функция находится в стадии альфа тестирования и может быть доработана в будущем или быть перенесена в другой раздел"
        let userDefMode = UserDefaults.standard
        var DarkAlert = UIAlertController()
        if UIDevice.current.model == "iPad" {
            DarkAlert = UIAlertController(title: "Внимание", message: DarkModeMassage, preferredStyle: .alert)
        } else {
            DarkAlert = UIAlertController(title: "Внимание", message: DarkModeMassage, preferredStyle: .actionSheet)
        }
        
        let Dark = UIAlertAction(title: "Темная тема", style: .default) { (UIAlertAction) in
                userDefMode.set(true, forKey: "DarkMode")
                userDefMode.synchronize()
            self.updateView()
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil, userInfo: ["Dark" : "Black_Fun"])
        }
        let White = UIAlertAction(title: "Светлая тема", style: .default) { (UIAlertAction) in
            userDefMode.set(false, forKey: "DarkMode")
            userDefMode.synchronize()
            self.updateView()
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkMode"), object: nil, userInfo: ["Dark" : "White_Fun"])
        }
        let Cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        DarkAlert.addAction(Dark)
        DarkAlert.addAction(White)
        DarkAlert.addAction(Cancel)
        present(DarkAlert, animated: true, completion: nil)
    }
    
    func typeSelect(){
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
    
    
    //Смена пользователя
    func exit() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
        segueStoryBoard(nameSB: "authStoryBoard")
    }
    //Переходы на разные сториборды
    func segueStoryBoard(nameSB: String!) {
        switch nameSB {
        case "ProfileEditBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! EditProfileInfoVC
                present(Vc, animated: true, completion: nil)
        case "authStoryBoard": let Vc = AuthAndRegistrationView()
                 Vc.modalPresentationStyle = .fullScreen
                present(Vc, animated: true)
        case "WorkInfoEdithBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! WorkInfoEdithVC
                present(Vc, animated: true, completion: nil)
        case "AppsInfoBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! UINavigationController
                present(Vc, animated: true, completion: nil)
        case "AdminStoryboard": let Vc = UIViewController(nibName: "AuthAndRegistrationView", bundle: .none)
                present(Vc, animated: true, completion: nil)
        default: break
        }
    }
    //Обновление контроллера
    func updateView() {
        let ViewLoad = DispatchQueue.main
        ViewLoad.async {
            self.tableView.reloadData()
//            self.navigationController?.navigationBar.darkThemeNav()
            self.tabBarController?.tabBar.darkThemeBar()
            
        }
    }


}
