import UIKit
import Firebase

class LoginPassVC: UIViewController {
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var infoPass: UIButton!
    @IBOutlet weak var infoLogin: UIButton!
    @IBOutlet weak var customButton: UIButton!
    let customClass = UICustomClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        customClass.CustomButton(nameBut: "Далее", buttons: customButton)
        
    }
    @IBAction func createUsers(_ sender: Any) {
        Auth.auth().createUser(withEmail: createLogin.text!, password: createPassw.text!, completion:  {[weak self](user, error) in
            if error != nil {
                self?.alertAction(errors: error?.localizedDescription)
                return
            }
            if user != nil {
                 self?.performSegue(withIdentifier: "nextView", sender: nil)
                 return
            }
            self?.alertAction(errors: error?.localizedDescription)
        })
    }
    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
    
}
