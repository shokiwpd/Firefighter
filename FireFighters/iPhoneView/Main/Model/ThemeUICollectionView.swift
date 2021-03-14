//
//  ThemeUICollectionView.swift
//  FireFighters
//
//  Created by Павел on 18/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit
class ThemeUICollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        weak var RootViewController: UIViewController?

    var newsCell = ["Что дальше?","Новый дизайн","Всё с нуля!","Вы делаете приложение"]
    var titleCell = ["Немного интересной информации о будущем Огнеборцев. И о роли приложений в пожарной охране ","Новый дизайн упрощает работу с приложением. Взгляните что нового появилось в нашем приложении","Полностью с нуля! Что изменилось и что ещё будет", "Вступите в нашу группу в социальной сети Вконтакте и решите что стоит внести ещё и что будет лишним"]
    
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
        case 0:
            VC.filesName = "https://vk.com/@firefighterapp-chto-dalshe"
            VC.typeOpen = "Web"
        case 1:
            VC.filesName = "https://vk.com/@firefighterapp-novyi-dizain"
            VC.typeOpen = "Web"
        case 2:
            VC.filesName = "https://vk.com/@firefighterapp-vse-s-nulya"
            VC.typeOpen = "Web"
        case 3:
            VC.filesName = "https://vk.com/@firefighterapp-vy-delaete-prilozhenie"
            VC.typeOpen = "Web"
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
