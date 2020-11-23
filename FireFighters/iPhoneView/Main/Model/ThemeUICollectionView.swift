//
//  ThemeUICollectionView.swift
//  FireFighters
//
//  Created by Павел on 18/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit
class ThemeUICollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    var themeCell = [ThemeModel]()
//    weak var RootViewController: UIViewController?
//
//    let PDFfileAUER = ["first_Check_AUER","work_Check_AUER","type_info_AUER MSA"]
//    let PDFfileOMEGA = ["first_Check_OMEGA","work_Check_OMEGA","type_info_Omega"]
//    let PDFfileDef = ["defaultFireChek","defaultWorkChek"]
//    let OtherPDFfile = ["chargePoinstsman", "fireFightersChange", "prikaz_3"]
//
//    init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        super.init(frame: .zero, collectionViewLayout: layout)
//        backgroundColor = UIColor.clear
//        delegate = self
//        dataSource = self
//        register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.cellID)
//        translatesAutoresizingMaskIntoConstraints = false
//        layout.minimumLineSpacing = ConstantCell.minimumLine
//        contentInset = UIEdgeInsets(top: 15, left: ConstantCell.leftToView, bottom: 40, right: ConstantCell.rightToView)
//        showsHorizontalScrollIndicator = false
//        showsVerticalScrollIndicator = false
//        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "updateName"), object: nil)
//    }
//    //-
//    func setTheme(cells: [ThemeModel]) {
//        self.themeCell = cells
//    }
//    @objc func DarkNotification(notif: Notification) {
//        guard let userInfo  = notif.userInfo, let _ = userInfo["Name"] as? String else { return }
//        let loadVeiw = DispatchQueue.main
//        loadVeiw.async {
//            ThemeCollectionViewCell()
//        }
//    }
//    //-
//    func refresh(){
//        self.reloadData()
//
//    }
//    //-
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return themeCell.count
//    }
//    //-
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.cellID, for: indexPath) as! ThemeCollectionViewCell
//        cell.nameTheme.text = themeCell[indexPath.row].nameTheme
//        cell.optionalLabel.text = themeCell[indexPath.row].optionaltext
//        return cell
//    }
//    //-
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ConstantCell.cellWidth, height: frame.height * 0.8)
//    }
//    //-
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        _ = documentsVC()
//        documentsView(cases: indexPath.row)
//    }
//    //-
//    func documentsView(cases: Int){
//        let VC = UIStoryboard.init(name: "DocumentsStoryboard", bundle: nil).instantiateInitialViewController() as! documentsVC
//        let TypeName = TypeString.TypeStrings
//        var fileNumber: Int!
//        if TypeName.nameType == "AUER"{ fileNumber = 0 } else if TypeName.nameType == "ОМЕГА" { fileNumber = 1 } else { fileNumber = 2}
//        if TypeName.nameType != "Прочие" {
//        switch cases {
//            case 0:if fileNumber == 0{VC.filesName = PDFfileAUER[0]} else {VC.filesName = PDFfileOMEGA[0]}
//            case 1:if fileNumber == 0{VC.filesName = PDFfileAUER[1]} else {VC.filesName = PDFfileOMEGA[1]}
//            case 2:if fileNumber == 0{VC.filesName = PDFfileAUER[2]} else {VC.filesName = PDFfileOMEGA[2]}
//            case 3:VC.filesName = OtherPDFfile[0]
//            case 4:VC.filesName = OtherPDFfile[1]
//            case 5:VC.filesName = OtherPDFfile[2]
//            default: break
//            }
//    } else {
//        switch cases {
//            case 0:VC.filesName = PDFfileDef[0]
//            case 1:VC.filesName = PDFfileDef[1]
//            case 2:VC.filesName = OtherPDFfile[0]
//            case 3:VC.filesName = OtherPDFfile[1]
//            case 4:VC.filesName = OtherPDFfile[2]
//            default: break
//            }
//        }
//        RootViewController?.present(VC, animated:  true, completion: nil)
//    }
//    //-
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
        weak var RootViewController: UIViewController?

    var newsCell = ["Новые расчеты","Новый дизайн","Всё с нуля!","Вы делаете приложение"]
    var titleCell = ["Новый вид расчетов. Теперь вы можете производить расчет как при решении билетов, так и на пожаре(учениях)","Новый дизайн упрощает работу с приложением. Взгляните что нового появилось в нашем приложении","Полностью с нуля! Что изменилось и что ещё будет", "Вступите в нашу группу в социальной сети Вконтакте и решите что стоит внести ещё и что будет лишним"]
    
    init(){
        let layautCollectionView = UICollectionViewFlowLayout()
        layautCollectionView.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layautCollectionView)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        //
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        //
        register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.cellID )
        translatesAutoresizingMaskIntoConstraints = false
        layautCollectionView.minimumLineSpacing = 20
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCell.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        operUrl(cellInt: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.cellID, for: indexPath) as! ThemeCollectionViewCell
        cell.titleNews.text = newsCell[indexPath.row]
        cell.infoNews.text = titleCell[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(frame.width * 0.8), height: Int(frame.width * 0.8))//Int(frame.height * 0.5))
    }
    func operUrl(cellInt: Int) {
        let VC = documentsVC()
        switch cellInt {
        case 0: VC.filesName = "https://vk.com/@firefighterapp-novye-raschety"
        case 1: VC.filesName = "https://vk.com/@firefighterapp-novyi-dizain"
        case 2: VC.filesName = "https://vk.com/@firefighterapp-vse-s-nulya"
        case 3: VC.filesName = "https://vk.com/@firefighterapp-vy-delaete-prilozhenie"
        default:
            print(cellInt)
        }
        RootViewController?.navigationController?.pushViewController(VC, animated: true)//.present(VC, animated:  true, completion: nil)
    }
    
}

//URL_VK_STATE

//vk.com/@firefighterapp-novye-raschety
//vk.com/@firefighterapp-novyi-dizain
//vk.com/@firefighterapp-vse-s-nulya
//vk.com/@firefighterapp-vy-delaete-prilozhenie
