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
                                    Button {
                                        
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 50)
                                                .frame(width: 180, height: 82)
                                                .foregroundColor(.buttonDarkGray)
                                            Text(op.rawValue)
                                                .font(.largeTitle)
                                                .foregroundStyle(.white)
                                                .padding()
                                        }
                                    }
                                }else {
                                    Button {
                                        
                                    } label: {
                                        ZStack {
                                            /*:
                                             - somehow can use button shape directly
                                             - then be easy to set w and h base on display size 
                                             
                                             */
                                            Circle().foregroundStyle(op.buttonColor)
                                            Text(op.rawValue)
                                                .font(.largeTitle)
                                                .foregroundStyle(.white)
                                                .padding()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CalculatorView(calculatorLogic: CalculatorLogic())
}
