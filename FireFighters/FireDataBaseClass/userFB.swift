import Foundation
import Firebase

struct Users {
    var AutInfo = Auth.auth().currentUser?.uid
    let uid:String
    let email:String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
