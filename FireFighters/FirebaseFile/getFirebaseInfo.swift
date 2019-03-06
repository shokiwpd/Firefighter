//
//  getFirebaseInfo.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import Firebase

protocol getTockenUser {
}
extension getTockenUser {
    var userTocken: String? {
        return (Auth.auth().currentUser?.uid)
    }
    var imageReference: StorageReference {
        return Storage.storage().reference().child("userPhoto")
    }
    var DataReference: DatabaseReference {
        return Database.database().reference(withPath: "firefighter")
    }
    var newsReference: DatabaseReference {
        return Database.database().reference(withPath: "news")
    }
    var updateDataInfo: Void {
        return self.DataReference.child(userTocken!).updateChildValues(["city": "editString"])
    }
}

enum FirebaseData {
    case create
    
    case delete
    
    case update
}
