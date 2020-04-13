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
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
 
  @IBAction func numbers(_ sender: UIButton) {
    
    if performingMath == true {
      label.text = String(sender.tag)
      numberOnScreen = Double(label.text!)!
      performingMath = false
    }
    else
    {
      label.text = label.text! + String(sender.tag)
      numberOnScreen = Double(label.text!)!
    }
  }
  
//refactor into a switch statement
  @IBAction func buttons(_ sender: UIButton) {
    let equalSignTag = 14
    let resetButtonTag = 15
    
    if label.text != nil && sender.tag != equalSignTag && sender.tag != resetButtonTag {
      
      previousNumber = Double(label.text!)!
      
      if sender.tag == 10 //Divide
      {
        label.text = "/"
      }
      
      else if sender.tag == 11 //Multiply
      {
        label.text = "X"
      }
      
      else if sender.tag == 12 //Minus
      {
        label.text = "-"
      }
      
      else if sender.tag == 13 //Plus
      {
        label.text = "+"
      }
      operation = sender.tag
      performingMath = true
    }
    else if sender.tag == 14 {
      if operation == 10
      {
        label.text = String(previousNumber / numberOnScreen)
      }
      else if operation == 11
      {
        label.text = String(previousNumber * numberOnScreen)
      }
      else if operation == 12
      {
        label.text = String(previousNumber - numberOnScreen)
      }
      else if operation == 13
      {
        label.text = String(previousNumber + numberOnScreen)
      }
    }
    else if sender.tag == 15
    {
      label.text = ""
      previousNumber = 0
      numberOnScreen = 0
      operation = 0
    }
  }
 
  /*
  let division = {
    (numOne: Int, numTwo: Int) -> Int in
    return numOne / numTwo
  }
  
  let multipication = {
    (numOne: Int, numTwo: Int) -> Int in
    return numOne * numTwo
  }
  
  let addition = {
    (numOne: Int, numTwo: Int) -> Int in
    return numOne + numTwo
  }
  
  let subtraction = {
    (numOne: Int, numTwo: Int) -> Int in
    return numOne - numTwo
  }
*/
  
}
