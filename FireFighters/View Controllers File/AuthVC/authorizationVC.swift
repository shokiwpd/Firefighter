import UIKit
import MBProgressHUD
import FirebaseAuth
import Firebase
class authorizationVC: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var loginView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    @IBOutlet weak var authButtonStyle: UIButton!
    @IBOutlet weak var loadActivity: UIActivityIndicatorView!
    let offlineAuth = false
    let customClass = UICustomClass()
    var ref: DatabaseReference!
    var userCD = UserProfile.userInform
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        passwordView.delegate = self
        customClass.CustomButton(nameBut: "Авторизироваться", buttons: authButtonStyle)
        loadActivity.isHidden = true
    }
    @IBAction func authorizationButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginView.text!, password: passwordView.text!) { [weak self](user, error) in
            if error != nil {
                self?.alertAction(errors: error?.localizedDescription)
                return
            }
            if user != nil {
                self?.customClass.CustomButton(nameBut: "", buttons: (self?.authButtonStyle)!)
                self?.loadActivity.isHidden = false
                self?.loadActivity.startAnimating()
                self?.fetchFirebase()
            }
        }
    }
    @IBAction func registrationButton(_ sender: Any) {
        nextViewContr(nameVC: "firstStoryBoards")
    }
    func nextViewContr(nameVC: String) {
        let Vc = UIStoryboard(name: nameVC, bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(Vc, animated: true, completion: nil)
    }

    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }


fileprivate func fetchFirebase() {
    let getUserID: String! = Auth.auth().currentUser?.uid
    let queue = DispatchQueue.main
    queue.async {
        guard getUserID != nil else { return }
        Database.database().reference().child("firefighter").child(getUserID).observeSingleEvent(of: .value) {[weak self](snapshot) in
            let value = snapshot.value as? NSDictionary
            self?.userCD.userName = value?["name"] as? String ?? ""
            self?.userCD.userPatronymic = value?["patronymic"]  as? String ?? ""
            self?.userCD.userCity = value?["city"]  as? String ?? ""
            self?.userCD.userPosition = value?["position"]  as? String ?? ""
            self?.userCD.userPartNum = value?["partNumb"]  as? String ?? ""
            self?.userCD.userChange = value?["changeNum"] as? Int ?? 0
            self?.userCD.userBirthday = value?["birthDay"] as? String ?? ""
            self?.userCD.userUnitType = value?["unitType"] as? String ?? ""
            self?.nextViewContr(nameVC: "MainStoryboard")
          }
        }
    }
}
