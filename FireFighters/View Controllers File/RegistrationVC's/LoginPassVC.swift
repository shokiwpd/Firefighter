import UIKit
import Firebase

class LoginPassVC: UIViewController,UITextFieldDelegate,getTockenUser {
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var passCheck: UITextField!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var eMailField = CAShapeLayer()
    var passField1 = CAShapeLayer()
    var passField2 = CAShapeLayer()
    var nextViewButtonGardient = CAGradientLayer()
    let customClass = UICustomClass()
    let x = (Auth.auth().currentUser?.uid)
    
    override func viewDidLayoutSubviews() {
            eMailField.layerLine(strokeColors: UIColor.black.cgColor)
            passField1.layerLine(strokeColors: UIColor.black.cgColor)
            passField2.layerLine(strokeColors: UIColor.black.cgColor)
                createLogin.layer.addSublayer(eMailField)
                createPassw.layer.addSublayer(passField1)
                passCheck.layer.addSublayer(passField2)
        createLogin.lineToTextField(shape: eMailField)
        createPassw.lineToTextField(shape: passField1)
        passCheck.lineToTextField(shape: passField2)
        nextViewButtonGardient.gardientButton(w: customButton.frame.size.width, h: customButton.frame.size.height)
        customButton.layer.insertSublayer(nextViewButtonGardient, at: 0)
        customButton.customButtonColor(radius: 10, nameBut: "Далее", titleColor: .black, shadowColors: UIColor.black.cgColor)
        cancelButton.customButtonColor(radius: 10, nameBut: "Отмена", titleColor: .black, shadowColors: UIColor.clear.cgColor)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createLogin.delegate = self
        createPassw.delegate = self
        passCheck.delegate = self
        title = "Регистрация"
    }
    
    @IBAction func createUsers(_ sender: Any) {
        guard createPassw.text == passCheck.text else { return AlertView(text:"Пароли не совподают или вы допустили ошибку в пароле")}
        Auth.auth().createUser(withEmail: createLogin.text!, password: createPassw.text!, completion:  {[weak self](user, AuthErrors) in
            guard AuthErrorCode(rawValue: AuthErrors!._code) == nil else {return self!.fetchError(AuthErrors!)}
            guard user != nil else { return self!.fetchError(AuthErrors!)}
            self?.performSegue(withIdentifier: "nextView", sender: nil)
        })
    }
    
    @IBAction func cancelRegitration(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
