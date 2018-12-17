//
//  CustomString.swift
//  FireFighters
//
//  Created by Павел on 07.06.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
import Firebase

extension String {
    var forrmated: String {
        return self.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
    }
    var forrmater_text: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    var dataFormat: String {
        return self.replacingOccurrences(of: ":", with: ".", options: .literal, range: nil)
    }
}

