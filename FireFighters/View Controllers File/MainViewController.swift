//
//  MainViewController.swift
//  FireFighters
//
//  Created by Павел on 10.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import UIKit
import CoreData
class MainViewController: UIViewController {
    let userInfo = UserProfile()
    let CustomView = UICustomClass()
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    //@IBOutlet weak var testImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomView.customImage(image: userPhoto)
        userNameLabel.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic)) "
        userPhoto.image = userInfo.userPhoto
        statusLabel.text = TextLabel.today.rawValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
