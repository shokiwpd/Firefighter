//
//  DocumentsSelectVC.swift
//  FireFighters
//
//  Created by Павел on 08.12.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import UIKit

class DocumentsSelectVC: UIViewController {
    
    let sectionNumber = 0
        let documentsGDZSAuerType = ["Обязаности Командира звена","Обязаности ГДЗ","Обязаности постового","Первая проверка","Рабочая проверка","Методики расчетов","Приказы","ТТХ Апарата AUER"]
        let documentsGDZSOmegaType = ["Обязаности Командира звена","Обязаности ГДЗ","Обязаности постового","Первая проверка","Рабочая проверка","Методики расчетов","Приказы","ТТХ Апарата OMEGA-1"]
        let documentsGDZSnoType = ["Обязаности Командира звена","Обязаности ГДЗ","Обязаности постового","Первая проверка","Рабочая проверка","Методики расчетов","Приказы"]
    let typeInfo = TypeString.TypeStrings
    //Обязаности Командира звена1 = 1.0.1
    //Обязаности ГДЗ = 1.0
    //Обязаности постового = 1.1
    //Первая проверка Def 1.2.0 Auer 1.2.1 Omega 1.2.2
    //Рабочая проверка Def 1.3.0 Auer 1.3.1 Omega 1.3.2
    //Методики расчетов 1.4
    //Приказ #3 1.5
    //ТТХ Апарата Auer 1.6.0 Omega 1.6.1
    
    let documentSelectedTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    let cellName = "CellNameId"
    
    override func viewWillLayoutSubviews() {
        layoutSettingUI()
        view.viewThemeColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentSelectedTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        documentSelectedTableView.delegate = self
        documentSelectedTableView.dataSource = self
        view.addSubview(documentSelectedTableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCollection), name: NSNotification.Name.init(rawValue: "updateName"), object: nil)
    }
    func layoutSettingUI() {
        documentSelectedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        documentSelectedTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        documentSelectedTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        documentSelectedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    @objc func updateCollection(notif: Notification){
        guard let userInfo = notif.userInfo, let _ = userInfo["Name"] as? String else { return }
        let loadVeiw = DispatchQueue.main
        loadVeiw.async {
            self.documentSelectedTableView.reloadData()
        }
    }
    @objc func DarkNotification(notif: Notification) {
        guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
        if Dark != "" {
            let mainViewReload = DispatchQueue.main
                mainViewReload.async {
                self.view.viewThemeColor()
            }
        }
    }

   

}
extension DocumentsSelectVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var returnInt = 0
        switch typeInfo.nameType {
            case "AUER":returnInt = documentsGDZSAuerType.count
            case "ОМЕГА":returnInt = documentsGDZSOmegaType.count
            case "Прочие":returnInt = documentsGDZSnoType.count
        default: break
        }
        return returnInt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath as IndexPath)
        cell.textLabel?.darkThemeLabel()
        switch typeInfo.nameType {
            case "AUER": cell.textLabel!.text = documentsGDZSAuerType[indexPath.row]
            case "ОМЕГА": cell.textLabel!.text = documentsGDZSOmegaType[indexPath.row]
            case "Прочие": cell.textLabel!.text = documentsGDZSnoType[indexPath.row]
        default: break
        }
        cell.backgroundColor = .clear
        return cell
    }


    
    
}
extension DocumentsSelectVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DocView = documentsVC()
        switch indexPath.row {
        case 0:
            DocView.filesName = "1.0.1"
            DocView.typeOpen = "PDF"
        case 1:
            DocView.filesName = "1.0"
            DocView.typeOpen = "PDF"
        case 2:
            DocView.filesName = "1.1"
            DocView.typeOpen = "PDF"
        case 3:
            switch typeInfo.nameType {
                case "AUER":
                    DocView.filesName = "1.2.1"
                    DocView.typeOpen = "PDF"
                case "ОМЕГА":
                    DocView.filesName = "1.2.2"
                    DocView.typeOpen = "PDF"
                case "Прочие":
                    DocView.filesName = "1.2.0"
                    DocView.typeOpen = "PDF"
            default: break
            }
        case 4:
            switch typeInfo.nameType {
                case "AUER":
                    DocView.filesName = "1.3.1"
                    DocView.typeOpen = "PDF"
                case "ОМЕГА":
                    DocView.filesName = "1.3.2"
                    DocView.typeOpen = "PDF"
                case "Прочие":
                    DocView.filesName = "1.3.0"
                    DocView.typeOpen = "PDF"
            default: break
            }
        case 5:
            DocView.filesName = "1.4"
            DocView.typeOpen = "PDF"
        case 6:
            DocView.filesName = "1.5"
            DocView.typeOpen = "PDF"
        case 7:
            switch typeInfo.nameType {
                case "AUER":
                    DocView.filesName = "1.6.0"
                    DocView.typeOpen = "PDF"
                case "ОМЕГА":
                    DocView.filesName = "1.6.1"
                    DocView.typeOpen = "PDF"
            default: break
            }
        default: break
        }
        self.navigationController?.pushViewController(DocView, animated: true)
    }
    
}
