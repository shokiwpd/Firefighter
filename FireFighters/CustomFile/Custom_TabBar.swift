//
//  Custom_TabBar.swift
//  FireFighters
//
//  Created by Павел on 24.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class Custom_TabBar: UITabBarController {
    override func viewDidLayoutSubviews() {
        self.tabBar.darkThemeBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        delegate = self
    }
}
extension Custom_TabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBarController.tabBar.darkThemeBar()
    }

}

