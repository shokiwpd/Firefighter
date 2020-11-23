//
//  ThemeCollectionViewCell.swift
//  FireFighters
//
//  Created by Павел on 18/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
//    static let cellID = "ThemeCollectionViewCell"
//
//    let backgroundImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = UIColor.white
//        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = 10
//        return image
//    }()
//    let nameTheme: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.CellLabelName(viewHeight: Double(UIScreen.main.bounds.height))
//        return label
//    }()
//    let optionalLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.CellLabelOptional(viewHeight: Double(UIScreen.main.bounds.height))
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        addSubview(backgroundImage)
//        addSubview(nameTheme)
//        addSubview(optionalLabel)
//        backgroundColor = .white
//        //-- Image constraint
//        //-- Name constraint
//        nameTheme.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        nameTheme.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
//        nameTheme.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
//        //-- Optional constraint
//        optionalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        optionalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
//        optionalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
//        optionalLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
//
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = 10
//        self.layer.shadowRadius = 9
//        layer.shadowOpacity = 0.3
//        layer.shadowOffset = CGSize(width: 5, height: 8)
//        self.clipsToBounds = false
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    static let cellID = "ThemeCollectionViewCell"
    
    let titleNews:UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let infoNews:UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        
        //Color cell

        //add Color
        addSubview(titleNews)
        addSubview(infoNews)
        //title constraint
        titleNews.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleNews.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        //info constraint
        infoNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor).isActive = true
        infoNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        infoNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        infoNews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
            NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
        titleNews.darkThemeLabel()
        infoNews.darkThemeLabel()
        cellThemeColor()
        settingCell()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settingCell()
    }
    func settingCell(){
        layer.cornerRadius = 10
        shadow()

    }
    func shadow(){
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        layer.shadowRadius = 15
    }
    @objc func testMassage(){
        print("Massage")
    }
        @objc func DarkNotification(notif: Notification) {
            guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
            if Dark != "" {
                let mainViewReload = DispatchQueue.main
                    mainViewReload.async {
                self.titleNews.darkThemeLabel()
                self.infoNews.darkThemeLabel()
                self.cellThemeColor()
                self.settingCell()
                }
            }
        }

}
