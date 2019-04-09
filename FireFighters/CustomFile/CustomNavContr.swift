
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
        navigationBar.darkThemeNav()
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
