//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Juliano Santos on 1/2/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
   
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
            
            if symbol == "+/-" {
                //displayLabel.text = displayLabel.text?.first == "-" ? displayLabel.text?.replacingOccurrences(of: "-", with: "") : "-\(displayLabel.text ?? "0")"
                return Double(number * -1)
                
            } else if symbol == "%" {
                return Double(number * 0.01)
                
            } else {
                //isFinishedTypingNumber = true
                if symbol == "AC" {
                    return 0
                }
                
            }
            
        return nil
    }
    
}
