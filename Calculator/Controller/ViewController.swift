//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(String(newValue).prefix(14))
        }
    }
    
    private var calculator = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
 
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue != "." {
                    displayLabel.text = numValue
                } else {
                    displayLabel.text?.append(numValue)
                }
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    //let isInt = floor(displayValue) == displayValue
                    if havePoint() {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
    private func havePoint() -> Bool {
        return displayLabel.text?.firstIndex(of: ".") != nil
    }
}

