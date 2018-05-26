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
    func ifNoFoundHearth(Pmin:Int, Pred: Int, Vbal: Double, Qair: Int, Kzh: Double, Tall: Int,Pmax: Int, Pexit: Int,Twork: Int,Compl: Bool, timeOn: String, TimeExit: String, TimeExitWork: String)-> String! {
        return """
        1. ∆Тобщ. = ((Рмин.вкл - Руст.раб.ред)*(Vб))/(Q * Ксж) = ((\(Pmin) - \(Pred))*(\(Vbal)))/(\(Qair) * \(Kzh)) = \(Tall) Мин
        
        2. Твзвр = Твкл + ∆Тобщ = \(timeOn) + \(Tall) = \(TimeExit)
        
        3. Рмакс.пад = Рмин.вкл - Руст.раб.ред / \(Compl ? "3":"2.5") = \(Pmin) - \(Pred) / \(Compl ? "3":"2.5") = \(Pmax) Bar
        
        4. Рк.вых = Рмин.вкл - Рмакс.пад = \(Pmin) - \(Pmax) = \(Pexit) Bar
        
        5. ∆Траб = Рмакс.пад * Vб / Q * Ксж =  (\(Pexit) * \(Vbal))/(\(Qair) * \(Kzh)) = \(Twork) Мин
        
        6. Твых = Твыкл + ∆Траб =  \(timeOn) + \(Twork) = \(TimeExitWork)
        
        """
    }
    func calculationOfAir(ffInt: Int,ff1: Int,ff2: Int,ff3: Int,ff4: Int,ff5: Int,ffp1: Int,ffp2: Int,ffp3: Int,ffp4: Int,ffp5: Int)-> String! {
            var label = ""
            switch ffInt {
            case 2:
                label = """
                7.\(ff1) - \(ffp1) = \(ff1 - ffp1) Bar
                  \(ff2) - \(ffp2) = \(ff2 - ffp2) Bar
                
                """
            case 3:
                label = """
                7.\(ff1) - \(ffp1) = \(ff1 - ffp1) Bar
                  \(ff2) - \(ffp2) = \(ff2 - ffp2) Bar
                  \(ff3) - \(ffp3) = \(ff3 - ffp3) Bar
                
                """
            case 4:
                 label = """
                 7.\(ff1) - \(ffp1) = \(ff1 - ffp1) Bar
                   \(ff2) - \(ffp2) = \(ff2 - ffp2) Bar
                   \(ff3) - \(ffp3) = \(ff3 - ffp3) Bar
                   \(ff4) - \(ffp4) = \(ff4 - ffp4) Bar
                
                """
            case 5:
                 label = """
                 7.\(ff1) - \(ffp1) = \(ff1 - ffp1) Bar
                   \(ff2) - \(ffp2) = \(ff2 - ffp2) Bar
                   \(ff3) - \(ffp3) = \(ff3 - ffp3) Bar
                   \(ff4) - \(ffp4) = \(ff4 - ffp4) Bar
                   \(ff5) - \(ffp5) = \(ff5 - ffp5) Bar
                """
            default: print("errorFF_chet")
        }
        return label
    }
    //1.Сложность 2. Максимальное падение 3. Минимальное у очага 4. Объем баллонов 5. Средний расход 6. Коэф сжатия 7. РЕдуктор  8. Время работы у очага 9. Максимальное падение для выхода
    func ochag(booling:Bool, Pmax: Int, Pmin: Int, Vb: Int, Q: Int,Kzh: Int, StabilWork: Int,THearthWorks: Int, PmaxD: Int, TimeHearts: String, TimeWork: String)-> String! {
        var Pexit = ""
        switch booling {
        case true: Pexit = "Pмакс.пад + Pмакс.пад + \(StabilWork) = 2 * Pмакс.пад + \(StabilWork) = 2 * \(Pmax) + \(StabilWork) = \(PmaxD) Bar"
            
        case false: Pexit = "Pмакс.пад + Pмакс.пад / 2 + \(StabilWork) = 1.5 * Pмакс.пад + \(StabilWork) = 1.5 * \(Pmax) + \(StabilWork) = \(PmaxD)  Bar"
        }
        
        let x = """
        8. Рк.вых = \(Pexit)
        
        9. ∆Траб.оч = (Рмин.у.оч - Рк.вых)*Vбал/Q * Ксж = (\(Pmin) - \(Pexit))/\(Vb)/ (\(Q) * \(Kzh)) = \(THearthWorks) Мин

        10. Тк.вых = Ту.оч + ∆Траб.оч = \(TimeHearts) + \(THearthWorks) = \(TimeWork)
        
        """
        return x
    }
}
