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
   var dotIsPlaced = false
   var currentInput: Double {
      get {
         return Double(displayResultLabel.text!)!
      }
      set {
         let value = "\(newValue)"
         let valueArray = value.componentsSeparatedByString(".")
         if valueArray[1] == "0" {
           displayResultLabel.text = "\(valueArray[0])"
         } else {
            displayResultLabel.text = "\(newValue)"
         }
         stillTyping = false
      }
   }
   override func preferredStatusBarStyle() -> UIStatusBarStyle {
      return .LightContent
   }
   override func prefersStatusBarHidden() -> Bool {
      return true
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
     dotIsPlaced = false
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
      dotIsPlaced = false
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
    
   @IBAction func clearButtonPressed(sender: UIButton) {
      firstOperand = 0
      secondOperand = 0
      currentInput = 0
      displayResultLabel.text = "0"
      stillTyping = false
      operationSign = ""
      dotIsPlaced = false
   }
   @IBAction func plusMinusButtonPressed(sender: UIButton) {
      currentInput = -currentInput
   }
   @IBAction func PersentageButtonPressed(sender: UIButton) {
      if firstOperand == 0{
         currentInput = currentInput/100
      } else {
         secondOperand = firstOperand * currentInput / 100
      }
      stillTyping = false
   }
   @IBAction func squareRootButtonPressed(sender: UIButton) {
      currentInput = sqrt(currentInput)
   }
   @IBAction func dotButtonPresed(sender: UIButton) {
      if stillTyping && !dotIsPlaced {
         displayResultLabel.text = displayResultLabel.text! + "."
         dotIsPlaced = true
      } else if !stillTyping && !dotIsPlaced {
         displayResultLabel.text = "0."
         stillTyping = true
      }
   }
  

}

