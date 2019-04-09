//
//  appInfoVC.swift
//  FireFighters
//
//  Created by Павел on 27/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class appInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var tableViewInfo: UITableView!
    let sectionInfo = ["Информация о приложении","Темная тема","Библиотеки","Создатели"]
    
    
    override func viewDidLayoutSubviews() {
        self.view.darkThemeView()
        appIcon.image = UIImage(named: "iTunesArtwork-1")
        appIcon.layer.masksToBounds = true
        appIcon.layer.cornerRadius = 20
        versionLabel.textAlignment = .center
        versionLabel.darkThemeLabel()
        tableViewInfo.backgroundColor = .clear
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        versionLabel.text = " Версия 0.3.4"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: print("case")
        default: break
        }
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
