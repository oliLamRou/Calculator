//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        let calculatorLogic = CalculatorLogic()
        
        WindowGroup {
            CalculatorView(calculatorLogic: calculatorLogic)
        }
    }
}
