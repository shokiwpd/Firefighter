import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var userPhotoView: UIImageView!
    @IBOutlet weak var userNameView: UITextField!
    @IBOutlet weak var userPatronymicView: UITextField!
    @IBOutlet weak var userCityView: UITextField!
    @IBOutlet weak var userBirthdayPicker: UIDatePicker!
    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var selPhotoButton: UIButton!
    //MARK: Var
    var nextButtonGardient = CAGradientLayer()
    
    override func viewDidLayoutSubviews() {
        nextButtonGardient.gardientButton(w: nextViewButton.frame.size.width, h: nextViewButton.frame.size.height)
        nextViewButton.layer.insertSublayer(nextButtonGardient, at: 0)
        nextViewButton.clipsToBounds = true
        nextViewButton.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        userNameView.delegate = self
        userPatronymicView.delegate = self
        userCityView.delegate = self
        userBirthdayPicker.customDataPicker()
        userNameView.keyboardKey(next: false)
        userPatronymicView.keyboardKey(next: false)
        userCityView.keyboardKey(next: true)
        userPhotoView.layer.cornerRadius = 10
    }
    


    @IBAction func nextViewSelButton(_ sender: Any) {
        textFieldDidEndEditing(userNameView)
        textFieldDidEndEditing(userPatronymicView)
        textFieldDidEndEditing(userCityView)
        guard userNameView.text != "" else {return AlertView(text: "Вы не указали свое имя!")}
        guard userPatronymicView.text != "" else {return AlertView(text: "Вы не указали своё Отчество!")}
        guard userCityView.text != "" else {return AlertView(text: "Вы не указали свой город!")}
        view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "NextVC"{
                let NextView = segue.destination as! FirstNextViewController
                    NextView.name = userNameView.text!
                    NextView.Patronymic = userPatronymicView.text!
                    NextView.city = userCityView.text!
                    NextView.birthDay = getUserBirthday(date: userBirthdayPicker.date)
                    NextView.userPhoto = userPhotoView.image!
            }

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.forrmater_text == "" {
            textField.text = ""
        }
    }

    func getUserBirthday(date: Date) -> String!{
        let Forrmated = DateFormatter()
        Forrmated.dateFormat = "dd:MM:YYYY"
        let formatedDate = Forrmated.string(from: date)
        return formatedDate
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        selectPhotoAlert()
    }
    
    func selectPhotoAlert(){
        let SelPhoto = UIAlertController(title: "Добавить Фото", message: nil, preferredStyle: .actionSheet)
        SelPhoto.addAction(UIAlertAction(title: "Камера", style: .default) { (action) in
            self.selPhotoSource(source: .camera)
        })
        SelPhoto.addAction(UIAlertAction(title: "Альбом", style: .default) { (action) in
            self.selPhotoSource(source: .photoLibrary)
        })
        SelPhoto.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(SelPhoto, animated: true, completion: nil)
    }
    func selPhotoSource(source: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        userPhotoView.image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
        userPhotoView.contentMode = .scaleAspectFill
        userPhotoView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
