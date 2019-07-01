//
//  resultTextFile.swift
//  FireFighters
//
//  Created by Павел on 25.04.2018.
//  Copyright © 2018 Павел. All rights reserved.
//

import Foundation
class resultText {
    func isNoFound(Pexit:Int,delT:String,approximateTimeExit: String) -> String!{
        
        _ = """
            П ПАДЕНИЯ = затрачено к месту
            Контрольное давление, при котором необходимо выходить звену на свежий воздух
        Рк.вых -> 10
        -----
        Время пребывания на месте выполнения задания, мин
        ∆Траб -> 11
        -----
        Общее время пребывания в непригодной для дыхания среде, мин
        ∆Тобщ -> 12
        -----
        Ожидаемое время возвращения, час., мин
        Твозвр -> 13
        -----
        Время подачи команды постовым на возвращение звена ГДЗС, час., мин
        Тк.вых -> 14
        
        
        """
        
        //        (∆TimeWork:Int,∆TimeAll:Int,TimeReturn:Int,TimeExit:Int)
        //            |----------------------|
        //        В разделе 11 указать: ∆Траб = (∆TimeWork)
        //        |----------------------|
        //        В разделе 12 указать: ∆Тобщ = (∆TimeAll)
        //        |----------------------|
        //        В разделе 13 указать: Твозвр = (TimeReturn)
        //        |----------------------|
        //        В разделе 14 указать: Тк.вых = (TimeExit)
        //        |----------------------|
    return """
        При \(Pexit)Bar звено ГДЗС должно покидать НДДС если очаг не будет найден
        Если очаг не найден в \(delT) подается команда на возвращение!
        Ожидаемое время возвращения \(approximateTimeExit)
        """
        
        
        
        
    }
    func isFound(Pexit: Int, timeWork: Int,approximateTimeExit: String )-> String! {
        return """
        При \(Pexit) Bar звено ГДЗС должно покидать НДДС при работе у очага
        У очага звено ГДЗС должно работать \(timeWork) мин
        В \(approximateTimeExit) подается команда на выход из НДДС при работе у очага
        """
    }
}
class SettlementSolution {
    func ifNoFoundHearth(Pmin:Int, Tall: Int,Pmax: Int, Pexit: Int,Twork: Int,Compl: Bool, timeOn: String, TimeExit: String, TimeExitWork: String)-> String! {
        let NewCaFu = newCalc()
        return """
        1. ∆Тобщ. = ((Рмин.вкл - Руст.раб.ред)*(Vб))/(Q * Ксж) = ((\(Pmin) - \(NewCaFu.reducerPressure))*(\(NewCaFu.vBallons)))/(\(NewCaFu.airFlow) * \(NewCaFu.compressionFactor)) = \(Tall) Мин
        
        2. Твзвр = Твкл + ∆Тобщ = \(timeOn) + \(Tall) = \(TimeExit)
        
        3. Рмакс.пад = Рмин.вкл - Руст.раб.ред / \(Compl ? "3":"2.5") = \(Pmin) - \(NewCaFu.reducerPressure) / \(Compl ? "3":"2.5") = \(Pmax) Bar
        
        4. Рк.вых = Рмин.вкл - Рмакс.пад = \(Pmin) - \(Pmax) = \(Pexit) Bar
        
        5. ∆Траб = Рмакс.пад * Vб / Q * Ксж =  (\(Pmax) * \(NewCaFu.vBallons))/(\(NewCaFu.airFlow) * \(NewCaFu.compressionFactor)) = \(Twork) Мин
        
        6. Твых = Твыкл + ∆Траб =  \(timeOn) + \(Twork) = \(TimeExitWork)
        
        """
    }
    func calculationOfAir(ffInt: Int)-> String! {
            var label = ""
            let ff_info = CalculationInfo.CalculationInform
            switch ffInt {
            case 2:
                label = """
                7. \(ff_info.FireFighter1!)-\(ff_info.p1Hearth!) = \(ff_info.FireFighter1! - ff_info.p1Hearth!)bar
                   \(ff_info.FireFighter2!)-\(ff_info.p2Hearth!) = \(ff_info.FireFighter2! - ff_info.p2Hearth!)bar
                
                """
            case 3:
                label = """
                7. \(ff_info.FireFighter1!)-\(ff_info.p1Hearth!) = \(ff_info.FireFighter1! - ff_info.p1Hearth!)bar
                   \(ff_info.FireFighter2!)-\(ff_info.p2Hearth!) = \(ff_info.FireFighter2! - ff_info.p2Hearth!)bar
                   \(ff_info.FireFighter3!)-\(ff_info.p3Hearth!) = \(ff_info.FireFighter3! - ff_info.p3Hearth!)bar
                
                """
            case 4:
                 label = """
                 7. \(ff_info.FireFighter1!)-\(ff_info.p1Hearth!) = \(ff_info.FireFighter1! - ff_info.p1Hearth!)bar
                    \(ff_info.FireFighter2!)-\(ff_info.p2Hearth!) = \(ff_info.FireFighter2! - ff_info.p2Hearth!)bar
                    \(ff_info.FireFighter3!)-\(ff_info.p3Hearth!) = \(ff_info.FireFighter3! - ff_info.p3Hearth!)bar
                    \(ff_info.FireFighter4!)-\(ff_info.p4Hearth!) = \(ff_info.FireFighter4! - ff_info.p4Hearth!)bar
                
                """
            case 5:
                 label = """
                 7. \(ff_info.FireFighter1!)-\(ff_info.p1Hearth!) = \(ff_info.FireFighter1! - ff_info.p1Hearth!)bar
                    \(ff_info.FireFighter2!)-\(ff_info.p2Hearth!) = \(ff_info.FireFighter2! - ff_info.p2Hearth!)bar
                    \(ff_info.FireFighter3!)-\(ff_info.p3Hearth!) = \(ff_info.FireFighter3! - ff_info.p3Hearth!)bar
                    \(ff_info.FireFighter4!)-\(ff_info.p4Hearth!) = \(ff_info.FireFighter4! - ff_info.p4Hearth!)bar
                    \(ff_info.FireFighter5!)-\(ff_info.p5Hearth!) = \(ff_info.FireFighter5! - ff_info.p5Hearth!)bar
                """
            default: print("errorFF_chet")
        }
        return label
    }
    //1.Сложность 2. Максимальное падение 3. Минимальное у очага 4. Объем баллонов 5. Средний расход 6. Коэф сжатия 7. РЕдуктор  8. Время работы у очага 9. Максимальное падение для выхода
    func ochag(booling:Bool, Pmax: Int, Pmin: Int,THearthWorks: Int, PmaxD: Int, TimeHearts: String, TimeWork: String)-> String! {
        var Pexit = ""
        let NewCaFu = newCalc()
        switch booling {
        case true: Pexit = "Pмакс.пад + Pмакс.пад + \(NewCaFu.reducerPressure) = 2 * Pмакс.пад + \(NewCaFu.reducerPressure) = 2 * \(Pmax) + \(NewCaFu.reducerPressure) = \(PmaxD) Bar"
            
        case false: Pexit = "Pмакс.пад + Pмакс.пад / 2 + \(NewCaFu.reducerPressure) = 1.5 * Pмакс.пад + \(NewCaFu.reducerPressure) = 1.5 * \(Pmax) + \(NewCaFu.reducerPressure) = \(PmaxD)  Bar"
        }
        
        let x = """
        Если Рк.вых меньше 50, то Рк.вых равен 50 Bar
        
        8. Рк.вых = \(Pexit)
        
        9. ∆Траб.оч = (Рмин.у.оч - Рк.вых)*Vбал/Q * Ксж = ((\(Pmin) - \(PmaxD))*\(NewCaFu.vBallons)) / (\(NewCaFu.airFlow) * \(NewCaFu.compressionFactor)) = \(THearthWorks) Мин

        10. Тк.вых = Ту.оч + ∆Траб.оч = \(TimeHearts) + \(THearthWorks) = \(TimeWork)
        
        """
        return x
    }
}
//        1.1 ∆Тобщ. = ((Рмин.вкл - Руст.раб.ред)*(Vб))/(Q * Ксж) = ((\(CalcFunc.Pmin) - \(CalcFunc.Pust))*(\(CalcFunc.V)))/(\(CalcFunc.Q) * \(CalcFunc.Kszh)) = \(CalcFunc.Tall) Мин
