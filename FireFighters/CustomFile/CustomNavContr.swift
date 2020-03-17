
import UIKit

class CustomNavContr: UINavigationController,UINavigationBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func ItemsStyle(itemStyle: UINavigationItem){
        itemStyle.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        itemStyle.backBarButtonItem?.tintColor = .gray
        
    }
}
extension CustomNavContr: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        ItemsStyle(itemStyle: viewController.navigationItem)
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
// Navigation controller to main view
class mainNavigationBar: UINavigationController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.navigationBar.prefersLargeTitles = true
    }
    
    func profileButton(buttonsProfile: UINavigationItem) {
        buttonsProfile.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "userInform"), style: .plain, target: self, action: #selector(editProfile))
    }
    
    @objc func editProfile() {
        let viewOpen = ProfileViewController()
        if #available(iOS 13.0, *) {
            viewOpen.modalPresentationStyle = .formSheet
            present(viewOpen, animated: true, completion: nil)
        } else {
          let navigation = UINavigationController(rootViewController: viewOpen)
          present(navigation, animated: true,completion: nil)
        }
    }
    @objc func openProfileView() {
        let userThemeSelect = UserDefaults.standard
        let alertThemeText = UIAlertController(title: "TestDark", message: "This massage special to test dark theme iOS 13", preferredStyle: .alert)
        if #available(iOS 13.0, *) {
            alertThemeText.addAction(UIAlertAction(title: "Autho iOS 13", style: .default, handler: { (UIAlertAction) in
                userThemeSelect.set(0, forKey: "DarkTheme")
                userThemeSelect.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Auto"])
            }))
        }
            alertThemeText.addAction(UIAlertAction(title: "Dark", style: .default, handler: { (UIAlertAction) in
                userThemeSelect.set(1, forKey: "DarkTheme")
                userThemeSelect.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "Dark"])
            }))
        
            alertThemeText.addAction(UIAlertAction(title: "White", style: .default, handler: { (UIAlertAction) in
                userThemeSelect.set(2, forKey: "DarkTheme")
                userThemeSelect.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil, userInfo: ["Type" : "White"])
            }))
        
        alertThemeText.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(alertThemeText, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigatinDarkTheme()
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    @objc func DarkNotification(notif: Notification) {
           guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
               if Dark != "" {
                   let mainViewReload = DispatchQueue.main
                   mainViewReload.async {
                   self.navigatinDarkTheme()
               }
           }
       }

}
extension mainNavigationBar: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        profileButton(buttonsProfile: viewController.navigationItem)
        navigationController.navigatinDarkTheme()
        }
}
