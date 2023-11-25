//
//  _Constant.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-25.
//

import Foundation

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

let buttons = [
    button(label: "c")
    button(label: "/")
    button(label: "%")
    button(label: "÷")
    button(label: "9")
    button(label: "8")
    button(label: "7")
    button(label: "x")
    button(label: "6")
    button(label: "5")
    button(label: "4")
    button(label: "-")
    button(label: "3")
    button(label: "2")
    button(label: "1")
    button(label: "+")
    button(label: "0")
    button(label: ".")
    button(label: "=")
]
