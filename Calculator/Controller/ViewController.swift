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
            guard let number = Double(displayLabel.text!) else { fatalError("Cannot convert display label to a double") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    fileprivate func extractedFunc(_ sender: UIButton) {
        if let calcMethod = sender.currentTitle {
            
            calculator.setNumber(displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculate is nil")
            }
            displayValue = result
            
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
      
        extractedFunc(sender)
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let safeNum = sender.currentTitle {
            if isFinishedTypingNumber {
                if safeNum != "." {
                    displayLabel.text = safeNum
                } else {
                    displayLabel.text?.append(safeNum)
                }
                isFinishedTypingNumber = false
            } else {
                if !(safeNum == "." && havePoint()) {
                    displayLabel.text?.append(safeNum)
                }
            }
        }
    }
    
    fileprivate func havePoint() -> Bool {
        return displayLabel.text?.firstIndex(of: ".") != nil
    }
}

