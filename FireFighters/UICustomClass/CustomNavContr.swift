import UIKit

class CustomNavContr: UINavigationController,UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func navBarStyle(navCustom: UINavigationBar){
        navCustom.backgroundColor = .blue
    }
    func navItemStyle(itemStyle: UINavigationItem){
        itemStyle.titleView = UIImageView(image: UIImage(named: "logo.png"))
    }
}
extension CustomNavContr: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navItemStyle(itemStyle: viewController.navigationItem)
        navBarStyle(navCustom: navigationBar)
    }
}
