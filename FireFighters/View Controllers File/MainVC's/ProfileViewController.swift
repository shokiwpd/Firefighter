import UIKit
import FirebaseAuth
class ProfileViewController: UITableViewController {

    let SelUsersCell = ["Личные данные","Рабочие данные","Мед.комиссии","Сосотояние здоровья","Сменить пользователя"]
    let icon = [""]
    let userInfo = UserProfile.userInform
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"

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
            cell.iconCell.image = userInfo.userPhoto
        case 1:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.iconCell.image = #imageLiteral(resourceName: "userWorkInfo")
        case 2:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.iconCell.image = #imageLiteral(resourceName: "userHealtComis")
        case 3:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.iconCell.image = #imageLiteral(resourceName: "userHealt")
        case 4:
            cell.labelViewCell.text = SelUsersCell[indexPath.row]
            cell.iconCell.image = #imageLiteral(resourceName: "logOut")
        default:
            print("hz")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Cell:CustomProfileCell!
        switch indexPath.row{
        case 0:
            print(1)
        case 1:
            print(2)
        case 2:
            print(3)
        case 3:
            print(4)
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
        nextViewContr()
    }
    
    
    
    
    
    func nextViewContr() {
            let Vc = UIStoryboard(name: "authStoryBoard", bundle: nil).instantiateInitialViewController() as! authorizationVC
            present(Vc, animated: true, completion: nil)

        }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
