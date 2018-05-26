import Foundation
import UIKit

class UICustomClass{
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

}
extension UIView {
    func backgraundView()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "launchScreen.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
    func blurringScreen() -> UIView!{
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return blurView
    }
    func backgraundRegistration()-> UIView! {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "registScreen.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        return backgroundImage
    }
}
extension UITextField {
    func lineToTextField(shape: CAShapeLayer) {
        self.backgroundColor = UIColor.clear
        self.borderStyle = .none
        shape.frame = self.bounds
        let patching = UIBezierPath()
        patching.move(to: CGPoint(x: 0, y: self.frame.size.height))
        patching.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        shape.path = patching.cgPath
        self.layer.addSublayer(shape)
    }
}
extension Date {
    var TimeFormat: String {
        let formDate = DateFormatter()
        formDate.dateFormat = "HH:mm"
        return formDate.string(from: self)
    }
}
extension UIButton
{
    func customButtonColor(radius:CGFloat,nameBut: String, titleColor: UIColor, shadowColors: CGColor) {
        self.layer.cornerRadius = radius
        self.setTitle(nameBut, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.clipsToBounds = true
        self.layer.shadowColor = shadowColors
        self.layer.shadowOpacity = 2.0
    }
    func customButtonClear(buttonColor: UIColor,radius: CGFloat,borderColors: CGColor,shadowColors: CGColor,nameBut: String){
        self.backgroundColor = buttonColor
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColors
        self.layer.cornerRadius = radius
        self.layer.shadowColor = shadowColors
        self.layer.shadowOpacity = 1.0
        self.setTitle(nameBut, for: .normal)
    }
}
extension CAShapeLayer {
    func layerLine(strokeColors: CGColor) {
        self.fillColor = nil
        self.lineCap = "round"
        self.lineWidth = 2
        self.strokeColor = strokeColors
        self.strokeEnd = 1
    }
}
extension CAGradientLayer {
    func gradientsColor(){
        self.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
    }
}

