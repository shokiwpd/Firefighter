//
//  CalculationsFile.swift
//  FireFighters
//
//  Created by Павел on 09.02.18.
//  Copyright © 2018 Павел. All rights reserved.
import Foundation
class newCalc {
    //При входе в НДДС
    let calcDataBase = UserProfile.userInform
    var FF1 = 0
    var FF2 = 0
    var FF3 = 0
    var FF4 = 0
    var FF5 = 0
    //При нахождении очага
        var FF1_h = 0
        var FF2_h = 0
        var FF3_h = 0
        var FF4_h = 0
        var FF5_h = 0
    //Данные из БД
        let vBallons = UserProfile.userInform.userVBallons
        let compressionFactor = UserProfile.userInform.userAspectRatio// calcDataBase.userAspectRatio
        let airFlow = UserProfile.userInform.userAirFlow// calcDataBase.userAirFlow
        let reducerPressure = UserProfile.userInform.userGearboxOperation// = calcDataBase.userGearboxOperation
    //Данные для решения
            var hearth = false
            var complexity = false
    //Итоговые данные без очага
        var pMinAir = 0
        var pMaxDown = 0 // Максимальное падение
        var pExit = 0 // Давление выхода
        var tExit = 0 // Время работы до очага
        var tSignal = "" // Время подачи сигнала
        var tAllExit = 0 // Общее время работы
        var allTimeWork = "" // Время возвращения звена
    //Итоговые данные с очагом
            var pMinAirHearth = 0 // Минимальное у очага
            var pMaxDownHearth = 0 // Максимальное потраченое давление до очага
            var pExitHearth = 0 // Давление воздуха при котором надо уходить от очага
            var tWorkHearth = 0 // Время работы у очага
            var tBackHearth = "" // Время подчи сигнала на возвращение
    
    func calculationWork(FFint: Int){
        
        switch FFint{
            case 2: pMinAir = [FF1,FF2].min()!
            case 3: pMinAir = [FF1,FF2,FF3].min()!
            case 4: pMinAir = [FF1,FF2,FF3,FF4].min()!
            case 5: pMinAir = [FF1,FF2,FF3,FF4,FF5].min()!
        default: break
        }
        print("Минимальное давление при входе \(pMinAir)")// Минимальное давление при входе
        
        
        switch complexity {
        case true: pMaxDown = (pMinAir - reducerPressure) / 3
        print("Макисмальное падение воздуха \(pMaxDown)") // Макисмальное падение воздуха
        case false: pMaxDown = Int(Double(pMinAir - reducerPressure) / 2.5)
        print("Макисмальное падение воздуха \(pMaxDown)") // Макисмальное падение воздуха
        }
        
        pExit = pMinAir - pMaxDown
        print("Давление выхода \(pExit)") // Давление выхода
        
        tExit = Int(Double(pMaxDown) * vBallons) / Int((airFlow * compressionFactor))
        print("Время работы без очага \(tExit)") // Время работы без очага
        
        tAllExit = Int((Double(pMinAir - reducerPressure) * vBallons)) / Int((airFlow * compressionFactor))
        print("Общее время работы \(tAllExit)") // Общее время работы
        
        switch FFint {
        case 2:
            let p1MaxDown = FF1 - FF1_h
            let p2MaxDown = FF2 - FF2_h
            pMinAirHearth = [FF1_h, FF2_h].min()!
            pMaxDownHearth = [p1MaxDown,p2MaxDown].max()!
        case 3:
            let p1MaxDown = FF1 - FF1_h
            let p2MaxDown = FF2 - FF2_h
            let p3MaxDown = FF3 - FF3_h
            pMinAirHearth = [FF1_h, FF2_h,FF3_h].min()!
            pMaxDownHearth = [p1MaxDown,p2MaxDown,p3MaxDown].max()!
        case 4:
            let p1MaxDown = FF1 - FF1_h
            let p2MaxDown = FF2 - FF2_h
            let p3MaxDown = FF3 - FF3_h
            let p4MaxDown = FF4 - FF4_h
            pMinAirHearth = [FF1_h, FF2_h,FF3_h,FF4_h].min()!
            pMaxDownHearth = [p1MaxDown,p2MaxDown,p3MaxDown,p4MaxDown].max()!
        case 5:
            let p1MaxDown = FF1 - FF1_h
            let p2MaxDown = FF2 - FF2_h
            let p3MaxDown = FF3 - FF3_h
            let p4MaxDown = FF4 - FF4_h
            let p5MaxDown = FF5 - FF5_h
            pMinAirHearth = [FF1_h, FF2_h,FF3_h,FF4_h,FF5_h].min()!
            pMaxDownHearth = [p1MaxDown,p2MaxDown,p3MaxDown,p4MaxDown,p5MaxDown].max()!
        default: break
        }
        print("Минимальное у очага \(pMinAirHearth)")
        print("Максимальное затраченое к очагу \(pMaxDownHearth)")
        
        switch complexity {
        case true:
            pExitHearth = 2 * pMaxDownHearth + reducerPressure
            if pExitHearth < 50 {
                pExitHearth = 50
            }
        case false:
            pExitHearth = Int(1.5 * Double(pMaxDownHearth) + Double(reducerPressure))
            if pExitHearth < 50 {
                pExitHearth = 50
            }
        }
        print("Давление при котором надо выходить при найденом очаге \(pExitHearth)")
        
            tWorkHearth = Int(Double(Double(pMinAirHearth - pExitHearth) * vBallons) / Double(airFlow * compressionFactor))
        
        print("Время раюоты у очага \(tWorkHearth)")
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
