
import UIKit

class CustomNavContr: UINavigationController,UINavigationBarDelegate {
    let theme = ThemeUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func ItemsStyle(itemStyle: UINavigationItem){
        itemStyle.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        itemStyle.backBarButtonItem?.tintColor = .white
    }
    func navigarionControllers(controlNav: UINavigationController){
        controlNav.navigationBar.prefersLargeTitles = true
    }
}
extension CustomNavContr: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        ItemsStyle(itemStyle: viewController.navigationItem)
        navigationBar.darkThemeNav()
        navigarionControllers(controlNav: navigationController)
    }
}
