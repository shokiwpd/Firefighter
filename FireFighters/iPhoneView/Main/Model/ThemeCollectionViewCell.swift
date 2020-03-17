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
        backgroundColor = .white
        
        addSubview(titleNews)
        addSubview(infoNews)

        titleNews.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        titleNews.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleNews.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true

        infoNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor).isActive = true
        infoNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        infoNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        infoNews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        infoNews.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 15
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
