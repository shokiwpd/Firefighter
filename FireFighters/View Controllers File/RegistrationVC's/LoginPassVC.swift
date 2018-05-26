import UIKit
import Firebase

class LoginPassVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var createLogin: UITextField!
    @IBOutlet weak var createPassw: UITextField!
    @IBOutlet weak var passCheck: UITextField!
    @IBOutlet weak var customButton: UIButton! {
        didSet {
            customButton.layer.shadowColor = UIColor.black.cgColor
            customButton.layer.shadowOpacity = 1.0
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    
    var eMailField: CAShapeLayer! {
        didSet {
            eMailField.layerLine(strokeColors: UIColor.black.cgColor)
        }
    }
    var passField1: CAShapeLayer! {
        didSet {
            passField1.layerLine(strokeColors: UIColor.black.cgColor)
        }
    }
    var passField2: CAShapeLayer! {
        didSet {
            passField2.layerLine(strokeColors: UIColor.black.cgColor)
        }
    }
    var nextViewButtonGardient: CAGradientLayer! {
        didSet {
            nextViewButtonGardient.gradientsColor()
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
        createLogin.lineToTextField(shape: eMailField)
        createPassw.lineToTextField(shape: passField1)
        passCheck.lineToTextField(shape: passField2)
        nextViewButtonGardient = CAGradientLayer()
        nextViewButtonGardient.frame = CGRect(x: 0, y: 0, width: customButton.frame.size.width, height: customButton.frame.size.height)
        customButton.layer.insertSublayer(nextViewButtonGardient, at: 0)
        customButton.customButtonColor(radius: 10, nameBut: "Далее", titleColor: .black, shadowColors: UIColor.black.cgColor)
        cancelButton.customButtonColor(radius: 10, nameBut: "Отмена", titleColor: .black, shadowColors: UIColor.clear.cgColor)
        customButton.clipsToBounds = true
        customButton.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(view.backgraundRegistration(), at: 0)
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
    
    @IBAction func cancelRegitration(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
