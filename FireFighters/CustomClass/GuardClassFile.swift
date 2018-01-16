//
//  GuardClassFile.swift
//  FireFighters
//
//  Created by Павел on 29.12.17.
//  Copyright © 2017 Павел. All rights reserved.
//

import Foundation

struct GuardFunc {
    func Guard1(Guard: Int, userGuard: Int) -> String!{
        var GuardNum: String!
        switch Guard{
            case userGuard: GuardNum = TextLabel.Today.rawValue
            case userGuard + 1: GuardNum = TextLabel.SoonThreeDay.rawValue
            case userGuard + 2 : GuardNum = TextLabel.SoonTwoDay.rawValue
            case userGuard + 3: GuardNum = TextLabel.Tomorrow.rawValue
        default:
            print("error")
        }
        return GuardNum
    }
    func Guard2(Guard: Int, userGuard: Int) -> String!{
        var GuardNum: String!
        switch Guard{
            case userGuard: GuardNum = TextLabel.Today.rawValue
            case userGuard + 1: GuardNum = TextLabel.SoonThreeDay.rawValue
            case userGuard + 2 : GuardNum = TextLabel.SoonTwoDay.rawValue
            case userGuard - 1: GuardNum = TextLabel.Tomorrow.rawValue
        default:
            print("error")
        }
        return GuardNum
    }
    func Guard3(Guard: Int, userGuard: Int) -> String!{
        var GuardNum: String!
        switch Guard{
            case userGuard: GuardNum = TextLabel.Today.rawValue
            case userGuard + 1: GuardNum = TextLabel.SoonThreeDay.rawValue
            case userGuard - 2 : GuardNum = TextLabel.SoonTwoDay.rawValue
            case userGuard - 1: GuardNum = TextLabel.Tomorrow.rawValue
        default:
            print("error")
        }
        return GuardNum
    }
    func Guard4(Guard: Int, userGuard: Int) -> String!{
        var GuardNum: String!
        switch Guard{
            case userGuard: GuardNum = TextLabel.Today.rawValue
            case userGuard - 3: GuardNum = TextLabel.SoonThreeDay.rawValue
            case userGuard - 2 : GuardNum = TextLabel.SoonTwoDay.rawValue
            case userGuard - 1: GuardNum = TextLabel.Tomorrow.rawValue
        default:
            print("error")
        }
        return GuardNum
    }
}
