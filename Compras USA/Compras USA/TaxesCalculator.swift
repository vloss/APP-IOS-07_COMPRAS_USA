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
    
    var dolar: Double = 5.11
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
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
        
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) -> Double{
        
        //define formatador vazio
        formatter.numberStyle = .none
        
        // Pega a string converte em number e extrai do number um double
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        
        return formatter.string(for: value)!
    }
    
    
    private init(){
        formatter.usesGroupingSeparator = true
    }
    
}
