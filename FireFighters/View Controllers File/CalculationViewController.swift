//
//  CalculationViewController.swift
//  FireFighters
//
//  Created by Павел on 23.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import UIKit
import CoreData
class CalculationViewController: UIViewController {
let DataBase = UserProfile()
    @IBOutlet weak var UnitTypeInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UnitTypeInfo.text = userUnitTypeInfo(type: DataBase.userUnitType)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userUnitTypeInfo(type: String!) -> String! {
        var types: String!
        switch type {
        case "ДАСВ":
            types = UnitTypeEnum.dasv.rawValue
        case "ДАСК":
            types = UnitTypeEnum.dask.rawValue
        default:
            print("Errors load DB")
        }
        return types
    }

}
