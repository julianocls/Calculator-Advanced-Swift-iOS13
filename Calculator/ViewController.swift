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
    
    var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let safeSymbol = sender.currentTitle {
            if safeSymbol == "+/-" {
                displayLabel.text = displayLabel.text?.first == "-" ? displayLabel.text?.replacingOccurrences(of: "-", with: "") : "-\(displayLabel.text ?? "0")"
            } else {
                isFinishedTypingNumber = true
                if safeSymbol == "AC" {
                    displayLabel.text = "0"
                }
                
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let safeNum = sender.currentTitle {
            if isFinishedTypingNumber && safeNum != "." {
                displayLabel.text = safeNum
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

