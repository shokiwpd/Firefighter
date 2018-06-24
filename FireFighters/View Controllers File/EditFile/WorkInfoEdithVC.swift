//
//  WorkInfoEdithVC.swift
//  FireFighters
//
//  Created by Павел on 11.05.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import Firebase

class WorkInfoEdithVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, getTockenUser {
    @IBOutlet weak var PartNumberEdit: UITextField!
    @IBOutlet weak var GuardEdit: UITextField!
    @IBOutlet weak var PositionEdit: UIPickerView!
    @IBOutlet weak var ApparatusEdit: UISegmentedControl!
    @IBOutlet weak var VballonsEdit: UITextField!
    @IBOutlet weak var coefficientEdit: UITextField!
    @IBOutlet weak var AirFlowEdith: UITextField!
    @IBOutlet weak var GearBoxEdit: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    let CoreDataInfo = UserProfile()
    var CustomClass = UICustomClass()
    let PositionSel = ["Пожарный","Командир отделения","Нач.караула","ПНЧ","Диспетчер"]
    var PositionName: String!    
    var buttonGardients: CAGradientLayer! {
        didSet {
            buttonGardients.gradientsColor()
        }
    }
    override func viewDidLayoutSubviews() {
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        buttonGardients = CAGradientLayer()
        buttonGardients.frame = CGRect(x: 0, y: 0, width: saveButton.frame.size.width, height: saveButton.frame.size.height)
        saveButton.layer.insertSublayer(buttonGardients, at: 0)
        saveButton.customButtonColor(radius: 10, nameBut: "Сохранить изменения", titleColor: UIColor.black, shadowColors: UIColor.black.cgColor)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PositionSel.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PositionSel[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PositionName = PositionSel[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard userTocken != "" else { return }
        PartNumberEdit.text = CoreDataInfo.userPartNum// partNumb
        GuardEdit.text = String(CoreDataInfo.userChange) //changeNum
        PositionName = CoreDataInfo.userPosition
        ApparatusEdit.selectedSegmentIndex = getSegmentNum()  //getSegmentNum()
        PositionEdit.selectRow(getPickerNum(), inComponent: 0, animated: true)
        VballonsEdit.text = String(CoreDataInfo.userVBallons)//vBallons
        coefficientEdit.text = String(CoreDataInfo.userAspectRatio)//aspectRatio
        AirFlowEdith.text = String(CoreDataInfo.userAirFlow)//airFlow
        GearBoxEdit.text = String(CoreDataInfo.userGearboxOperation)//gearboxOperation
        
        }
    func selUnitType(type: UISegmentedControl) -> String!{
        var types = ""
        switch type.selectedSegmentIndex {
        case 0: types = "ДАСВ"
        case 1: types = "ДАСК"
        default:
            print("Errors")
        }
        return types
    }

    @IBAction func saveEditInfo(_ sender: Any) {
        editInform(part: PartNumberEdit.text!, Guard: Int(GuardEdit.text!)!,VBal: Double(VballonsEdit.text!)!, Aspect: Double(coefficientEdit.text!)!, Air: Double(AirFlowEdith.text!)!, GB: Int(GearBoxEdit.text!)!,posit: PositionName, typeSel: selUnitType(type: ApparatusEdit))
        dismiss(animated: true, completion: nil)
    }
    func getPickerNum()->Int {
        var ret: Int!
        switch CoreDataInfo.userPosition {
        case "Пожарный":
            ret = 0
        case "Командир отделения":
            ret = 1
        case "Нач.караула":
            ret = 2
        case "ПНЧ":
            ret = 3
        case "Диспетчер":
            ret = 4
        default: break
        }
        return ret
    }
    func getSegmentNum()->Int {
        var ret: Int!
        switch CoreDataInfo.userUnitType {
        case "ДАСВ":
            ret = 0
        case "ДАСК":
            ret = 1
        default: break
        }
        return ret
    }
    func editInform(part: String, Guard: Int,VBal: Double, Aspect: Double, Air: Double,GB: Int, posit: String, typeSel: String) {
        if CoreDataInfo.userPartNum != part {
            self.DataReference.child(userTocken!).updateChildValues(["partNumb": part])
            CoreDataInfo.userPartNum = part}
        if CoreDataInfo.userChange != Guard {
           self.DataReference.child(userTocken!).updateChildValues(["changeNum": Guard])
            CoreDataInfo.userChange = Guard}
        if CoreDataInfo.userVBallons != VBal {
            self.DataReference.child(userTocken!).updateChildValues(["vBallons": VBal])
            CoreDataInfo.userVBallons = VBal}
        if CoreDataInfo.userAspectRatio != Aspect{
            self.DataReference.child(userTocken!).updateChildValues(["aspectRatio": Aspect])
            CoreDataInfo.userAspectRatio = Aspect}
        if CoreDataInfo.userAirFlow != Air{
            self.DataReference.child(userTocken!).updateChildValues(["airFlow": Air])
            CoreDataInfo.userAirFlow = Air}
        if CoreDataInfo.userGearboxOperation != GB{
            self.DataReference.child(userTocken!).updateChildValues(["gearboxOperation": GB])
            CoreDataInfo.userGearboxOperation = GB}
        if CoreDataInfo.userPosition != posit {
            self.DataReference.child(userTocken!).updateChildValues(["position": posit])
            CoreDataInfo.userPosition = posit}
        if CoreDataInfo.userUnitType != typeSel {
            self.DataReference.child(userTocken!).updateChildValues(["unitType": typeSel])
            CoreDataInfo.userUnitType = typeSel}
    }
}

