import Foundation
import UIKit
import MBProgressHUD

class UICustomClass{
    func CustomButton(nameBut: String, buttons: UIButton){
        buttons.layer.cornerRadius = 10
        buttons.backgroundColor = UIColor.red
        buttons.setTitle(nameBut, for: .normal)
        buttons.tintColor = UIColor.black
    }
    func CustomTextField(textField: UITextField, nextBut: Bool){
        textField.autocorrectionType = .yes
        textField.borderStyle = .roundedRect
        switch nextBut {
        case true: textField.returnKeyType = .next
        case false: textField.returnKeyType = .done
        }
    }
    func customDataPicker(dataPicker: UIDatePicker){
        dataPicker.datePickerMode = .date
        dataPicker.maximumDate = Date()
    }
    func customImage(image: UIImageView){
        image.layer.cornerRadius = image.frame.height / 2
        image.clipsToBounds = true
    }
    func customLabel(label: UILabel){
        label.lineBreakMode = .byTruncatingHead
    }
    func keyboardStepAndHidden(viewVC: UIView, step: Bool){
    let ViewHeight = viewVC.bounds.size.height
    let ViewWidth = viewVC.bounds.size.width
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { () -> Void in
        switch step {
            case true: viewVC.center = CGPoint(x: ViewWidth / 2, y: ViewHeight / 2 - 70)
            case false: viewVC.center = CGPoint(x: ViewWidth / 2, y: ViewHeight / 2)
        }
        }, completion: nil)
    }
    
    func CustomLoadView(text: String, view: UIView, Hidden: Bool){
        let load = MBProgressHUD.showAdded(to: view, animated: true)
        load.animationType = .fade
        load.backgroundView.color = UIColor.blue
        load.labelText = text
        load.backgroundView.style = .blur
        load.tintColor = UIColor.red
        load.minShowTime = 2
        load.isHidden = Hidden
    }
}
extension UIAlertController {
    
    func alertAction(errors: String!) {
        let AC = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        let AlAc = UIAlertAction(title: "ОК", style: .default, handler: nil)
        AC.addAction(AlAc)
        present(AC, animated: true, completion: nil)
    }
}
