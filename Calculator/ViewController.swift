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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
      
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                //displayLabel.text = displayLabel.text?.first == "-" ? displayLabel.text?.replacingOccurrences(of: "-", with: "") : "-\(displayLabel.text ?? "0")"
                displayValue *= -1
                
            } else if calcMethod == "%" {
                displayValue *= 0.01
                
            } else {
                isFinishedTypingNumber = true
                if calcMethod == "AC" {
                    displayValue = 0
                }
                
            }
            
        }
        
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

