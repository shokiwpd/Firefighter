//
//  ThemeUICollectionView.swift
//  FireFighters
//
//  Created by Павел on 18/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit
class ThemeUICollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var themeCell = [ThemeModel]()
    var textLabel = textDocuments()
    weak var RootViewController: UIViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = UIColor.clear
        delegate = self
        dataSource = self
        register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.cellID)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = ConstantCell.minimumLine
        contentInset = UIEdgeInsets(top: 15, left: ConstantCell.leftToView, bottom: 40, right: ConstantCell.rightToView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false 
    }
    func setTheme(cells: [ThemeModel]) {
        self.themeCell = cells
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeCell.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.cellID, for: indexPath) as! ThemeCollectionViewCell
        cell.nameTheme.text = themeCell[indexPath.row].nameTheme
        cell.optionalLabel.text = themeCell[indexPath.row].optionaltext
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ConstantCell.cellWidth, height: frame.height * 0.8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = documentsVC()
        documentsView(cases: indexPath.row)
    }
    func documentsView(cases: Int){
        let VC = UIStoryboard.init(name: "DocumentsStoryboard", bundle: nil).instantiateInitialViewController() as! documentsVC
        switch cases {
        case 0:
            VC.textDocumentation = textLabel.firstCheckText!
        case 1:
            VC.textDocumentation = textLabel.workCheckText!
        case 2:
            VC.textDocumentation = textLabel.chargePoinstsmanText!
        case 3:
            VC.textDocumentation = textLabel.fireFightersChangeText!
        default: break
        }
        RootViewController?.present(VC, animated:  true, completion: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

