import Foundation
import UIKit
class CalculationViewController: UIViewController {
    @IBOutlet weak var statusFire: UISwitch!
    @IBOutlet weak var ComplexityStatus: UISwitch!
    @IBOutlet weak var numberFireFighter: UISlider!
    @IBOutlet weak var nuberFirfighterNow: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var SelectType: UISegmentedControl!
    @IBOutlet weak var OxyAirFlow: UITextField!
    let DataBase = UserProfile.userInform
    var statusFireBool = false
    var Complexity = false
    let CalcClass = CalculationInfo.CalculationInform
    let saveLocalData = UserDefaults.standard
    //MARK: Gardients for Button
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            buttonGardients.startPoint = CGPoint(x: 0, y: 0)
            buttonGardients.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    //MARK: Load first layout
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: nextButton.frame.size.width, height: nextButton.frame.size.height)
        nextButton.grayButton(nameBut: "Далее")
        nextButton.layer.insertSublayer(buttonGardients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        saveAlert()
//        OxyAirFlow.text = String(DataBase.userAirFlow)
        title = "Расчеты"
        CalcClass.claenData()
    }
    func switchStatus(switcher: UISwitch)->Bool! {
        switch switcher.isOn {
        case true:
            return true
        case false:
            return false
        }
        
    }
    @IBAction func selType(_ sender: Any) {
        
    }

    @IBAction func actionStatusFire(_ sender: Any) {
        statusFireBool = switchStatus(switcher: statusFire)
        switch statusFireBool {
        case true:
            nextButton.setTitle("Включение", for: .normal)
        case false:
            nextButton.setTitle("Далее", for: .normal)
        }
    }
    @IBAction func actionComplexityStatus(_ sender: Any) {
        Complexity = switchStatus(switcher: ComplexityStatus)
        
    }
    
    @IBAction func actionNumberFireFighter(_ sender: Any) {
        nuberFirfighterNow.text = String(Int(numberFireFighter.value))
   
    }
    @IBAction func actionNextButton(_ sender: Any) {
        saveLocalData.set(OxyAirFlow.text!, forKey: "OxyAirFlow")
        CalcClass.numberFireFighter = Int(numberFireFighter.value)
        CalcClass.complexityStatus = Complexity
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "NextView"{
                let NextView = segue.destination as! SelectTimeFireFighter
                NextView.status = statusFireBool
                
            }
        }
    func saveAlert() {
        let alertView = UIAlertController(title: "Внимание", message: "Укажите средний расход для кислорода", preferredStyle: .alert)
        alertView.addTextField { (textFields) in
            textFields.placeholder = "Расход"
            textFields.keyboardType = .numberPad
        }
        let saveButton = UIAlertAction(title: "Сохранить", style: .default) { (action)in
            let saveData = alertView.textFields![0] as UITextField
            print(saveData.text!)
        }
        alertView.addAction(saveButton)
        alertView.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alertView, animated: true, completion: nil)
    }

}

