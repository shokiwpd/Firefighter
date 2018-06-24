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
}






