//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Zak Ashour on 5/27/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    mutating func setTipPercentageFromLabel(l label: String) -> Float{
        return switch label{
        case "0%": 0.0
        case "10%": 0.1
        case "20%": 0.2
        default: 0.0
        }
    }
    
    func calculateSplit(b billTotal: Double, t tipValue: Float, s splitValue: Int) -> String{
        let total = (billTotal * (1.0 + Double(tipValue))) / Double(splitValue)
        return String(format: "%.2f", total)
    }
    
}
