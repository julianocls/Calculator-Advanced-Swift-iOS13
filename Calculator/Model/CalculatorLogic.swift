//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Juliano Santos on 1/2/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        guard let safeNumber = number else { return nil }
            
        if symbol == "+/-" {
            //displayLabel.text = displayLabel.text?.first == "-" ? displayLabel.text?.replacingOccurrences(of: "-", with: "") : "-\(displayLabel.text ?? "0")"
            return Double(safeNumber * -1)
            
        } else if symbol == "%" {
            return Double(safeNumber * 0.01)
            
        } else if symbol == "AC" {
            return 0
            
        } else if symbol == "+" {
            
        } else if symbol == "=" {

        }

        return nil
    }
    
}
