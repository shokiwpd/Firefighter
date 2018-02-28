

import UIKit
class CalculationViewController: UIViewController {
let DataBase = UserProfile.userInform
    
    @IBOutlet weak var statusFire: UISwitch!
    @IBOutlet weak var ComplexityStatus: UISwitch!
    @IBOutlet weak var numberFireFighter: UISlider!
    @IBOutlet weak var nuberFirfighterNow: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var statusFireBool = false
    var Complexity = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setTitle("Далее", for: .normal)
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

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "NextView"{
                let NextView = segue.destination as! SelectTimeFireFighter
                NextView.status = statusFireBool
                NextView.numberFirefighter = Int(numberFireFighter.value)
            }
        }

}

