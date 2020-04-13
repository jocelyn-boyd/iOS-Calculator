//
//  ViewController.swift
//  calculator
//
//  Created by Jocelyn Boyd on 4/9/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var numberOnScreen: Double = 0
  var previousNumber: Double = 0
  var performingMath = false
  var operation = 0
  
  @IBOutlet weak var numbersLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func numbers(_ sender: UIButton) {
    
    if performingMath == true {
      numbersLabel.text = String(sender.tag)
      numberOnScreen = Double(numbersLabel.text!)!
      performingMath = false
    } else {
      numbersLabel.text = numbersLabel.text! + String(sender.tag)
      numberOnScreen = Double(numbersLabel.text!)!
    }
  }
  

  @IBAction func buttons(_ sender: UIButton) {
    let divisionTag = 10
    let multipyTag = 11
    let subtractionTag = 12
    let additionTag = 13
    let equalSignTag = 14
    let resetButtonTag = 16
    let operationsTag = sender.tag
    
    let addition = {
      (numOne: Int, numTwo: Int) -> Int in
      return numOne + numTwo
    }
    
    if numbersLabel.text != nil && sender.tag != equalSignTag && sender.tag != resetButtonTag {
      guard numbersLabel.text != nil else { return }
      switch operationsTag {
      case divisionTag:
        numbersLabel.text = "/"
      case multipyTag:
        numbersLabel.text = "x"
      case subtractionTag:
        numbersLabel.text = "-"
      case additionTag:
        numbersLabel.text = "+"
      default:
        clearNumbersOnScreen()
      }
      performingMath = true
    }
  
    
    if sender.tag == equalSignTag {
      switch operationsTag {
      case additionTag:
        let result = addition(Int(previousNumber), Int(numberOnScreen))
        print("\(numbersLabel.text = result.description)")
      default:
        clearNumbersOnScreen()
      }
    }
    
    
  }
  
  
  private func clearNumbersOnScreen() {
    numbersLabel.text = ""
    previousNumber = 0
    numberOnScreen = 0
    operation = 0
    performingMath = false
  }
  
}
