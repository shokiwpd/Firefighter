//
//  CustomizationViewController.swift
//  FireFighters
//
//  Created by Павел on 24.09.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class CustomizationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK: UIkit Elements
    //Theme UIKit
    let themeCustomLabel: UILabel = {
        let label = UILabel()
        label.text = "Тема оформления:"
       return UILabel()
    }()
    
    let themeCustomPickerField = profileEdithText()
    //Selector UIKit
    let customCulcSelectLabel: UILabel = {
        let label = UILabel()
        label.text = "Ввод данных расчетов:"
        return UILabel()
    }()
    
    let customCulcSelectField = profileEdithText()
    
    //Picker UIkit
    let themePickerView = UIPickerView()
    let selectorPickerView = UIPickerView()
    //if iOS later 13 verison
    let iOSlaterButtonSave: UIButton = {
        return UIButton()
    }()
    let themeName = ["Системная","Тёмная тема","Светлая тема"]
    let selectCulcName = ["В ручную","Готовые"]
    
    
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
        self.iOSlaterButtonSave.DarkThemeButton()
        self.themeCustomLabel.darkThemeLabel()
        self.customCulcSelectLabel.darkThemeLabel()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
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
