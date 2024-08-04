//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zak Ashour on 5/27/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var billValue: Double = 0.0
    var tipValue: Float = 0.0
    var splitValue: Int = 0
    let calculatorBrain = CalculatorBrain()
    
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("b: \(billValue), t: \(tipValue), s: \(splitValue)")
        totalLabel.text = String(calculatorBrain.calculateSplit(b:billValue, t: tipValue, s: splitValue))
        let tipString = String(format: "%.0f", (tipValue * 100.00))
        settingsLabel.text = "Split between \(splitValue) people, with \(tipString)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
