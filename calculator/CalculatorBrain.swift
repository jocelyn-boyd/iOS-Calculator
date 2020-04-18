//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Jocelyn Boyd on 4/13/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation

struct CalculatorBrain {
  
  //custom object to help perform calculations
  private struct BinaryOperation {
    let firstNumber: Double
    let closure: (Double, Double) -> Double
    
    func performCalculation(with secondNum: Double) -> Double {
      return closure(firstNumber, secondNum)
    }
  }
  
  
  //make a dictionary to map the operation string (+,-,*,/) to the actual operation
  let operationsDict: [String: (Double, Double) -> Double] = [
    "+":{$0 + $1},
    "-": {$0 - $1},
    "*": {$0 * $1},
    "/": {$0 / $1}]
  
  
  //current result at any point
  private var internalResult: Double?
  
  
  //current operation thats ongoing
  private var currentOperation: BinaryOperation?
  
  
  //public number to be displayed in VC
  var currentNumber: Double? {
    return internalResult
  }
  
  
  private mutating func performCurrentOperation() {
    if currentOperation != nil && internalResult != nil {
      self.internalResult = currentOperation?.performCalculation(with: internalResult!)
      currentOperation = nil
      
    }
  }
  
  
  //public functions to be called in VC
  public mutating func setInitialResult(_ num: Double) {
    self.internalResult = num
  }

  
  //main function to do everything
  public mutating func calculate(_ symbol: String) {
    if let operation = operationsDict[symbol] {
      if let internalResult = internalResult {
        self.currentOperation = BinaryOperation(firstNumber: internalResult, closure: operation)
      }
      
    } else if symbol == "=" {
      performCurrentOperation()
      
      //clear current operation and result
    } else if symbol == "C" {
      self.internalResult = nil
      self.currentOperation = nil
    }
  }
  
  
}
