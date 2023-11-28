//
//  ContentView.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-23.
//

import SwiftUI

struct CalculatorView: View {
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
    
    @ObservedObject var calculatorLogic: CalculatorLogic
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let buttonPadding: CGFloat = 0
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(calculatorLogic.resultFormatted)
                        .font(.system(size: 80))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, -10)
                        .padding(.horizontal)
                    
                }
                VStack(spacing: buttonPadding) {
                    ForEach(buttonLayout, id: \.self) { row in
                        HStack(spacing: buttonPadding) {
                            ForEach(row, id: \.self) { op in
                                Button {
                                    
                                } label: {
                                    ZStack {
                                        //then be easy to set w and h base on display size
                                        RoundedRectangle(cornerRadius: op.buttonHeight)
                                            .frame(
                                                width: op.buttonWidth,
                                                height: op.buttonHeight
                                            )
                                            .foregroundStyle(op.buttonColor)
                                        Text(op.rawValue)
                                            .font(.largeTitle)
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                                }.padding(op.buttonPadding)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView(calculatorLogic: CalculatorLogic())
}
