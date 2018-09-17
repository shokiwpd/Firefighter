import UIKit
import FirebaseAuth
class ProfileViewController: UITableViewController {
    let SelUsersCell = ["Личные данные","Рабочие данные","Информация","Сменить пользователя"]
    let Comments = ["Смена города","Смена данных о работе","Информация о приложении",""]
    let userInfo = UserProfile.userInform
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
//        self.view.insertSubview(customClass.backgraundView(), at: 1)
//        self.view.insertSubview(customClass.blurringScreen(view: view), at: 2)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//            cell.labelViewCell.text = SelUsersCell[indexPath.row]
//            cell.iconCell.image = #imageLiteral(resourceName: "userInform")
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
            print("hz")
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
            AlertView(text: "Спасибо что пользуетесь данным приложением. Приложение находится в стадии Бета тестирования. Все предложения вы можете оставить группе в VK.Найти ссылку можете на странице приложения в AppStore. Надеюсь на хороший рейтинг. Чем выше ваша оценка,тем мне приятнее и появляется желание его делать.")
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
