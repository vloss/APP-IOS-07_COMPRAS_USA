//
//  SettingsViewController.swift
//  Compras USA
//
//  Created by Vinicius Loss on 23/01/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStateTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStateTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
    }
    
    // Toda vez que é tocado em qualquer lugar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Fecha o teclado
        view.endEditing(true)
        //setValues()
    }
    
    func setValues(){
        tc.dolar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.stateTax = tc.convertToDouble(tfStateTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate{

    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
