import UIKit
import Firebase

class LoginPassVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var createLogin: UITextField! {
        didSet {
            createLogin.backgroundColor = UIColor.clear
            createLogin.borderStyle = .none
        }
    }
    @IBOutlet weak var createPassw: UITextField! {
        didSet {
            createPassw.backgroundColor = UIColor.clear
            createPassw.borderStyle = .none
        }
    }
    @IBOutlet weak var passCheck: UITextField!
        {
        didSet {
            passCheck.backgroundColor = UIColor.clear
            passCheck.borderStyle = .none
        }
    }
    @IBOutlet weak var customButton: UIButton!
    var eMailField: CAShapeLayer! {
        didSet {
            eMailField.fillColor = nil
            eMailField.lineCap = "round"
            eMailField.lineWidth = 2
            eMailField.strokeColor = UIColor.black.cgColor
            eMailField.strokeEnd = 1
        }
    }
    var passField1: CAShapeLayer! {
        didSet {
            passField1.fillColor = nil
            passField1.lineCap = "round"
            passField1.lineWidth = 2
            passField1.strokeColor = UIColor.black.cgColor
            passField1.strokeEnd = 1
        }
    }
    var passField2: CAShapeLayer! {
        didSet {
            passField2.fillColor = nil
            passField2.lineCap = "round"
            passField2.lineWidth = 2
            passField2.strokeColor = UIColor.black.cgColor
            passField2.strokeEnd = 1
        }
    }
    let customClass = UICustomClass()
    
    override func viewDidLayoutSubviews() {
            eMailField = CAShapeLayer()
            passField1 = CAShapeLayer()
            passField2 = CAShapeLayer()
                createLogin.layer.addSublayer(eMailField)
                createPassw.layer.addSublayer(passField1)
                passCheck.layer.addSublayer(passField2)
                    customTextField(shape: eMailField, textFields: createLogin)
                    customTextField(shape: passField1, textFields: createPassw)
                    customTextField(shape: passField2, textFields: passCheck)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(customClass.backgraundRegistration(), at: 0)
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
    func customTextField(shape: CAShapeLayer, textFields: UITextField) {
        shape.frame = textFields.bounds
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: textFields.frame.size.height))
        patching.addLine(to: CGPoint(x: textFields.frame.size.width, y: textFields.frame.size.height))
        shape.path = patching.cgPath
    }
    
}
