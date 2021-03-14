import UIKit
import Firebase
import iosMath
class MainViewController: UIViewController {

//    //Выбор аппарата
    let typeCheking = TypeString.TypeStrings
    var themeCollectionView = ThemeUICollectionView()

    override func viewWillLayoutSubviews() {
        self.view.viewThemeColor()
        themeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        themeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        themeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        themeCollectionView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor).isActive = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if typeCheking.nameType == "" {
                    alertSelect()
                }
        view.addSubview(themeCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
                themeCollectionView.RootViewController = self

    }
    
    
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                self.view.viewThemeColor()
//                self.themeCollectionView.viewThemeColor()
            }
        }
    }
    
    func updateType (){
            let loadQ = DispatchQueue.main
            loadQ.async {
                }
            }
    func alertSelect(){
           let alertChek = UIAlertController(title: "Выберите марку аппарата", message: "Выберите из списка Ваш аппарат используемый в подразделении", preferredStyle: .alert)
           let AUER = UIAlertAction(title: "AUER", style: .default) { (UIAlertAction) in
               self.typeCheking.nameType = "AUER"
               self.updateType()
           }
           let OMEGA = UIAlertAction(title: "ОМЕГА", style: .default) { (UIAlertAction) in
               self.typeCheking.nameType = "ОМЕГА"
               self.updateType()
           }
           let defaults = UIAlertAction(title: "Прочие", style: .cancel) { (UIAlertAction) in
               self.typeCheking.nameType = "Прочие"
               self.updateType()
           }
           alertChek.addAction(AUER)
           alertChek.addAction(OMEGA)
           alertChek.addAction(defaults)
           present(alertChek, animated: true, completion: nil)
       }
    
}
