//
//  AuthNavigationViewController.swift
//  FireFighters
//
//  Created by Павел on 31.07.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class AuthNavigationViewController: UINavigationController,UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func AuthBarStyle(navCustom: UINavigationBar){
        navCustom.barStyle = .black
        
    }
    func AuthItemStyle(itemStyle: UINavigationItem){
        itemStyle.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        itemStyle.backBarButtonItem?.tintColor = .black
        
    }
    func navigarionControllers(controlNav: UINavigationController){
        controlNav.navigationBar.prefersLargeTitles = true
        controlNav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        controlNav.navigationBar.shadowImage = UIImage()
        controlNav.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        controlNav.navigationController?.popViewController(animated: false)
    }
}
extension AuthNavigationViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        AuthItemStyle(itemStyle: viewController.navigationItem)
        AuthBarStyle(navCustom: navigationBar)
        navigarionControllers(controlNav: navigationController)
    }
}
