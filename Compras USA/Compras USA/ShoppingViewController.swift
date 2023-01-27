//
//  ViewController.swift
//  Compras USA
//
//  Created by Vinicius Loss on 23/01/23.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }
    
    func setAmmount(){
        //tc.dolar = Double(tfDolar.text!)!
        
        // captura valor gasto em dolares e passa para classe TaxesCalculator, convertendo string em double
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        
        // Seta a label valor gasto em reais, com o valor gasto em dolar, multiplicado pelo valor do dolar atual
        // além de passar no metodo o simbolo da moeda desejada com o Formatted
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")

        
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }

}

