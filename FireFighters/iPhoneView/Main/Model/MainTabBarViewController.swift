//
//  MainTabBarViewController.swift
//  FireFighters
//
//  Created by Павел on 09.01.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLayoutSubviews() {
        self.tabBarDarkTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewControllers = [
//            openView(with: MainViewController(), titleName: "Главная", imageBar: #imageLiteral(resourceName: "mainIcon")),
            openView(with: CalculationViewController(), titleName: "Расчеты", imageBar: #imageLiteral(resourceName: "calculIcon")),
            openView(with: DocViewController(), titleName: "Документация", imageBar: #imageLiteral(resourceName: "documIcon"))
        ]
     }
    //segue to tabbar
    func openView(with rootController: UIViewController, titleName: String, imageBar: UIImage) -> UIViewController {
        let naviViewController = mainNavigationBar(rootViewController: rootController) // Присваиваем имя для перехода на контроллер с нав баром
        naviViewController.tabBarItem.title = titleName // имя раздела
        naviViewController.tabBarItem.image = imageBar // изображение раздела
        rootController.navigationItem.title = titleName
        return naviViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }
    // update App theme
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
            if Dark != "" {
                let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                self.tabBarDarkTheme()
            }
        }
    }
}

