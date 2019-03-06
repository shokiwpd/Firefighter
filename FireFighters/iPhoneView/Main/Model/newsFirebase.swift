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
    var numberNews: NSNumber!
    var newsTitle: String!
    var newsText: String!
    var ref: DatabaseReference?
    
    init(NumbNews: NSNumber!, NewsTitle: String!, NewsText: String! ) {
        self.numberNews = NumbNews
        self.newsTitle = NewsTitle
        self.newsText = NewsText
        self.ref = nil
    }
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        numberNews = (snapshotValue["number"] as! NSNumber)
        newsTitle = (snapshotValue["title"] as! String)
        newsText = (snapshotValue["text"] as! String)
        ref = snapshot.ref
    }
    func convertToData()-> Any {
        return ["number":numberNews, "title":newsTitle, "text":newsText]
    }
}
