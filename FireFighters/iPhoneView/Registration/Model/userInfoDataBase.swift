import Foundation
import Firebase

struct userInfoFIR {
    var name: String!
    var patronymic: String!
    var city: String!
    var position: String!
    var partNumb: String!
    var changeNum: NSNumber!
    var birthDay: String!
    var unitType: String!
    var vBallons: NSNumber!
    var aspectRatio: NSNumber!
    var airFlow: NSNumber!
    var gearboxOperation: NSNumber
    var ref: DatabaseReference?
    
    init(Name: String!,Patronymic: String!,City: String!,Position: String!,PartNumb: String!,ChangeNum: NSNumber!,BirthDay: String!,UnitType: String!,vballons: NSNumber!, AspectRatio: NSNumber!, AirFlow: NSNumber!, GearboxOperation: NSNumber!){
        self.name = Name
        self.patronymic = Patronymic
        self.city = City
        self.position = Position
        self.partNumb = PartNumb
        self.changeNum = ChangeNum
        self.birthDay = BirthDay
        self.unitType = UnitType
        self.vBallons = vballons
        self.aspectRatio = AspectRatio
        self.airFlow = AirFlow
        self.gearboxOperation = GearboxOperation
        self.ref = nil
    }
        init(snapshot:DataSnapshot) {
            let snapshotValue = snapshot.value as! [String: AnyObject]
            name = (snapshotValue["name"] as! String)
            patronymic = (snapshotValue["patronymic"] as! String)
            city = (snapshotValue["city"] as! String)
            position = (snapshotValue["position"] as! String)
            partNumb = (snapshotValue["partNumb"] as! String)
            changeNum = (snapshotValue["changeNum"] as! NSNumber)
            birthDay = (snapshotValue["birthDay"] as! String)
            unitType = (snapshotValue["unitType"] as! String)
            vBallons = (snapshotValue["vballons"] as! NSNumber)
            aspectRatio = (snapshotValue["AspectRatio"] as! NSNumber)
            airFlow = (snapshotValue["AirFlow"] as! NSNumber)
            gearboxOperation = snapshotValue["GearboxOperation"] as! NSNumber
            ref = snapshot.ref
        }
    func convertDataBase()-> Any {
        return ["name":name,"patronymic":patronymic, "city":city,"position":position,"partNumb":partNumb,"changeNum":changeNum,"birthDay":birthDay,"unitType":unitType,"vBallons":vBallons, "aspectRatio":aspectRatio,"airFlow":airFlow, "gearboxOperation":gearboxOperation]
    }
}



