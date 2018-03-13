import UIKit
import Firebase

class LoginPassVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var passCheck: UITextField!
    @IBOutlet weak var customButton: UIButton!
    let customClass = UICustomClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        customClass.CustomButton(nameBut: "Далее", buttons: customButton)
        createPassw.delegate = self
        title = "Регистрация"
    }
    @IBAction func createUsers(_ sender: Any) {
        guard createPassw.text == passCheck.text else { return (self.alertAction(errors:"Пароли не совподают или вы допустили ошибку в пароле"))}
        Auth.auth().createUser(withEmail: createLogin.text!, password: createPassw.text!, completion:  {[weak self](user, error) in
            guard error == nil else { return (self?.alertAction(errors: error?.localizedDescription))! }
            guard user != nil else { return (self?.alertAction(errors: error?.localizedDescription))! }
            self?.performSegue(withIdentifier: "nextView", sender: nil)
        })
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customClass.keyboardStepAndHidden(viewVC: view, step: false)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {//keyboeard view
        customClass.keyboardStepAndHidden(viewVC: view, step: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
            customClass.keyboardStepAndHidden(viewVC: view, step: false)
        }
        super.touchesBegan(touches, with: event)
    }
    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание!", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
    
}
