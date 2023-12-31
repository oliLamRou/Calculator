//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import Foundation

class CalculatorLogic: ObservableObject {
    @Published var number: String?
    private var result: String?
    private var userInput: String?
    
    private var isUserInput = false
    private var currentOp: buttons?
    
    func result(_ op: buttons) {
        switch op {
        case .divide, .multiply, .add, .minus:
            result = userInput ?? "0"
            userInput = nil
            isUserInput = false
            currentOp = op
        case .one ,.two, .three, .four, .five, .six, .seven, .eigh, .nine, .zero:
            isUserInput = true
            userInput = (userInput ?? "") + op.rawValue
        case .dot:
            isUserInput = true
            if let userInput = userInput, !userInput.contains(where: { $0 == "."}) {
                self.userInput! += "."
            }
        case .clear:
            if isUserInput {
                isUserInput = false
                userInput = nil
            } else {
                result = nil
            }
        case .invert:
            if isUserInput {
                userInput = String(Double(userInput ?? "0")! * -1)
            } else {
                result = String(Double(result ?? "0")! * -1)
            }
            
        case .percent:
            if isUserInput {
                userInput = String(Double(userInput ?? "0")! * 0.01)
            } else {
                result = String(Double(result ?? "0")! * 0.01)
            }
            
        case .equal:
            var floatResult: Double = 0.0
            let A = Double(result ?? "0")!
            let B = Double(userInput ?? "0")!
            
            switch currentOp {
            case .divide:
                floatResult = A / B
            case .multiply:
                floatResult = A * B
            case .add:
                floatResult = A + B
            case .minus:
                floatResult = A - B
            default:
                print("nothing")
            }
            
            result = String(floatResult)
            isUserInput = false
        }
        
        if isUserInput {
            number = userInput
        } else {
            number = result
        }
        
    }    
}
