

import UIKit
class CalculationViewController: UIViewController {
let DataBase = UserProfile.userInform
    
    @IBOutlet weak var statusFire: UISwitch!
    @IBOutlet weak var ComplexityStatus: UISwitch!
    @IBOutlet weak var numberFireFighter: UISlider!
    @IBOutlet weak var nuberFirfighterNow: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var statusFireBool = false
    var Complexity = false
    let CustomUI = UICustomClass()
    let CaclClass = CalculationInfo.CalculationInform
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(CustomUI.backgraundView(), at: 0)
        self.view.insertSubview(CustomUI.blurringScreen(view: view), at: 1)
        title = "Расчеты"
        CaclClass.claenData()
        CustomUI.CustomButton(nameBut: "Далее", buttons: nextButton)
    }
    func switchStatus(switcher: UISwitch)->Bool! {
        switch switcher.isOn {
        case true:
            return true
        case false:
            return false
        }
        
    }
    @IBAction func actionStatusFire(_ sender: Any) {
        statusFireBool = switchStatus(switcher: statusFire)
        switch statusFireBool {
        case true:
            CustomUI.CustomButton(nameBut: "Включение", buttons: nextButton)
        case false:
            CustomUI.CustomButton(nameBut: "Далее", buttons: nextButton)
        }
    }
    @IBAction func actionComplexityStatus(_ sender: Any) {
        Complexity = switchStatus(switcher: ComplexityStatus)
        
    }
    
    @IBAction func actionNumberFireFighter(_ sender: Any) {
        nuberFirfighterNow.text = String(Int(numberFireFighter.value))
   
    }
    @IBAction func actionNextButton(_ sender: Any) {
        CaclClass.numberFireFighter = Int(numberFireFighter.value)
        CaclClass.complexityStatus = Complexity
        print(Complexity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "NextView"{
                let NextView = segue.destination as! SelectTimeFireFighter
                NextView.status = statusFireBool
                
            }
        }

}

