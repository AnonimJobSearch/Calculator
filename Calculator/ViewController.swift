//
//  ViewController.swift
//  Calculator
//
//  Created by pavel on 7/19/16.
//  Copyright © 2016 pavel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    
    @IBAction func numberPressed(sender: UIButton) {
      
        
      let number = sender.currentTitle!
      if displayResultLabel.text?.characters.count < 20 {
      
        displayResultLabel.text = displayResultLabel.text! + number
      }
   }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

