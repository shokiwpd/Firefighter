//
//  CalculationsFile.swift
//  FireFighters
//
//  Created by Павел on 09.02.18.
//  Copyright © 2018 Павел. All rights reserved.
class calculations {
    //Рабочие данные пожарных
    let calculateCoreData = UserProfile.userInform
    lazy var P1 = 0//Пожарный 1
    lazy var P2 = 0//Пожарный 2
    lazy var P3 = 0//Пожарный 3
    lazy var P4 = 0//Пожарный 4
    lazy var P5 = 0//Пожарный 5
        lazy var P1Hearth = 0// Пожарный 1
        lazy var P2Hearth = 0//Пожарный 2
        lazy var P3Hearth = 0//Пожарный 3
        lazy var P4Hearth = 0//Пожарный 4
        lazy var P5Hearth = 0//Пожарный 5
    //Значения для CoreData
    lazy var V = calculateCoreData.userVBallons
    lazy var Kszh = calculateCoreData.userAspectRatio             // Коэффициент сжимаемости воздуха +
    lazy var Q = calculateCoreData.userAirFlow               // средний расход воздуха
    lazy var Pust = calculateCoreData.userGearboxOperation              //Pуст.раб
    var Hearth = false
    var Complexity = false
    //для вывода данных
    var Pmax:Int! // Максимальное падение воздуха
    var Tall:Int! // Общее время работы
    var Pkexit: Int! // Давление при котором надо выходить
    var Twork: Int! // Время работы
    var THearthWork: Int!// Время работы у очага
    var PkexitH: Int! // Контрольное давление при котором надо выходить при котором надо выходить
    //----//---//-------
    func CalculationTwoFireFighter(){
        let Pmin = [P1,P2].min()!
        
        //--------//------
        switch Complexity {
        case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            
        case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pkexit)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
        if Hearth == true {
            let P1pad = P1 - P1Hearth
            let P2pad = P2 - P2Hearth
            let PPadMax = [P1pad,P2pad].max()!
            let PminHearth = [P1Hearth,P2Hearth].min()!
            switch Complexity {
                case true: PkexitH = 2*PPadMax + Pust
                case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
            }
            THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
        }
    }
    func CalculationThreeFireFighter(){
        let Pmin = [P1,P2,P3].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pkexit)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
        let P1pad = P1 - P1Hearth
        let P2pad = P2 - P2Hearth
        let P3pad = P3 - P3Hearth
        
        let PPadMax = [P1pad,P2pad,P3pad].max()!
        let PminHearth = [P1Hearth,P2Hearth,P3Hearth]
        switch Complexity {
        case true: PkexitH = 2*PPadMax + Pust
        case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth.min()!-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
    func CalculationFourFireFighter(){
        let Pmin = [P1,P2,P3,P4].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pkexit)*V)/Int(Double(Q*Kszh))
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q*Kszh))// Общее время работы
        //-------/-------------//
        let P1pad = P1 - P1Hearth
        let P2pad = P2 - P2Hearth
        let P3pad = P3 - P3Hearth
        let P4pad = P4 - P4Hearth
        
        let PPadMax = [P1pad,P2pad,P3pad,P4pad].max()!
        let PminHearth = [P1Hearth,P2Hearth,P3Hearth,P4Hearth].min()!
        switch Complexity {
        case true: PkexitH = 2*PPadMax + Pust
        case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
    func CalculationFiveFireFighter(){
        let Pmin = [P1,P2,P3,P4,P5].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pkexit)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
        let P1pad = P1 - P1Hearth
        let P2pad = P2 - P2Hearth
        let P3pad = P3 - P3Hearth
        let P4pad = P4 - P4Hearth
        let P5pad = P5 - P5Hearth
        
        let PPadMax = [P1pad,P2pad,P3pad,P4pad,P5pad].max()!
        let PminHearth = [P1Hearth,P2Hearth,P3Hearth,P4Hearth,P5Hearth].min()!
        switch Complexity {
        case true: PkexitH = 2*PPadMax + Pust
        case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
}

