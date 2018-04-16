import Foundation
import UIKit

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
    func backgraundView()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        print("backgraund\(UIScreen.main.bounds)")
        backgroundImage.image = UIImage(named: "launchScreen.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
    func backgraundRegistration()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        print("backgraund\(UIScreen.main.bounds)")
        backgroundImage.image = UIImage(named: "registScreen.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
    func blurringScreen(view: UIView) -> UIView!{
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
    func customTextField(shape: CAShapeLayer, textFields: UITextField) {
        shape.frame = textFields.bounds
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: textFields.frame.size.height))
        patching.addLine(to: CGPoint(x: textFields.frame.size.width, y: textFields.frame.size.height))
        shape.path = patching.cgPath
    }
    
}
