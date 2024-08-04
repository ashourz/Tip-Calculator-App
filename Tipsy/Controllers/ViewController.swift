//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var calculatorBrain = CalculatorBrain()
    
    var billTotal: Double = 0.0
    var tipValue: Float = 0.0
    var splitValue: Int = 0
    
    override func viewDidLoad() {
        splitValue = Int(splitNumberLabel.text ?? "0") ?? 0
        updateTipAmount()
        updateBillAmount()
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        updateBillAmount()
        self.performSegue(withIdentifier: "showSplitResults", sender: self)
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        resetButtons()
        sender.isSelected = true
        updateTipAmount()
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateStepAmount(newValue: sender.value)
        splitNumberLabel.text = String(splitValue)
        billTextField.endEditing(true)
    }
    
    func resetButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier){
        case "showSplitResults":
            let destinationVC =  segue.destination as! ResultsViewController
            destinationVC.billValue = billTotal
            destinationVC.tipValue = tipValue
            destinationVC.splitValue = splitValue
        default: return
        }
    }
    
    func updateTipAmount(){
        tipValue = if(zeroPctButton.isSelected){
            0.0
        }else if(tenPctButton.isSelected){
            0.1
        }else if(twentyPctButton.isSelected){
            0.2
        }else{
            0.0
        }
    }
    
    func updateBillAmount(){
        billTotal = Double(billTextField.text ?? "0.0") ?? 0.0
    }
    
    func updateStepAmount(newValue: Double){
        splitValue = Int(newValue)
    }
}

