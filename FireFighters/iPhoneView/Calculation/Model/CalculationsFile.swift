//
//  CalculationsFile.swift
//  FireFighters
//
//  Created by Павел on 09.02.18.
//  Copyright © 2018 Павел. All rights reserved.
import Foundation
class calculationAir {
    //Рабочие данные пожарных
    let calculateCoreData = UserProfile.userInform
    lazy var P1 = 0//Пожарный 1
    lazy var P2 = 0//Пожарный 2
    lazy var P3 = 0//Пожарный 3
    lazy var P4 = 0//Пожарный 4
    lazy var P5 = 0//Пожарный 5
        lazy var P1Hearth = 0//Пожарный у очага 1
        lazy var P2Hearth = 0//Пожарный у очага  2
        lazy var P3Hearth = 0//Пожарный у очага  3
        lazy var P4Hearth = 0//Пожарный у очага  4
        lazy var P5Hearth = 0//Пожарный у очага  5
    //Значения для CoreData
    lazy var V = calculateCoreData.userVBallons//Объем баллона
    lazy var Kszh = calculateCoreData.userAspectRatio// Коэффициент сжимаемости воздуха +
    lazy var Q = calculateCoreData.userAirFlow// средний расход воздуха
    lazy var Pust = calculateCoreData.userGearboxOperation//Давление для стабильной работы редуктора
    var Hearth = false // очаг
    var Complexity = false // Сложная степень
    //для вывода данных
    var Pmax:Int! // Максимальное падение воздуха
    var Tall:Int! // Общее время работы P.12
    var Pkexit: Int! // Давление при котором надо выходить P.10
    var Twork: Int! // Время работы P.11
    var THearthWork: Int!// Время работы у очага
    var PkexitH: Int! // Контрольное давление при котором надо выходить при котором надо выходить
    var Pmin = Int() // Минимальное давление в баллонах
    var PPadMax = Int() // Максимальное падение
    var PminHearth = Int() // Давление у очага
    //----//---//-------
    
    func CalculationTwoFireFighter(){ //------2 Пожарных---------
        Pmin = [P1,P2].min()!
        //--------//------
        switch Complexity {
        case false: Pmax = Int(Double(Pmin - Pust)/2.5)
        case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pmax)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
        if Hearth == true {
            let P1pad = P1 - P1Hearth
            let P2pad = P2 - P2Hearth
            PPadMax = [P1pad,P2pad].max()!
            PminHearth = [P1Hearth,P2Hearth].min()!
            switch Complexity {
                case true: PkexitH = 2*PPadMax + Pust
                case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
            }
            THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
        }
    }
    
    func CalculationThreeFireFighter(){//-------3 Пожарных------
         Pmin = [P1,P2,P3].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pmax)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
        let P1pad = P1 - P1Hearth
        let P2pad = P2 - P2Hearth
        let P3pad = P3 - P3Hearth
        
        PPadMax = [P1pad,P2pad,P3pad].max()!
        PminHearth = [P1Hearth,P2Hearth,P3Hearth].min()!
        switch Complexity {
            case true: PkexitH = 2*PPadMax + Pust
            case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
    
    func CalculationFourFireFighter(){//---------4 Пожарных----------
         Pmin = [P1,P2,P3,P4].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pmax)*V)/Int(Double(Q*Kszh))
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q*Kszh))// Общее время работы
        //-------/-------------//
        let P1pad = P1 - P1Hearth
        let P2pad = P2 - P2Hearth
        let P3pad = P3 - P3Hearth
        let P4pad = P4 - P4Hearth
        
        PPadMax = [P1pad,P2pad,P3pad,P4pad].max()!
        PminHearth = [P1Hearth,P2Hearth,P3Hearth,P4Hearth].min()!
        switch Complexity {
            case true: PkexitH = 2*PPadMax + Pust
            case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
    func CalculationFiveFireFighter(){//--------5 Пожарных-----------
         Pmin = [P1,P2,P3,P4,P5].min()!
        //--------//------
        switch Complexity {
            case false: Pmax = Int(Double(Pmin - Pust)/2.5)
            case true: Pmax = (Pmin - Pust)/3
        }
        Pkexit = Pmin - Pmax
        if Pkexit < 50 {
            Pkexit = 50
        }
        Twork = Int(Double(Pmax)*V)/Int(Double(Q)*Kszh)
        //-------/--------------//
        Tall = Int(Double(Pmin - Pust)*V)/Int(Double(Q)*Kszh)// Общее время работы
        //-------/-------------//
            let P1pad = P1 - P1Hearth
            let P2pad = P2 - P2Hearth
            let P3pad = P3 - P3Hearth
            let P4pad = P4 - P4Hearth
            let P5pad = P5 - P5Hearth
        
        PPadMax = [P1pad,P2pad,P3pad,P4pad,P5pad].max()!
        PminHearth = [P1Hearth,P2Hearth,P3Hearth,P4Hearth,P5Hearth].min()!
        switch Complexity {
            case true: PkexitH = 2*PPadMax + Pust
            case false:  PkexitH = Int(1.5*Double(PPadMax)) + Pust
        }
        THearthWork = Int(Double(PminHearth-PkexitH)*V)/Int(Double(Q)*Kszh)
    }
    func calculationsTime(time: Date, toTime: Int)-> String!{
        let TimeConvert = Double(Int(time.timeIntervalSince1970) + (toTime * 60))
        let resultTime = Date(timeIntervalSince1970: TimeConvert)
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "HH:mm"
        let stringTime = timeFormat.string(from: resultTime)
        return stringTime
    }
}

