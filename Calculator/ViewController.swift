//
//  ViewController.swift
//  Calculator
//
//  Created by pavel on 7/19/16.
//  Copyright © 2016 pavel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// label 0 and so on
    @IBOutlet weak var displayResultLabel: UILabel!
   var stillTyping = false // check zero
   var firstOperand: Double = 0 // for few numbers
   var secondOperand: Double = 0
   var operationSign: String = ""
   var currentInput: Double {
      get {
         return Double(displayResultLabel.text!)!
      }
      set {
         displayResultLabel.text = "\(newValue)"
         stillTyping = false
      }
   }
    
    @IBAction func numberPressed(sender: UIButton) {
      
        
      let number = sender.currentTitle!
      if stillTyping {
         if displayResultLabel.text?.characters.count < 20 {
            
            displayResultLabel.text = displayResultLabel.text! + number
         }
      } else {
         displayResultLabel.text = number
         stillTyping = true
      }
   }
    
   @IBAction func twoOperandsSignPressed(sender: UIButton) {
      operationSign = sender.currentTitle!
      firstOperand = currentInput
     
      stillTyping = false
   }
   func oprateWithTwoOperands(operation: (Double,Double)->Double){
      currentInput = operation(firstOperand, secondOperand)
      stillTyping = false
   }
   
    @IBAction func equalitySignPressed(sender: UIButton) {
      
      if stillTyping {
         secondOperand = currentInput
      }
      switch  operationSign {
         
      case "+":
         oprateWithTwoOperands{$0 + $1}
      case "-":
         oprateWithTwoOperands{$0 - $1}
      case "÷":
         oprateWithTwoOperands{$0 / $1}
      case "✕":
         oprateWithTwoOperands{$0 * $1}
      default:
         break
      }
    }
    
  

}

