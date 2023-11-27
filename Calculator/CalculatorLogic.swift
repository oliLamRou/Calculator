//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import Foundation

class CalculatorLogic: ObservableObject {
    @Published var result: String = "0"
    @Published var userInput: String = "1"
    @Published var isUserInput = false
    
    var resultFormatted: String {
        if isUserInput {
            return userInput
        }
        return result
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
