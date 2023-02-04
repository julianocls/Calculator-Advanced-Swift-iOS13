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
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return Double(n * -1)
            case "%":
                return Double(n * 0.01)
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculatio(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculatio(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let symbol = intermediateCalculation?.calcMethod {
            switch symbol {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed does not match any of the cases!")
                break
            }
        }
        
        return nil
    }
    
}
