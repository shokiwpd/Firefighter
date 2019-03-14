//
//  AdminVC.swift
//  FireFighters
//
//  Created by Павел on 15/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class AdminVC: UIViewController, getTockenUser {
    @IBOutlet weak var newsName: UITextField!
    @IBOutlet weak var newsText: UITextField!
    @IBOutlet weak var addNews: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsName.placeholder = "Назавние новости"
        self.newsText.placeholder = "Текст новости"
        self.addNews.clearButton(nameBut: "Опубликовать")
        self.backButton.clearButton(nameBut: "Назад")
    }
    func addNewNews(newsLabel: String!,newsText: String!){
        let Dates = Date()
        guard newsLabel != "" else {return AlertView(text: "Вы не указали название новости!")}
        guard newsText != "" else {return AlertView(text: "Укажите текст новости!")}
        let saveNews = newsSave(NewsTitle: newsLabel, NewsText: newsText)
        let newsSaveData = self.newsReference.child(Dates.DayAndMonth)
        newsSaveData.setValue(saveNews.convertToData())
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewNews(_ sender: Any) {
        let Dates = Date()
        print("\(newsName.text!), \(newsText.text!), \(Dates.DayAndMonth)")
        addNewNews(newsLabel: newsName.text!, newsText: newsText.text!)
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
