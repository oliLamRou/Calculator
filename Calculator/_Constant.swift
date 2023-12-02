//
//  _Constant.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import SwiftUI
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
        case .clear, .invert, .percent:
            return .buttonGray
        case .divide, .multiply, .minus, .add, .equal:
            return .buttonOrange
        default:
            return .buttonDarkGray
        }
    }
    
    var buttonWidth: CGFloat {
        switch self {
        case .zero:
            return (buttonHeight * 2) + (buttonPadding * 2)
        default:
            return buttonHeight
        }
    }

    var buttonHeight: CGFloat {
        90
    }
    
    var buttonPadding: CGFloat {
        4
    }
}

let buttonLayout: [[buttons]] = [
    [.clear, .invert, .percent, .divide],
    [.seven, .eigh, .nine, .multiply],
    [.four, .five, .six, .minus],
    [.one, .two, .three, .add],
    [.zero, .dot, .equal]
]
