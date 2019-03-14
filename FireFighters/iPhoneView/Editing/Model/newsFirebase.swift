//
//  newsFirebase.swift
//  FireFighters
//
//  Created by Павел on 06/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import Foundation
import Firebase
struct newsSave {
    var newsTitle: String!
    var newsText: String!
    var ref: DatabaseReference?
    
    init(NewsTitle: String!, NewsText: String! ) {
        self.newsTitle = NewsTitle
        self.newsText = NewsText
        self.ref = nil
    }
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        newsTitle = (snapshotValue["title"] as! String)
        newsText = (snapshotValue["text"] as! String)
        ref = snapshot.ref
    }
    func convertToData()-> Any {
        return ["title":newsTitle, "text":newsText]
    }
}
