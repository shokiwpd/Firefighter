import UIKit
import FirebaseAuth
class ProfileViewController: UITableViewController {
    let SelUsersCell = ["Личные данные","Рабочие данные","Информация","Сменить пользователя"]
    let Comments = ["Смена города","Смена данных о работе","Информация о приложении",""]
    let userInfo = UserProfile.userInform
    let DarkTheme = ThemeUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
//        self.view.backgroundColor =
        if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "Dark"{
                    self.view.backgroundColor = .black
        } else if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "White"{
                    self.view.backgroundColor = .white
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SelUsersCell.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomProfileCell
        if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "Dark"{
            cell.backgroundColor = UIColor.black
        } else if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "White"{
            cell.backgroundColor = UIColor.white
        }
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
        default:
            print("error")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let Cell:CustomProfileCell!
        switch indexPath.row{
        case 0:
            segueStoryBoard(nameSB: "ProfileEditBoard")
        case 1:
            segueStoryBoard(nameSB: "WorkInfoEdithBoard")
        case 2:
            vk_massage()
        default:
            alertAction()
        }
    }
    func alertAction() {
        let AC = UIAlertController(title: "Смена пользователя", message: "Вы уверены что хотите сменить пользователя?", preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "Нет", style: .default, handler: nil)
        let AlAc2 = UIAlertAction(title: "ДА", style: .cancel, handler: { (UIAlertAction) in
            self.exit()
            self.userInfo.clearData()
            })
         AC.addAction(AlAc)
         AC.addAction(AlAc2)
        present(AC, animated: true, completion: nil)
    }
    func vk_massage(){
        let massage = "Спасибо что пользуетесь данным приложением. Приложение находится в стадии Бета тестирования. Все предложения вы можете оставить группе в VK.Найти ссылку можете на странице приложения в AppStore. Надеюсь на хороший рейтинг. Чем выше ваша оценка,тем мне приятнее и появляется желание его делать."
        let VK_Alert = UIAlertController(title: "О приложении", message: massage , preferredStyle: .alert)
        let URL_VK_Groupe = UIAlertAction(title: "Перейти в группу", style: .default) { (UIAlertAction) in
            let URL_VK = URL(string: "https://vk.com/firefighterapp")
            UIApplication.shared.open(URL_VK!)
        }
        let Cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        VK_Alert.addAction(URL_VK_Groupe)
        VK_Alert.addAction(Cancel)
        present(VK_Alert, animated: true, completion: nil)
    }
    func exit() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Fig vam")
        }
        segueStoryBoard(nameSB: "authStoryBoard")
    }
    func segueStoryBoard(nameSB: String!) {
        switch nameSB {
        case "ProfileEditBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! EditProfileInfoVC
                present(Vc, animated: true, completion: nil)
        case "authStoryBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! UINavigationController
                present(Vc, animated: true, completion: nil)
        case "WorkInfoEdithBoard": let Vc = UIStoryboard(name: nameSB, bundle: nil).instantiateInitialViewController() as! WorkInfoEdithVC
                present(Vc, animated: true, completion: nil)
        default: break
        }
    }


}
