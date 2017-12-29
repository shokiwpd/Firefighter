import UIKit

class CustomNavContr: UINavigationController {

    @IBOutlet weak var customNavBarOutlet: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navBarStyle(navCustom: customNavBarOutlet)
    }
    func navBarStyle(navCustom: UINavigationBar){
        navCustom.barStyle = .black
        navCustom.backgroundColor = UIColor.blue
    }
    func navItemStyle(itemStyle: UINavigationItem){
        itemStyle.title = "Огнеборцы"
    }
}
extension CustomNavContr: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navItemStyle(itemStyle: viewController.navigationItem)
    }
}
