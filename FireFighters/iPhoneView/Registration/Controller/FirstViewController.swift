import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    var buttonGardients = CAGradientLayer()
    var nameLine = CAShapeLayer()
    var patronymicLine = CAShapeLayer()
    var cityLine = CAShapeLayer()
    
    private var infoLabel: UILabel = {
    let label = UILabel()
        label.text = "Познакомимся с Вами по ближе!"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameField: UITextField = {
       let  text = textFields()
        text.borderStyle = .roundedRect
        text.placeholder = "Имя"
        text.tag = 0
        text.textAlignment = .left
        text.returnKeyType = .next
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    private var patronymicField: UITextField = {
       let text = textFields()
        text.borderStyle = .roundedRect
        text.placeholder = "Отчество"
        text.tag = 1
        text.textAlignment = .left
        text.returnKeyType = .next
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    private var cityField: UITextField = {
        let text = textFields()
        text.borderStyle = .roundedRect
        text.placeholder = "Город"
        text.tag = 2
        text.textAlignment = .left
        text.returnKeyType = .done
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    private var nextViewButton: UIButton = {
       let button = UIButton()
        button.grayButton(nameBut: "Далее")
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return button
    }()
    private var photoImageView: UIImageView = {
       let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.isUserInteractionEnabled = true
        photo.image = UIImage(named: "defPhoto.png")
        return photo
    }()
    private var datePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .date
        date.locale = Locale.init(identifier: "RU")
        date.maximumDate = Date()
        if #available(iOS 13.4, *) {
            date.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        date.isHidden = false
        return date
    }()
    private var viewModel: UIView = {
        let views = UIView()
        views.isUserInteractionEnabled  = true
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    override func viewDidLayoutSubviews() {
        nameField.lineToTextField(shape: nameLine)
        patronymicField.lineToTextField(shape: patronymicLine)
        cityField.lineToTextField(shape: cityLine)

        if #available(iOS 13.0, *) {
            view.backgroundColor = .newDarkTheme
            nameLine.layerLine(strokeColors: UIColor.reversDark.cgColor)
            patronymicLine.layerLine(strokeColors: UIColor.reversDark.cgColor)
            cityLine.layerLine(strokeColors: UIColor.reversDark.cgColor)
        } else {
            view.backgroundColor = .white
            nameLine.layerLine(strokeColors: UIColor.black.cgColor)
            patronymicLine.layerLine(strokeColors: UIColor.black.cgColor)
            cityLine.layerLine(strokeColors: UIColor.black.cgColor)
            infoLabel.textColor = .black
        }
        //UIView case constraint
        if UIDevice.current.model == "iPhone" {
            viewModel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
            viewModel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            viewModel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            viewModel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        } else {
            viewModel.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
            viewModel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
            viewModel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
            viewModel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370).isActive = true
        }
        
        //Information label constraint
        infoLabel.topAnchor.constraint(equalTo: viewModel.topAnchor, constant: 10).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: viewModel.trailingAnchor, constant: -10).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: viewModel.leadingAnchor, constant: 10).isActive = true
        
        //Photo UIimage view constraint
        photoImageView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: CGFloat(130)).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: CGFloat(130)).isActive = true
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 65
        
        //name UItextfield constraint
        nameField.topAnchor.constraint(equalTo: photoImageView.topAnchor).isActive = true
        nameField.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
        nameField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        
        //patronymic UItextfield constraint
        patronymicField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20).isActive = true
        patronymicField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor).isActive = true
        patronymicField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor).isActive = true
        patronymicField.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        
        //city UItextfield constraint
        cityField.topAnchor.constraint(equalTo: patronymicField.bottomAnchor, constant: 20).isActive = true
        cityField.trailingAnchor.constraint(equalTo: patronymicField.trailingAnchor).isActive = true
        cityField.leadingAnchor.constraint(equalTo: patronymicField.leadingAnchor).isActive = true
        cityField.heightAnchor.constraint(equalToConstant: CGFloat(30)).isActive = true
        cityField.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
//        cityField.centerYAnchor.constraint(equalTo: viewModel.centerYAnchor).isActive = true

        //date UIDatepicker constraint
        datePicker.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: cityField.trailingAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
