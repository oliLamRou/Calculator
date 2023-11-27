//
//  ContentView.swift
//  Calculator
//
//  Created by Olivier Lambert Rouillard on 2023-11-23.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var calculatorLogic: CalculatorLogic
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var zeroButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 175, height: 82)
                .foregroundColor(.buttonDarkGray)
            Text(calculatorButtons[16])
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text(calculatorLogic.resultFormatted)
                    .font(.system(size: 80))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.vertical, -10)
                
                VStack {
                    ForEach(buttonLayout, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { op in
                                if op.rawValue == buttons.zero.rawValue {
                                    
                                }else {
                                    calculatorButton(0)
                                }

                            }
                        }
                    }
                }
                
                .padding()
            }
        }
    }
        
        @ViewBuilder
        func calculatorButton(_ index: Int) -> some View {
            let value = calculatorButtons[index]
            
            var color: Color {
                if index < 3 {
                    return .buttonGray
                }
                if [3,7,11,15,18].contains(where: {$0 == index}) {
                    return .buttonOrange
                }
                return Color(.buttonDarkGray)
            }
            
            Button {
                calculatorLogic.numberButton(index)
            } label: {
                ZStack {
                    if index == 16 {
                        RoundedRectangle(cornerRadius: 50.0)
                            .foregroundStyle(color)
                            .frame(width: 100)
                    } else {
                        Circle().foregroundStyle(color)
                    }
                    Text(value)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
        }
    }

#Preview {
    CalculatorView(calculatorLogic: CalculatorLogic())
}
