//
//  Custom_TabBar.swift
//  FireFighters
//
//  Created by Павел on 24.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class Custom_TabBar: UITabBarController {
    let theme = ThemeUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.darkThemeBar()
    }
}