//        datePicker.centerYAnchor.constraint(equalTo: viewModel.centerYAnchor).isActive = true
        
        //next view UIButton constraint
        nextViewButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20).isActive = true
        nextViewButton.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
        nextViewButton.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
        nextViewButton.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        
        
        buttonGardients.gardientButton(w: nextViewButton.frame.size.width, h: nextViewButton.frame.size.height)
        nextViewButton.layer.insertSublayer(buttonGardients, at: 0)
        infoLabel.sizeLabel(height: Double(view.bounds.height))

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        patronymicField.delegate = self
        cityField.delegate = self
        datePicker.darkThemeDatePicker()
        let viewTouchHideKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        viewTouchHideKey.cancelsTouchesInView = false
        
        if #available(iOS 13, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.backgroundColor = .clear
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.barTintColor = .white
        }
        
        let tapping = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        photoImageView.addGestureRecognizer(tapping)
        
    //add conteiner modelView
        view.addSubview(viewModel)
    //conreiner modelView elements
        viewModel.addSubview(infoLabel)
        viewModel.addSubview(nameField)
        viewModel.addSubview(patronymicField)
        viewModel.addSubview(cityField)
        viewModel.addSubview(photoImageView)
        viewModel.addSubview(datePicker)
        viewModel.addSubview(nextViewButton)
        viewModel.addGestureRecognizer(viewTouchHideKey)
    }
    
    @objc func nextView(){
        guard nameField.text! != "" else{return AlertView(text: "Укажите свое имя!")}
        guard patronymicField.text! != "" else{return AlertView(text: "Укажите свое отчество")}
        guard cityField.text! != "" else{return AlertView(text: "Укажите свой город!")}
        let nextView = FirstNextViewController()
        self.navigationController?.pushViewController(nextView, animated: false)
        nextView.nameUser = nameField.text!
        nextView.patronymicUser = patronymicField.text!
        nextView.cityUser = cityField.text!
        nextView.userPhoto = photoImageView.image!
        nextView.dateBirthdayUser = getUserBirthday(date: datePicker.date)
    }
    
    @objc func selectPhoto(){
        var selectPhotoAction = UIAlertController()
        if UIDevice.current.model == "iPhone" {
             selectPhotoAction = UIAlertController(title: "Выберите фото", message: "", preferredStyle: .actionSheet)
        } else {
             selectPhotoAction = UIAlertController(title: "Выберите фото", message: "", preferredStyle: .alert)
        }
        selectPhotoAction.addAction(UIAlertAction(title: "Камера", style: .default, handler: { (UIAlertAction) in
            self.selPhotoSource(source: .camera)
        }))
        selectPhotoAction.addAction(UIAlertAction(title: "Альбом", style: .default, handler: { (UIAlertAction) in
            self.selPhotoSource(source: .photoLibrary)
        }))
        selectPhotoAction.addAction(UIAlertAction(title: "Моменты", style: .default, handler: { (UIAlertAction) in
            self.selPhotoSource(source: .savedPhotosAlbum)
        }))
        selectPhotoAction.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(selectPhotoAction, animated: true, completion:  nil)
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
    
            photoImageView.image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
            dismiss(animated: true, completion: nil)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            if textField == nameField {
                patronymicField.becomeFirstResponder()
            } else if textField == patronymicField {
                cityField.becomeFirstResponder()
            } else if textField == cityField {
                view.endEditing(true)
            }
            return true
        }
    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.resignFirstResponder()
        switch textField.tag {
        case 0: if nameField.text == "" {AlertView(text: "Укажите своё имя!")} else {print("save")}
        case 1: if patronymicField.text == ""{AlertView(text: "Укажите своё отчество!")} else {print("save")}
        case 2: if cityField.text == "" {AlertView(text: "Укажите свой город")} else {print("save")}
        default: print("error ")
        }
    }
    
    @objc func hideKeyboard() {
        viewModel.endEditing(true)
        }
        
    func getUserBirthday(date: Date) -> String!{
            let Forrmated = DateFormatter()
            Forrmated.dateFormat = "dd:MM:YYYY"
            let formatedDate = Forrmated.string(from: date)
            return formatedDate
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



