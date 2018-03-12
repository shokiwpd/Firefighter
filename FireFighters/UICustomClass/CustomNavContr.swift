import UIKit

class CustomNavContr: UINavigationController,UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func navBarStyle(navCustom: UINavigationBar){
        navCustom.barStyle = .black
    }
    func navItemStyle(itemStyle: UINavigationItem){
        //itemStyle.titleView = UIImageView(image: UIImage(named: "logo.png"))
        itemStyle.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    func navigarionControllers(controlNav: UINavigationController){
        controlNav.navigationBar.prefersLargeTitles = true
    }
}
extension CustomNavContr: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navItemStyle(itemStyle: viewController.navigationItem)
        navBarStyle(navCustom: navigationBar)
        navigarionControllers(controlNav: navigationController)
    }
}
