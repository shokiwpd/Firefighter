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
    let tests = UserProfile()
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var testImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load")
        test.text = "Привет \(String(tests.userName)) \(String(tests.userSecName)) "
        testImage.image = tests.userPhoto
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
