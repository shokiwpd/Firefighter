import UIKit
import MBProgressHUD

class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var userPhotoView: UIImageView!
    @IBOutlet weak var userNameView: UITextField!
    @IBOutlet weak var userPatronymicView: UITextField!
    @IBOutlet weak var userCityView: UITextField!
    @IBOutlet weak var userBirthdayPicker: UIDatePicker!
    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var selPhotoButton: UIButton!
    
    //MARK: Var
    let CustomClass = UICustomClass()
    var nextView = false
    let userInformSave = UserProfile.userInform
    var isProfileEdit = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        userPatronymicView.delegate = self
        userCityView.delegate = self
        isProfileEdit ? CustomClass.CustomButton(nameBut: "Сохранить", buttons: nextViewButton) : CustomClass.CustomButton(nameBut: "Продолжить", buttons: nextViewButton)
        CustomClass.customDataPicker(dataPicker: userBirthdayPicker)
        CustomClass.CustomTextField(textField: userNameView, nextBut: true)
        CustomClass.CustomTextField(textField: userPatronymicView, nextBut: true)
        CustomClass.CustomTextField(textField: userCityView, nextBut: false)
        userPhotoView.layer.cornerRadius = 10
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomClass.keyboardStepAndHidden(viewVC: view, step: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
            CustomClass.keyboardStepAndHidden(viewVC: view, step: false)
        }
        super.touchesBegan(touches, with: event)
    }
    @IBAction func nextViewSelButton(_ sender: Any) {
        guard userNameView.text != "",userPatronymicView.text! != "",userCityView.text! != ""  else {
            nextView = false
            if userNameView.text == ""{ errorsMassages(errors: "Вы не указали свое имя!")}
                else if userPatronymicView.text == "" {errorsMassages(errors: "Вы не указали своё Отчество!")}
                    else if userCityView.text == ""{errorsMassages(errors: "Вы не указали свой город!")}
            return
        }
        nextView = true
        view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch nextView {
        case true:
            if segue.identifier == "NextVC"{
                let NextView = segue.destination as! FirstNextViewController
                    NextView.name = userNameView.text!
                    NextView.Patronymic = userPatronymicView.text!
                    NextView.city = userCityView.text!
                    NextView.birthDay = getUserBirthday(date: userBirthdayPicker.date)
                    NextView.userPhoto = userPhotoView.image!
            }
        case false:
            print("Errors")
        }
    }
    func getUserBirthday(date: Date) -> String!{
        let Forrmated = DateFormatter()
        Forrmated.dateFormat = "dd:MM:YYYY"
        let formatedDate = Forrmated.string(from: date)
        return formatedDate
    }
    func errorsMassages(errors: String!){
        let AlertView = UIAlertController(title: "Внимание", message: errors, preferredStyle: .alert)
        AlertView.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        present(AlertView, animated: true, completion: nil)
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
    func selPhotoSource(source: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        userPhotoView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        userPhotoView.contentMode = .scaleAspectFill
        userPhotoView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}

