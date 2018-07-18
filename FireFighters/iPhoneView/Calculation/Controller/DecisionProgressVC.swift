//
//  DecisionProgressVC.swift
//  FireFighters
//
//  Created by Павел on 29.04.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit

class DecisionProgressVC: UIViewController {
    let CalcData = CalculationInfo()
    @IBOutlet weak var ScrollsVeiw: UIScrollView!
    var resultTextClass = ""
    @IBOutlet weak var DecisionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollsVeiw.contentLayoutGuide.bottomAnchor.constraint(equalTo: DecisionLabel.bottomAnchor).isActive = true
        DecisionLabel.text = resultTextClass
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
