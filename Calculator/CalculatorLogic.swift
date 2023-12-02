//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import Foundation

class CalculatorLogic: ObservableObject {
    @Published var result: String = "0"
    @Published var userInput: String?
    @Published var isUserInput = false
    private var currentOp: buttons?
    
    var resultFormatted: String {
        if isUserInput {
            if let userInput = userInput {
                return userInput
            }
            return "0"
        }
        return result
    }
    
    func result(_ op: buttons) {
        switch op {
        case .clear:
            userInput = "0"
        case .invert:
            if isUserInput {
                userInput = String(Float(userInput)! * -1)
            } else {
                result = String(Float(result)! * -1)
            }
        case .percent:
            if isUserInput {
                userInput = String(Float(userInput)! / 100)
            } else {
                result = String(Float(result)! / 100)
            }

        case .add, .minus, .multiply, .divide:
            currentOp = op
        case .equal:
            print(op.rawValue)
        case .dot:
            print("dot")
            if !userInput.contains(where: {$0 == "."}) {
                userInput += op.rawValue
            }
                
        default:
            if isUserInput {
                userInput += op.rawValue
            } else {
                isUserInput = true
                userInput = op.rawValue
            }
        }
    }
    
    func numberButton(_ index: Int) {
        if index == 0 {
            isUserInput = false
            return
        }
        
//        if [4,5,6,8,9,10,12,13,14,16,17].contains(where: { $0 == index }){
//            if !isUserInput {
//                userInput = calculatorButtons[index]
//                isUserInput = true
//                return
//            }
//            userInput = userInput + calculatorButtons[index]
//        }
    }
    
}
