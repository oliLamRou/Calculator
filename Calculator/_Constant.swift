//
//  _Constant.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import SwiftUI

let calculatorButtons = [
        "c", "+/-", "%", "÷",
        "9", "8", "7", "x",
        "6", "5", "4", "-",
        "3", "2", "1", "+",
        "0", ".", "="
]

enum buttonType {
    case number, math, equal, clear
}

enum buttonColor {
    case orange, gray, darkGray, black, white
}

struct button: Identifiable {
    let label: String
    let type: buttonType
    let color: buttonColor
    let id: Int
}

enum buttons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eigh = "8"
    case nine = "9"
    case zero = "0"
    case dot = "."
    case clear = "c"
    case invert = "+/-"
    case equal = "="
    case percent = "%"
    case divide = "÷"
    case multiply = "x"
    case add = "+"
    case minus = "-"
    
    var buttonColor: Color {
        switch self {
        case .add, .clear:
            return .red
        default:
            return .green
        }
    }
}

let buttonLayout: [[buttons]] = [
    [.clear, .invert, .percent, .divide],
    [.seven, .eigh, .nine, .multiply],
    [.four, .five, .six, .minus],
    [.one, .two, .three, .add],
    [.zero, .dot, .equal]
]
