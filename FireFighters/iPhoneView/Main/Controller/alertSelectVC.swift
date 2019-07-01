//
//  alertSelectVC.swift
//  FireFighters
//
//  Created by Павел on 06/05/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class alertSelectVC: UIViewController {
    let typeCheking = TypeString.TypeStrings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertSelect()
        // Do any additional setup after loading the view.
    }
    func alertSelect(){
            let alertChek = UIAlertController(title: "Выберите марку аппарата", message: "Выберите из списка Ваш аппарат используемый в подразделении", preferredStyle: .alert)
            let AUER = UIAlertAction(title: "AUER", style: .default) { (UIAlertAction) in
                self.typeCheking.nameType = "AUER"
                let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
                self.present(Vc, animated: true, completion: nil)
            }
            let OMEGA = UIAlertAction(title: "ОМЕГА", style: .default) { (UIAlertAction) in
                self.typeCheking.nameType = "ОМЕГА"
                let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
                self.present(Vc, animated: true, completion: nil)
            }
            let defaults = UIAlertAction(title: "Прочие", style: .cancel) { (UIAlertAction) in
                self.typeCheking.nameType = "Прочие"
                let Vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController() as! UITabBarController
                self.present(Vc, animated: true, completion: nil)
            }
            alertChek.addAction(AUER)
            alertChek.addAction(OMEGA)
            alertChek.addAction(defaults)
            present(alertChek, animated: true, completion: nil)
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
