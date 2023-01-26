//
//  TaxesCalculator.swift
//  Compras USA
//
//  Created by Vinicius Loss on 26/01/23.
//

import Foundation

class TaxesCalculator {
    
    //singleton
    static let shared = TaxesCalculator()
    
    var dolar: Double = 5.07
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    // variável computada
    var shoppingValueInReal: Double {
        return dolar * shoppingValue
    }

    var stateTaxValue: Double {
        return stateTax * shoppingValue / 100
    }

    var iofValue: Double {
        return (shoppingValue + stateTax) * iof / 100
    }
    
    func calculate(usingCreditCard: Bool) -> Double{
        var finalValue = shoppingValue + stateTaxValue
        
        if usingCreditCard {
            finalValue += iofValue
        }
        
        return finalValue
    }
    
    private init(){
        
    }
    
}
