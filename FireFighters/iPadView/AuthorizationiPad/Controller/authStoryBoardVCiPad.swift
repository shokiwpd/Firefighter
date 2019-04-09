//
//  authStoryBoardVCiPad.swift
//  FireFighters
//
//  Created by Павел on 30/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class authStoryBoardVCiPad: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel! {
        didSet {
            appNameLabel.text = "Огнеборцы"
        }
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    var allButtonGarfients = CAGradientLayer()//Гардиент

    
    override func viewDidLayoutSubviews() {
        loginButton.grayButton(nameBut: "Вход")
        registrationButton.clearButton(nameBut: "Регистрация")
        appNameLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        allButtonGarfients.gardientButton(w: loginButton.frame.size.width, h: loginButton.frame.size.height)
        loginButton.layer.insertSublayer(allButtonGarfients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.bounds.height)

        // Do any additional setup after loading the view.
    }
    @IBAction func segueRegistration(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
