//
//  userFB.swift
//  FireFighters
//
//  Created by Павел on 20.01.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import Firebase

struct Users {
    let uid:String
    let email:String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
