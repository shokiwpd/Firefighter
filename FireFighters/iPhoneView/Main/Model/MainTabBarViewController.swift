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
        
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        viewControllers = [
            openView(with: MainViewController(), titleName: "Главная", imageBar: #imageLiteral(resourceName: "GL")),
            openView(with: CalculationViewController(), titleName: "Расчеты", imageBar: #imageLiteral(resourceName: "RS")),
            openView(with: DocViewController(), titleName: "Документация", imageBar: #imageLiteral(resourceName: "DOC"))
        ]
     }
    //segue to tabbar
    func openView(with rootController: UIViewController, titleName: String, imageBar: UIImage) -> UIViewController {
        let naviViewCintroller = mainNavigationBar(rootViewController: rootController) // Присваиваем имя для перехода на контроллер с нав баром
        naviViewCintroller.tabBarItem.title = titleName // имя раздела
        naviViewCintroller.tabBarItem.image = imageBar // изображение раздела
        rootController.navigationItem.title = titleName
        return naviViewCintroller
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

