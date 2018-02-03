import Foundation
import Firebase

struct userInfoFIR {
    var userID: String!
    var name: String!
    var patronymic: String!
    var city: String!
    var position: String!
    var partNumb: String!
    var changeNum: NSNumber!
    var birthDay: String!
    var unitType: String!
    var ref: DatabaseReference?
    
    init(UsersID: String!,Name: String!,Patronymic: String!,City: String!,Position: String!,PartNumb: String!,ChangeNum: NSNumber!,BirthDay: String!,UnitType: String!){
        self.userID = UsersID
        self.name = Name
        self.patronymic = Patronymic
        self.city = City
        self.position = Position
        self.partNumb = PartNumb
        self.changeNum = ChangeNum
        self.birthDay = BirthDay
        self.unitType = UnitType
        self.ref = nil
    }
        init(snapshot:DataSnapshot) {
            let snapshotValue = snapshot.value as! [String: AnyObject]
            userID = snapshotValue["userID"] as! String
            name = snapshotValue["name"] as! String
            patronymic = snapshotValue["patronymic"] as! String
            city = snapshotValue["city"] as! String
            position = snapshotValue["position"] as! String
            partNumb = snapshotValue["partNumb"] as! String
            changeNum = snapshotValue["changeNum"] as! NSNumber
            birthDay = snapshotValue["birthDay"] as! String
            unitType = snapshotValue["unitType"] as! String
            ref = snapshot.ref
        }
    func convertDataBase()-> Any {
        return ["name":name,"patronymic":patronymic, "city":city,"position":position,"partNumb":partNumb,"changeNum":changeNum,"birthDay":birthDay,"unitType":unitType]
    }
}
